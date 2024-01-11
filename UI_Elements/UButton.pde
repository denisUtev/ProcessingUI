

class UButton extends UPanel {
  
  int textSize = 30;
  String text = "Button";
  color textColor = color(0);
  
  UButton(PVector pos, PVector size) {
    super(pos, size);
  }
  
  void draw() {
    color col = backgroundColor;
    if (isHovered) {
      backgroundColor = color(red(col) - 4, green(col) - 4, blue(col) - 4);
    }
    super.draw();
    backgroundColor = col;
    drawText();
  }
  
  @Override
  void draw(PGraphics pg) {
    color col = backgroundColor;
    if (isHovered) {
      backgroundColor = color(red(col) - 4, green(col) - 4, blue(col) - 4);
    }
    super.draw(pg);
    backgroundColor = col;
    drawText(pg);
  }
  
  void drawText() {
    float cx = position.x + size.x / 2;
    float cy = position.y + size.y / 2;
    textSize(textSize);
    textAlign(CENTER, CENTER);
    fill(textColor);
    text(text, cx, cy);
  }
  
  void drawText(PGraphics pg) {
    float cx = position.x + size.x / 2;
    float cy = position.y + size.y / 2;
    pg.textSize(textSize);
    pg.textAlign(CENTER, CENTER);
    pg.fill(textColor);
    pg.text(text, cx, cy);
  }
  
  @Override
  void updateShadow() {
    super.updateShadow();
    if (animateShadow && isActive) {
      posZ = defaultPosZ + 6 * sin((millis() - timeStartAnimation) / 40.0);
      if (millis() - timeStartAnimation > PI * 40) {
        animateShadow = false;
        setActive(false);
      }
    }
  }
  
  void setTextSize(int size) {
    textSize = size;
  }
  
  void setText(String t) {
    text = t;
  }
  
  void setTextColor(color t) {
    textColor = t;
  }
}
