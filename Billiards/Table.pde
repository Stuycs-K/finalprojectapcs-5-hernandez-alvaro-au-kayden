class Table {
  int width, length;
  ArrayList<Ball> balls;
  Ball cueBall;
  CueStick stick;
  
  public Table(int w, int l) {
    balls = new ArrayList<Ball>(16);
    width = w;
    length = l;
  }
  
  public void display() {
    background(2, 48, 32);
    cueBall.show();
    stick.show();
    for (Ball b : ballList) {
        b.show();
        b.move();
        b.bounce();
        b.collide(ballList); 
    }
  }
  
  public void addBalls(Ball b) {
   balls.add(b);
  }
}
