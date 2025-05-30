ArrayList<Ball>ballList;
ArrayList<int[]>colorList;
Table t1;
Ball cueBall;
CueStick stick;

void setup() {
  size(512, 912);
  ballList = new ArrayList<Ball>();
  colorList = new ArrayList<int[]>(8);

  float startX = width / 2;
  float startY = height * 0.3;
  float radius = 15.0;

  cueBall = new Ball(250.0, 700.0, 0, 0, radius, 0, color(255));
  ballList.add(cueBall);
  stick = new CueStick(cueBall);

  t1 = new Table(width, height, cueBall, stick);

  // fill the colorList with the colors in order
  // yellow
  colorList.add(new int[] {255, 255, 0});
  // blue
  colorList.add(new int[] {0, 0, 255});
  // red
  colorList.add(new int[] {255, 0, 0});
  // purple
  colorList.add(new int[] {128, 0, 128});
  // orange
  colorList.add(new int[] {255, 165, 0});
  // green
  colorList.add(new int[] {0, 255, 0});
  // brown / maroon
  colorList.add(new int[] {196, 164, 132});
  // black
  colorList.add(new int[] {0, 0, 0});

  int[] diagonalNums = new int[] {1, 2, 4, 7, 11};

  // diagonal framework for the rows
  for (int i = 0; i < 5; i++) {
   int[] c = colorList.get(i);

   // equilateral triangle spacing between the centers
   float x = startX - (i * radius * 1.5 * 0.866);
   float y = startY - (i * radius * 1.5);
   int number = diagonalNums[i];
    ballList.add(new Ball(x, y, 0, 0, radius, number, color(c[0], c[1], c[2])));
  }

  for (int i = 0; i < 4; i++) {



  }


}
void mouseClicked() {
  stick.strike();
}

void draw() {
    background(2, 48, 32);
    fill(137, 81, 41);
    //brown border
    rect(256, 28, 512, 56);
    rect(256, 884, 512, 56);
    rect(28, 456, 56, 912);
    rect(484, 456, 56, 912);
    //white border
    fill(10,93,0);
    rect(256, 48, 512-96, 16);
    rect(256, 864, 512-96, 16);
    rect(48, 456, 16, 912-96);
    rect(464, 456, 16, 912-96);

    fill(2, 48, 32);
    quad(36+18*sin(PI/4), 36-18*sin(PI/4), 36-18*sin(PI/4), 36+18*sin(PI/4), 36+48, 36+48+36*sin(PI/4), 36+48+sin(PI/4)*36, 36+48+36*sin(PI/4)-sin(PI/4)*36);
    fill(0);
    circle(36, 36, 36);
    
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
