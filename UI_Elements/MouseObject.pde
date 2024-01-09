

class MouseObject{
  
  PVector Position;
  float X, Y;
  boolean isClicked = false;
  boolean isPressed = false;
  
  MouseObject(){
    Position = new PVector();
  }
  
  void setPosition(float mX, float mY){
    Position.x = mX;
    Position.y = mY;
    X = mX;
    Y = mY;
  }
  
  void checkPress(){
    if(!mousePressed){
      isClicked = false;
      isPressed = false;
    }else{
      if(isClicked)
        isPressed = true;
      isClicked = true;
      if(isPressed)
        isClicked = false;
    }
  } 
  
}
