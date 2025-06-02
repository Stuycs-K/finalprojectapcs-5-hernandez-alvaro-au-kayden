class Table {
  int width, length;
  ArrayList<Ball> balls;
  Ball cueBall;
  CueStick stick;
  
  public Table(int w, int l, Ball cb, CueStick stick) {
    balls = new ArrayList<Ball>(16);
    width = w;
    length = l;
    cueBall = cb;
    this.stick = stick;
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
