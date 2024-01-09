
MouseObject mouse;

UPanel mainPanel;

void setup(){
  size(800, 600, P2D);
  //fullScreen();
  surface.setResizable(true);
  
  mouse = new MouseObject();
  
  mainPanel = new UPanel(new PVector(0, 0), new PVector(width, height));
  mainPanel.setBackground(color(#E8E8E8));
  
  UPanel toolbarPanel = new UPanel(new PVector(0, 0), new PVector(width, 80));
  toolbarPanel.setBackground(color(255));
  mainPanel.add(toolbarPanel);
  
  UButton button1 = new UButton(new PVector(100, 100), new PVector(60, 60));
  button1.setPosZ(15);
  button1.setBackground(color(255, 95, 30));
  button1.setText("X");
  mainPanel.add(button1);
}

void draw(){
  background(#E8E8E8);
  
  mouse.setPosition(mouseX, mouseY);
  mouse.checkPress();
  
  mainPanel.draw();
  mainPanel.update();
  mainPanel.mouseHovered();
  if (mouse.isPressed) {
    mainPanel.mousePressed();
  }
}
