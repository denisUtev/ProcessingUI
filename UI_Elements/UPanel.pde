

class UPanel{
  
  ArrayList<UPanel> panels = new ArrayList<>();
  PVector position, size;
  boolean isActive = false;
  boolean isHovered = false;
  float posZ = 11;
  float defaultPosZ = 11;
  boolean animateShadow = false;
  int timeStartAnimation;
  int roundAngles = 5;
  
  color backgroundColor = color(255); 
  
  UPanel(PVector pos, PVector size) {
    position = pos;
    this.size = size;
  }
  
  void draw() {
    strokeWeight(3);
    drawShadow();
    noStroke();
    fill(backgroundColor);
    rect(position.x, position.y, size.x, size.y, roundAngles);
    
    panels.forEach(UPanel::draw);
  }
  
  void draw(PGraphics pg) {
    pg.strokeWeight(3);
    drawShadow(pg);
    pg.noStroke();
    pg.fill(backgroundColor);
    pg.rect(position.x, position.y, size.x, size.y, roundAngles);
    
    panels.forEach((panel) -> panel.draw(pg));
  }
  
  void drawShadow() {
    int count = 8;
    float maxSize = posZ;
    float cx = position.x + size.x / 2;
    float cy = position.y + size.y / 2;
    rectMode(CENTER);
    for (int i = 0; i < count; i++) {
      noStroke();
      fill(5, 8);
      rect(cx, cy + maxSize / 2, (size.x - 1 + (maxSize - i * 6)), (size.y + (maxSize - i * 6)), roundAngles);
    }
    rectMode(CORNER);
  }
  
  void drawShadow(PGraphics pg) {
    int count = 8;
    float maxSize = posZ;
    float cx = position.x + size.x / 2;
    float cy = position.y + size.y / 2;
    pg.rectMode(CENTER);
    for (int i = 0; i < count; i++) {
      pg.noStroke();
      pg.fill(5, 8);
      pg.rect(cx, cy + maxSize / 2, (size.x - 1 + (maxSize - i * 6)), (size.y + (maxSize - i * 6)), roundAngles);
    }
    pg.rectMode(CORNER);
  }
  
  void update() {
    updateShadow();
    panels.forEach(UPanel::update);
  }
  
  void updateShadow() {
    
  }
  
  boolean mousePressed() {
    if (isInClick(mouse)) {
      boolean isFindedPanel = panels.stream()
        .map(a -> a.mousePressed())
        .anyMatch(a -> a == true);
      
      if (!isFindedPanel) {
        setActive(true);
        animateShadow = true;
        timeStartAnimation = millis();
        return true;
      }
    }
    
    setActive(false);
    return false;
  }
  
  boolean mouseHovered() {
    if (isHovered(mouse)) {
      boolean isFindedPanel = panels.stream()
        .map(a -> a.mouseHovered())
        .anyMatch(a -> a == true);
      
      if (!isFindedPanel) {
        isHovered = true;
        return true;
      }
    }
    
    isHovered = false;
    return false;
  }
  
  void add(UPanel panel) {
    panel.translate(position);
    panels.add(panel);
  }
  
  void setBackground(color col) {
    backgroundColor = col;
  }
  
  void setPosZ(int z) {
    defaultPosZ = z;
    posZ = z;
  }
  
  void setPosition(PVector pos) {
    panels.forEach(a -> a.translate(pos.sub(position)));
    position = pos;
  }
  
  void translate(PVector v) {
    panels.forEach(a -> a.translate(v));
    position.add(v);
  }
  
  boolean isInClick(MouseObject mouse) {
    return isRectHovered(position, size, mouse.Position);
  }
  
  boolean isHovered(MouseObject mouse) {
    return isRectHovered(position, size, mouse.Position);
  }
  
  void setActive(boolean a) {
    isActive = a;
  }
}
