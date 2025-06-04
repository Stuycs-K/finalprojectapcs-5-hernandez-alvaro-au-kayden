class Table {
  int width, length;
  ArrayList<Ball>ballList;
  ArrayList<int[]>colorList;
  ArrayList<Ball>stripes;
  ArrayList<Ball>solids;
  ArrayList<PVector>pockets;
  StrengthBar strengthB;
  Ball cueBall;
  Ball eightBall;
  CueStick stick;
  
  public Table(int w, int l) {
    width = w;
    length = l;
    
    // arraylist sizes
    ballList = new ArrayList<Ball>(16);
    colorList = new ArrayList<int[]>(8);
    stripes = new ArrayList<Ball>(7);
    solids = new ArrayList<Ball>(7);
    pockets = new ArrayList<PVector>(6);
  
    // pockets 
    pockets.add(new PVector(36, 36));
    pockets.add(new PVector(476, 36));
    pockets.add(new PVector(476, 876));
    pockets.add(new PVector(36, 876));
    pockets.add(new PVector(36, 456));
    pockets.add(new PVector(476, 456));
    
    // SETUP THE GAME!!!
    gameSetup();
  }
  
  
  public void gameSetup() {
    // game setup
    float startX = (width / 2) - 40;
    float startY = height * 0.3;
    
    cueBall = new Ball(startX, 700.0, 0, 0, radius, 0, color(255), pockets);
    ballList.add(cueBall);
    stick = new CueStick(cueBall);
    
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
    colorList.add(new int[] {128, 0, 0});
    // black
    colorList.add(new int[] {0, 0, 0});

    
    
    
    // other vars needed
    int rows = 5;
    int number = 1;
    
    float ballSpace = radius * 2 + 1;
    float rowHeight = sqrt(3) / 2 * ballSpace;       // sqrt(3) / 2 because the centers form 60 deg angles ; sin 60 deg is sqrt3/2
    
    
    for (int r = 0; r < 5; r++) {
      int balls = r + 1;       // each consecutive row has one more than the last (1, 2, 3, 4, 5)
      float offset = -(balls - 1) * ballSpace / 2;       // to center the balls, you need the leftmost ball to move multiples of half a space; ie if 2 balls, they need to be shifted 1/2 over, if 3 balls, 1 ball over, etc...
      float y = startY - (r * rowHeight);
      
      for (int col = 0; col < balls; col++) {
        int[] c = colorList.get(number % 7);
        if (number == 8) c = new int[] {0, 0, 0};
        float x = startX + offset + (col * ballSpace);     // take inital spot, offset it, then add the spacing between each ball depending on which ball it is (1st, 2nd)
        Ball b = new Ball(x, y, 0, 0, radius, number, color(c[0], c[1], c[2]), pockets);
        ballList.add(b);
        if (number >= 0 && number < 8) {
          solids.add(b);
        }
        else if (number > 8 && number <= 15) {
          stripes.add(b);
        }
        else {
          eightBall = b;
        }
        number++;
        
      }
    }
  }
  
  public void display() {
    // setting up the borders and the display
    fill(2, 48, 32);
    rect(256, 456, 512, 912);
    
    fill(137, 81, 41);
    //brown border
    rect(256, 28, 512, 56);
    rect(256, 884, 512, 56);
    rect(28, 456, 56, 912);
    rect(484, 456, 56, 912);
    //light green border
    fill(10,93,0);
    rect(256, 48, 512-96, 16);
    rect(256, 864, 512-96, 16);
    rect(48, 456, 16, 912-96);
    rect(464, 456, 16, 912-96);

    fill(2, 48, 32);
    float xPock = 36;
    float yPock = 36;
    quad(xPock+18*sin(PI/4), yPock-18*sin(PI/4), xPock-18*sin(PI/4), yPock+18*sin(PI/4), xPock+48, yPock+48+36*sin(PI/4), xPock+48+sin(PI/4)*36, yPock+48+36*sin(PI/4)-sin(PI/4)*36);
    xPock = 476;
    quad(xPock+18*sin(PI/4), yPock+18*sin(PI/4), xPock-18*sin(PI/4), yPock-18*sin(PI/4), xPock-(48+sin(PI/4)*36), yPock+48+36*sin(PI/4)-sin(PI/4)*36, xPock-48, yPock+48+36*sin(PI/4));
    yPock = 876;
    quad(xPock+18*sin(PI/4), yPock-18*sin(PI/4), xPock-18*sin(PI/4), yPock+18*sin(PI/4), xPock-48-sin(PI/4)*36, yPock-48-36*sin(PI/4)+sin(PI/4)*36, xPock-48, yPock-48-36*sin(PI/4));
    xPock = 36;
    quad(xPock+18*sin(PI/4), yPock+18*sin(PI/4), xPock-18*sin(PI/4), yPock-18*sin(PI/4), xPock+48, yPock-48-36*sin(PI/4), xPock+(48+sin(PI/4)*36), yPock-48-36*sin(PI/4)+sin(PI/4)*36);
    
    quad(36, 456-18, 36, 456+18, 56, 456+20.5, 56, 456-20.5);
    quad(476, 456-18, 476, 456+18, 512-56, 456+20.5, 512-56, 456-20.5);
    fill(0);
    circle(36, 36, 36);
    circle(476, 36, 36);
    circle(476, 876, 36);
    circle(36, 876, 36);
    circle(36, 456, 36);
    circle(476, 456, 36);
    fill(255);
  
  // incrementation of the display
    // adding steps so that position is calculated multiple times, 
    int steps = 6;
    float time = 1.0 / steps;
    
    boolean ballsMoving = false;
    // general loop for updating the balls
    for (int i = 0; i < steps; i++) {
      
      // update all the physics (movement, collisions, bouncing, etc...
      for (Ball b : ballList) {
        b.update(time);
        b.bounce();
       }
      // update collisions
      for (Ball b : ballList) {
        b.collide(ballList); 
      }
      // if everything isnt moving, then display the stick
      for (Ball b : ballList) {
        if (b.velocity.mag() > 0) {
          ballsMoving = true;
        }
        else {
          ballsMoving = false;
        }
      }
    }
      
      // show the balls after the physics are all updated
      
      // remove the balls if they are in the pocket !
      for (int i = 0; i < ballList.size(); i++) {
       if (ballList.get(i).inPocket) {
         ballList.remove(i);
       }
        
      }
      for (Ball b: ballList) {
          b.show();
      }
    
    // when does the stick appear
    if (cueBall.velocity.mag() < 0.01){
      if (!ballsMoving) {
        stick.show();
      }
    }
    cueBall.update(steps);
    cueBall.bounce();
    }
}
