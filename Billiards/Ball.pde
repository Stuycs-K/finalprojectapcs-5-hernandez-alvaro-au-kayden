class Ball {
  PVector position, velocity, acceleration;
  float radius;
  color c;
  int number;
  boolean inPocket;
  boolean striped;
  ArrayList<PVector> pockets;

  public Ball(float x, float y, float xSpeed, float ySpeed, float r, int num, color c, ArrayList<PVector> pocketCoords) {
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0, 0);
    radius = r;
    number = num;
    this.c = c;
    inPocket = false;
    pockets = pocketCoords;

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

  public void update(float time) {
    // applying accelerations to x and y;
    PVector veloChange = PVector.mult(acceleration, time);
    velocity.add(veloChange);
    
    // change pos
    position.add(velocity);

    acceleration.set(0, 0);

    // friction
    velocity.mult(0.993);
    if (velocity.mag() < 0.01) {
      velocity.set(0, 0);
    }
  }
  
  public boolean inPocket() {
    for (PVector p : pockets) {
      if (p.dist(position) < 18 + 35) {      // if the distance between them is less than the pocket radius
        pocket();
        return true;
      }
    }
    return false;
  }
  
  public void pocket() {
    inPocket = true;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  public void bounce() {
    
    // ONLY BOUNCE IF NOT IN POCKET
    if (!inPocket()) {
      // 56 is the length of the brown and dark green area and + radius makes it not hit the center 
      if (position.x < 56 + radius)
        velocity.x = abs(velocity.x * 0.85);
      if (position.x > width - (133 + radius))
        velocity.x= -1 * abs(velocity.x * 0.85);
      if (position.y < 56 + radius)
        velocity.y = abs(velocity.y * 0.85);
      if (position.y > height - (56 + radius))
        velocity.y= -1 * abs(velocity.y * 0.85);
    }
  }

  public void collide(ArrayList<Ball> list) {
    // loop through the ball list
    for (Ball b : list) {
      collideHelper(b);
    }
  }

  private void collideHelper(Ball other) {
    float distance = PVector.dist(this.position, other.position);
    if (distance < radius * 2 && distance > 0) {
      
      // find the direction of the new vector
      PVector normal = PVector.sub(this.position, other.position);
      normal.normalize();

      // find the velocity vector between the two balls
      PVector veloValue = PVector.sub(this.velocity, other.velocity);

      // new velocity magnitude using dot product
      float newVelo = veloValue.dot(normal);
    
      if (newVelo > 0) {
        return;
      }
      
      // calculate impulse value using the new velocity, dividing by two to split the energy, and multiply by a constant < 1.0 to decrease some energy 
      float impulse = -(1 + 0.9) * newVelo / 2;
      
      // new vector is the direction multiplied by impulse value
      PVector vector = PVector.mult(normal, impulse);
      
      // apply oppositely to balls so they move opposite
      this.velocity.add(vector);
      other.velocity.sub(vector);
      
      // adjust the positions so they move apart
      float overlapSpace = radius * 2 - distance;
      PVector fix = PVector.mult(normal, overlapSpace / 2);
      this.position.add(fix);
      other.position.sub(fix);
      
      
    }
  }
}
