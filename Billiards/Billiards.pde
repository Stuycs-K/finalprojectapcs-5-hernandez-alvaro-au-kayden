ArrayList<Ball>ballList;
ArrayList<int[]>colorList;
Table t1;
Ball cueBall;
CueStick stick;

void setup() {
  size(512, 912);
  ballList = new ArrayList<Ball>();
  colorList = new ArrayList<int[]>(8);

  
  float radius = 12.5;

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

  // initial starting points for the first ball
  float startX = width / 2;
  float startY = height * 0.3;
  
  // other vars needed
  int rows = 5;
  int number = 1;
  
  float ballSpace = radius * 2 + 1;
  float rowHeight = sqrt(3) / 2 * ballSpace;       // sqrt(3) / 2 because the centers form 60 deg angles ; sin 60 deg is sqrt3/2
  
  
  for (int r = 0; r < rows; r++) {
    int balls = r + 1;       // each consecutive row has one more than the last (1, 2, 3, 4, 5)
    float offset = -(balls - 1) * ballSpace / 2;       // to center the balls, you need the leftmost ball to move multiples of half a space; ie if 2 balls, they need to be shifted 1/2 over, if 3 balls, 1 ball over, etc...
    float y = startY - (r * rowHeight);
    
    for (int col = 0; col < balls; col++) {
      int[] c = colorList.get(number % 7);
      if (number == 8) c = new int[] {0, 0, 0};
      float x = startX + offset + (col * ballSpace);     // take inital spot, offset it, then add the spacing between each ball depending on which ball it is (1st, 2nd)
      ballList.add(new Ball(x, y, 0, 0, radius, number, color(c[0], c[1], c[2])));
      number++;
      
    }
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
