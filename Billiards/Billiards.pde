ArrayList<Ball>ballList;
ArrayList<int[]>colorList;
Table t1;
Ball cueBall;
CueStick stick;

void setup() {
  size(500, 1000);
  ballList = new ArrayList<Ball>();
  colorList = new ArrayList<int[]>(8);
  
  t1 = new Table(width, height);
  
  // red
  colorList.add(new int[] {255, 0, 0});
  // orange
  colorList.add(new int[] {255, 165, 0});
  // yellow
  colorList.add(new int[] {255, 255, 0});
  // green
  colorList.add(new int[] {0, 255, 0});
  // blue
  colorList.add(new int[] {0, 0, 255});
  // black
  colorList.add(new int[] {0, 0, 0});
  // purple
  colorList.add(new int[] {128, 0, 128});
  // brown / maroon
  colorList.add(new int[] {196, 164, 132});
  
  float startX = width / 2;
  float startY = height * 0.3;
  float radius = 20.0;
  
  int[] diagonalNums = new int[] {1, 2, 4, 7, 11};
  
  // diagonal framework for the rows
  for (int i = 0; i < 3; i++) {
   int[] c = colorList.get(i);
   float x = startX - (i * radius * 2 * 0.866); 
   float y = startY - (i * radius * 2);
   int number = diagonalNums[i];
    ballList.add(new Ball(x, y, 0, 0, radius, number, color(c[0], c[1], c[2])));
  }
  
  for (int i = 0; i < 4; i++) {
    
    
    
  }
  
  
  //ballList.add(new Ball(startX, startY, 0, 0, 20, 1, color(255, 0, 0)));
  //for (int i = 0; i <
  //for (int i = 1; i < 4; i++){
  //  int row = 0;
  //  if (i > 1){
  //    row = 1;
  //  }
  //  ballList.add(new Ball(220 + row*30*pow(-1, i +1), 160 - row * 50, 10, 10, 20, i, color(255, 0, 0)));  
  //}
  cueBall = new Ball(250.0, 700.0 ,0, 0, 20, 0, color(255,255,255)); 
  stick = new CueStick(cueBall);
}
void mouseClicked() {
      stick.strike();
}

void keyPressed() {
    //to be added
}
void draw() {
    background(2, 48, 32);
    cueBall.show();
    for (Ball b : ballList) {
        b.show();
        b.move();
        b.bounce();
        b.collide(ballList);
    }
    if (cueBall.velocity.mag() < 0.01){
      stick.show();
    }
    cueBall.move();
    cueBall.bounce();
}
