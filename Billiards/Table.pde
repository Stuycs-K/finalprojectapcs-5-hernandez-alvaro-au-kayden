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
    fill(2, 48, 32);
    rectMode(CENTER);
    rect(width / 2, length / 2, width, length);
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
  
  public void addBalls(Ball b) {
   balls.add(b);
  }
}
