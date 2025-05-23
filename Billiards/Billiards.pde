ArrayList<Ball>ballList;

void setup() {
  size(440, 880);
  ballList = new ArrayList<Ball>();

  for (int i = 1; i < 4; i++){
    int row = 0;
    if (i > 1){
      row = 1;
    }
    ballList.add(new Ball(220 + row*30*pow(-1, i + 1), 160 - row * 50, 60, i, color(255, 0, 0)));
  }
}
void mouseClicked() {
  //to be added
}

void keyPressed() {
    //to be added
}
void draw() {
    background(2, 48, 32);
    for (Ball b : ballList) {
        b.show();
    }
}
