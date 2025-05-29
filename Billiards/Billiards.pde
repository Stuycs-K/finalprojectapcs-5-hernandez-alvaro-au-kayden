ArrayList<Ball>ballList;
ArrayList<int[]>colorList;
Table t1;
Ball cueBall;
CueStick stick;

void setup() {
  size(500, 1000);
  
  
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
    t1.display();
}
