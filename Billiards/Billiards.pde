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
  float radius = 15.0;
  
  int[] diagonalNums = new int[] {1, 2, 4, 7, 11};
  
  // diagonal framework for the rows
  for (int i = 0; i < 5; i++) {
   int[] c = colorList.get(i);
   float x = startX - (i * radius * 2 * 0.866); 
   float y = startY - (i * radius * 2);
   int number = diagonalNums[i];
    ballList.add(new Ball(x, y, 0, 0, radius, number, color(c[0], c[1], c[2])));
  }
  
  for (int i = 0; i < 4; i++) {
    
    
    
  }
  
  cueBall = new Ball(250.0, 700.0, 0, 0, radius, 0, color(255)); 
  ballList.add(cueBall);
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
