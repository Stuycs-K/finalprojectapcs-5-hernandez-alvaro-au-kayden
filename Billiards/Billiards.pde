ArrayList<Ball>ballList;
ArrayList<int[]>colorList;
ArrayList<Ball>stripes;
ArrayList<Ball>solids;
Table t1;
StrengthBar strengthB;
Ball cueBall;
CueStick stick;

void setup() {
  size(592, 912);
  ballList = new ArrayList<Ball>();
  colorList = new ArrayList<int[]>(8);
  stripes = new ArrayList<Ball>(7);
  solids = new ArrayList<Ball>(7);

  
  float radius = 12.5;

  cueBall = new Ball(250.0, 700.0, 0, 0, radius, 0, color(255));
  ballList.add(cueBall);
  stick = new CueStick(cueBall);

  t1 = new Table(width, height, cueBall, stick);
  strengthB = new StrengthBar(stick);
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
      Ball b = new Ball(x, y, 0, 0, radius, number, color(c[0], c[1], c[2]));
      ballList.add(b);
      if (number >= 0 && number < 8) {
        solids.add(b);
      }
      else if (number !=8) {
        stripes.add(b);
      }
      number++;
      
    }
  }
}
void mouseClicked() {
  stick.strike();
}

void draw() {
    strengthB.display();
    t1.display();
}
