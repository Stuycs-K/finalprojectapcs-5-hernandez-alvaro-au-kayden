class Ball {
  PVector position, velocity, acceleration;
  float radius;
  color c;
  int number;
  boolean inPocket;
  boolean striped;
  float mass;

  public Ball(float x, float y, float xSpeed, float ySpeed, float r, int num, color c) {
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0, 0);
    radius = r;
    number = num;
    this.c = c;
    inPocket = false;
    mass = 0.17;

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

        // center align the rectangle to (x, y)
        rectMode(CENTER);
        rect(position.x, position.y, (float) radius * 2, radius * 0.90);
      } else {
        // make the colored circle
        fill(c);
        noStroke();
        circle(position.x, position.y, (float)radius*2);
      }

      // if striped, need small white circle so the number is shown easier
      fill(255);
      circle(position.x, position.y, (float) radius);

      // write the number
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(10);
      text(number, position.x, position.y);
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
    if (position.x < 70)
      velocity.x = abs(velocity.x * 0.9);
    if (position.x > width-70)
      velocity.x= -1 * abs(velocity.x * 0.9);
    if (position.y < 70)
      velocity.y = abs(velocity.y * 0.9);
    if (position.y > height-70)
      velocity.y= -1 * abs(velocity.y * 0.9);
  }

  public void collide(ArrayList<Ball> list) {
    // loop through the ball list
    for (Ball b : list) {
      collideHelper(b);
    }
  }

  public void collideHelper(Ball other) {
    float distance = PVector.dist(position, other.position);
    if (distance < radius * 2 && distance > 0) {
      
      // find the direction of the new vector
      PVector newDir = PVector.sub(this.position, other.position);
      newDir.normalize();

      // find the velocity vector between the two balls
      PVector veloValue = PVector.sub(velocity, other.velocity);

      // new velocity magnitude using dot product
      float newVelo = veloValue.dot(newDir);

      // calculate impulse value using the new velocity, dividing by two to split the energy, and multiply by a constant < 1.0 to decrease some energy 
      float impulse = -(0.2) * newVelo / 2;
      
      // new vector is the direction multiplied by impulse value
      PVector vector = PVector.mult(newDir, impulse);

      // apply oppositely to balls so they move opposite
      velocity.sub(vector);
      other.velocity.add(vector);
    }
  }
}
