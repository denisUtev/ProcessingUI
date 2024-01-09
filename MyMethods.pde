
boolean isRectHovered(PVector Position, PVector Size, PVector point){
  return point.x > Position.x && point.x < Position.x + Size.x && point.y > Position.y && point.y < Position.y + Size.y;
}

//rectMove(CORNER)
boolean isRectsIntersect(PVector Position1, PVector Size1, PVector Position2, PVector Size2){
  return Position1.x + Size1.x >= Position2.x && Position1.x <= Position2.x  + Size2.x &&
         Position1.y + Size1.y >= Position2.y && Position1.y <= Position2.y  + Size2.y;
}
