

class UList extends UPanel {
  
  PVector graphicsPos;
  PGraphics pg;
  float posYNewComponent = 0;
  float gap = 5;// Расстояние между элементами списка
  float paddingX = 0;
  float paddingY = 0;
  
  UList(PVector pos, PVector size) {
    super(pos, size);
    pg = createGraphics((int)size.x, (int)size.y, P2D);
    graphicsPos = new PVector(pos.x, pos.y);
    position = new PVector(0, 0);
    roundAngles = 0;
  }
  
  @Override
  void draw() {
    pg.beginDraw();
    draw(pg);
    pg.endDraw();
    image(pg, graphicsPos.x, graphicsPos.y);
  }
  
  @Override
  void add(UPanel panel) {
    panel.setPosition(new PVector(paddingX, paddingY));
    PVector newPos = new PVector(position.x, position.y + posYNewComponent);
    panel.translate(newPos);
    panels.add(panel);
    posYNewComponent += panel.size.y + gap;
  }
  
  void setGap(int g) {
    gap = g;
  }
  
  void setPadding(int x, int y) {
    paddingX = x;
    paddingY = y;
  }
  
  void setPosition(PVector pos) {
    graphicsPos = pos;
  }
  
  void translate(PVector v) {
    graphicsPos.add(v);
  }
  
  @Override
  boolean mousePressed() {
    if (isInClick(mouse)) {
      PVector realPosMouse = new PVector(mouse.X, mouse.Y);
      mouse.setPosition(mouse.X - graphicsPos.x, mouse.Y - graphicsPos.y);
      boolean isFindedPanel = panels.stream()
        .map(a -> a.mousePressed())
        .anyMatch(a -> a == true);
      mouse.setPosition(realPosMouse.x, realPosMouse.y);
      
      
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
  
  @Override
  boolean mouseHovered() {
    if (isHovered(mouse)) {
      PVector realPosMouse = new PVector(mouse.X, mouse.Y);
      mouse.setPosition(mouse.X - graphicsPos.x, mouse.Y - graphicsPos.y);
      boolean isFindedPanel = panels.stream()
        .map(a -> a.mouseHovered())
        .anyMatch(a -> a == true);
      mouse.setPosition(realPosMouse.x, realPosMouse.y);
      
      if (!isFindedPanel) {
        isHovered = true;
        return true;
      }
    }
    
    isHovered = false;
    return false;
  }
  
  @Override
  boolean isInClick(MouseObject mouse) {
    return isRectHovered(graphicsPos, size, mouse.Position);
  }
  
  @Override
  boolean isHovered(MouseObject mouse) {
    return isRectHovered(graphicsPos, size, mouse.Position);
  }
  
}
