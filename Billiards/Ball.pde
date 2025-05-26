class Ball {
 PVector position, velocity, acceleration;
 float radius;
 color c;
 int number;
 boolean inPocket;
 
 
 public Ball(float x, float y, float xSpeed, float ySpeed, float r, int num, color c) {
   position = new PVector(x, y);
   velocity = new PVector(xSpeed, ySpeed);
   acceleration = new PVector(0, 0);
   radius = r;
   number = num;
   this.c = c;
   inPocket = false;
 }
 
 public void show(){
   fill(c);
   noStroke();
   circle(position.x, position.y, (float)radius*2);
   fill(0);
   text(str(number), position.x-5, position.y+5);
   textSize(20);
 }
 
 public void move() {
   // applying accelerations to x and y;
  velocity.add(acceleration);
  
  // change pos
  position.add(velocity);
  
  acceleration.set(0, 0);
 }
 
 public void bounceCollide(ArrayList<Ball> balls) {
    //This can introduce/remove energy from the system because of small "teleportations".
    if (position.x < radius)
      velocity.x = abs(velocity.x);
    if (position.x > width-radius)
      velocity.x= -1 * abs(velocity.x);
    if (position.y < radius)
      velocity.y = abs(velocity.y);
    if (position.y > height-radius)
      velocity.y= -1 * abs(velocity.y);
     
    // loop through ball list to check collisions
    //for (Ball : balls) {
      
    //}
  }
}
