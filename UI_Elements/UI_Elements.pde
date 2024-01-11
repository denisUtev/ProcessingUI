
MouseObject mouse;

UPanel mainPanel;

void setup(){
  size(800, 600, P2D);
  //fullScreen(P2D);
  surface.setResizable(true);
  
  mouse = new MouseObject();
  
  mainPanel = new UPanel(new PVector(0, 0), new PVector(width, height));
  mainPanel.setBackground(color(#E8E8E8));
  
  UButton button1 = new UButton(new PVector(500, 40), new PVector(120, 60));
  button1.setPosZ(15);
  button1.setBackground(color(255, 95, 30));
  button1.setText("Button");
  mainPanel.add(button1);
  
  UList listView = new UList(new PVector(60, 100), new PVector(300, 300));
  listView.setBackground(color(200));
  listView.setGap(10);
  listView.setPadding(10, 30);
  mainPanel.add(listView);
  
  for (int i = 0; i < 5; i++) {
    ULabel label = new ULabel(new PVector(0, 0), new PVector(100, 50));
    label.setText(String.format("text%d", i + 1));
    listView.add(label);
  }
  
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
  
  textSize(30);
  text(frameRate, width - 100, height - 100);
}
