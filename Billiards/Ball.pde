class Ball {
 PVector position, velocity, acceleration;
 float radius;
 color c;
 int number;
 boolean inPocket;
 float mass;
 
 
 public Ball(float x, float y, float xSpeed, float ySpeed, float r, int num, color c) {
   position = new PVector(x, y);
   velocity = new PVector(xSpeed, ySpeed);
   acceleration = new PVector(0, 0);
   radius = r;
   number = num;
   this.c = c;
   inPocket = false;
   mass = 100;
 }
 
 public void show(){
   if (!inPocket) {
     fill(c);
     noStroke();
     circle(position.x, position.y, (float)radius*2);
     fill(0);
     text(str(number), position.x-5, position.y+5);
     textSize(20);
   }
 }
 
 public void move() {
   // applying accelerations to x and y;
  velocity.add(acceleration);
  
  // change pos
  position.add(velocity);
  
  acceleration.set(0, 0);
  
  // friction
  velocity.mult(0.98);
  if (velocity.mag() < 0.01) velocity.set(0, 0);
 }
 
 public void pocket() {
   inPocket = true;
   velocity = new PVector(0, 0);
   acceleration = new PVector(0, 0);
 }
 
public void bounce() {
    if (position.x < radius)
      velocity.x = abs(velocity.x);
    if (position.x > width-radius)
      velocity.x= -1 * abs(velocity.x);
    if (position.y < radius)
      velocity.y = abs(velocity.y);
    if (position.y > height-radius)
      velocity.y= -1 * abs(velocity.y);
  }
  
  public void collide(ArrayList<Ball> list) {
    // minimum distance between two balls
    float min = radius * 2;
    
    // loop through the ball list
    for (Ball b : list) {
      if (PVector.dist(this.position, b.position) < min) {
        
        // find the direction
        PVector dir = position.sub(b.position).normalize();
        
        // inelastic collision magnitude
        float mag = mass * (velocity.mag() + b.velocity.mag()) / (2 * mass);
        
        // 
        PVector finalVelo = dir.copy().setMag(mag);
        velocity.set(finalVelo);
        b.velocity.set(finalVelo.mult(-1));
      }
    }
  }
}
