ArrayList<Ball>ballList;
Ball cueBall;
CueStick stick;

void setup() {
  size(440, 880);
  ballList = new ArrayList<Ball>();

  for (int i = 1; i < 4; i++){
    int row = 0;
    if (i > 1){
      row = 1;
    }
    ballList.add(new Ball(220 + row*30*pow(-1, i +1), 160 - row * 50, 10, 10, 20, i, color(255, 0, 0)));  
  }
  cueBall = new Ball(220, 300,0, 0, 30, 0, color(255,255,255)); 
  stick = new CueStick(cueBall);
}
void mouseClicked() {
  //to be added
}

void keyPressed() {
    //to be added
}
void draw() {
    background(2, 48, 32);
    cueBall.show();
    stick.show();
    for (Ball b : ballList) {
        b.show();
        b.move();
        b.bounce();
        b.collide(ballList);
    }
}
