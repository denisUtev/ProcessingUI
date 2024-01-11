

class ULabel extends UPanel {
  
  int textSize = 30;
  String text = "Text";
  color textColor = color(0);
  
  ULabel(PVector pos, PVector size) {
    super(pos, size);
  }
  
  @Override
  void draw() {
    super.draw();
    drawText();
  }
  
  @Override
  void draw(PGraphics pg) {
    super.draw(pg);
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
