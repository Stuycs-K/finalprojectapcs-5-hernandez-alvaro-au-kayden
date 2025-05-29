class Ball {
  PVector position, velocity, acceleration;
  float radius;
  color c;
  int number;
  boolean inPocket;
  boolean striped;

  public Ball(float x, float y, float xSpeed, float ySpeed, float r, int num, color c) {
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0, 0);
    radius = r;
    number = num;
    this.c = c;
    inPocket = false;
    
    if (num >= 9 && num <= 15) {
      striped = true;
    }
  }

  public void show() {
    if (!inPocket) {
      if (striped) {
        
        // make the white circle
        fill(255);
        noStroke();
        circle(position.x, position.y, (float) radius * 2);
        
        // draw the colored stripe
        fill(c);
        noStroke();
        rectMode(CENTER);
        rect(position.x, position.y, (float) radius * 2, radius * 0.75);
        
      }
      else {
        // make the colored circle
        fill(c);
        noStroke();
        circle(position.x, position.y, (float)radius*2);
      }
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
    // loop through the ball list
    for (Ball b : list) {
      collideHelper(b);
    }
  }

  public void collideHelper(Ball other) {
    if (PVector.dist(position, other.position) < radius * 2) {

      // find the direction of the new velocity vector
      PVector newDir = PVector.sub(this.position, other.position).normalize();

      // find the velocity vector between the two balls
      PVector veloValue = PVector.sub(velocity, other.velocity);

      // new velocity magnitude using dot product
      float newVelo = veloValue.dot(newDir);

      // calculate impulse value using COR (coefficient of restituion ; the 1 + x)
      float impulse = -(1) * newVelo / 2;
      PVector vector = PVector.mult(newDir, impulse);
  
      // apply oppositely to balls so they move opposite
      velocity.sub(vector);
      other.velocity.add(vector);
    }
  }
}
