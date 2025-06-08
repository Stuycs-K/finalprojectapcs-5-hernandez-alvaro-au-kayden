class CueStick{
 int strength;
 float x, y;
 PVector dir;
 Ball ball; //need t0 make this a cueball eventually

 public CueStick(Ball cue) {
   this.x = cue.position.x;
   this.y = cue.position.y;
   strength = 2;
   ball = cue;
   dir = new PVector(x - mouseX, y - mouseY);
 }

 public void show(){
     this.x = ball.position.x;
     this.y = ball.position.y;
     dir.set(x - mouseX, y - mouseY);
     dir.normalize();

    x -= dir.x * distanceCueToStick;
    y -= dir.y * distanceCueToStick;
    fill(144, 238, 144);
    circle(x, y, 15);
    fill(255,255,255);
    //rotate(PI/5.0);
    float angle = atan2(dir.y, dir.x);

    float a = cos(angle) * 2;
    float b = sin(angle) * 2;
    float w = 9/2;
    quad(
      x+w*b,       y-w*a,
      x-w*b,       y+w*a,
      x-w*b-lengthOfStick*a,  y+w*a-lengthOfStick*b,
      x+w*b-lengthOfStick*a,  y-w*a-lengthOfStick*b);
    fill(196, 164, 132);
    float w2 = 7.5/2;
    float h2 = lengthOfStick * 8;
    float w3 = 7.5/2 + 1;
    quad(
      x-w2*b-lengthOfStick*a,  y+w2*a-lengthOfStick*b,
      x+w2*b-lengthOfStick*a,  y-w2*a-lengthOfStick*b,
      x+w3*b-lengthOfStick*a-h2*a,  y-w3*a-lengthOfStick*b-h2*b,
      x-w3*b-lengthOfStick*a-h2*a,  y+w3*a-lengthOfStick*b-h2*b);
    fill(92, 64, 51);
    float w4 = w3+1;
    float h3 = lengthOfStick * 5;
    quad(
      x+w3*b-lengthOfStick*a-h2*a,  y-w3*a-lengthOfStick*b-h2*b,
      x-w3*b-lengthOfStick*a-h2*a,  y+w3*a-lengthOfStick*b-h2*b,
      x-w4*b-lengthOfStick*a-h2*a-h3*a,  y+w4*a-lengthOfStick*b-h2*b-h3*b,
      x+w4*b-lengthOfStick*a-h2*a-h3*a,  y-w4*a-lengthOfStick*b-h2*b-h3*b);
    circle(x-lengthOfStick*a-h2*a-h3*a, y-lengthOfStick*b-h2*b-h3*b, 24);
    if (!shotTaken && !waitForTurnChange && tracerToggle) {
      showTracer();
    }
  }

  public void strike(){
    if (ball.velocity.mag() < 0.01){
      dir.mult(strength * 10);
      ball.acceleration.add(dir);
      numOfTurns++;
      
      // make the cue ball not scratched
      ball.scratched = false;
      shotTaken = true;
      waitForTurnChange = true;
    }
  }
  
  public void showTracer() { //might add side lasers later
    PVector tracer = ball.position.copy();
    PVector dirNormal = dir.copy().normalize();
    tracer.x+=dirNormal.x * radius;
    tracer.y+=dirNormal.y * radius;
    
    ArrayList<PVector> dashes = new ArrayList<PVector>();
    dashes.add(tracer.copy());
    float stepSize = 1;
    float maxDistance = 1500;
    float totalDistance = 0;
    int wallBounces = 0;
    Ball hit = null;

    boolean colliding = false;
    
    int dashLength = 6;
    int gapLength = 4;
    int temp = 30;
    while (totalDistance < maxDistance && !colliding && wallBounces < 3 && temp > 0){
      PVector nextPos = PVector.add(tracer, PVector.mult(dirNormal, stepSize));
      totalDistance += stepSize;
      
      for (Ball b: t1.ballList){
        if(b != ball && !b.inPocket && PVector.dist(nextPos, b.position) <= radius && !colliding){
          colliding = true;
          tracer = nextPos.copy();
          dashes.add(tracer.copy());
          hit = b;
        }
      }

      if ((nextPos.x < 36+35 && nextPos.y < 36+35) || (nextPos.x > 476-35 && nextPos.y < 36+35) || (nextPos.x < 36+35 && nextPos.y > 876-35) || (nextPos.x > 476-35 && nextPos.y > 876-35) || (nextPos.x < 56 && nextPos.y > 476-35 && nextPos.y < 476) || (nextPos.x > 56+400 && nextPos.y > 476-35 && nextPos.y < 476)){
          temp--;
          dashes.add(tracer.copy());
      }
           
      else if (nextPos.x < 56 || nextPos.x > 56+400){
        dirNormal.x *= -1;
        wallBounces++;
        dashes.add(tracer.copy());
      }
      
      else if (nextPos.y < 56 || nextPos.y > 56+800){
        dirNormal.y *= -1;
        wallBounces++;
        dashes.add(tracer.copy());
      }
      
    if ((int)totalDistance % (int)(dashLength + gapLength) == 0) {
      dashes.add(nextPos.copy());
    }
      
      tracer = nextPos.copy();
    }
    for (int i = 0; i < dashes.size() - 1; i+=2) {
      PVector p1 = dashes.get(i);
      PVector p2 = dashes.get(i + 1);
      
      stroke(255,0,0);
      strokeWeight(1);
      line(p1.x, p1.y, p2.x, p2.y);
      
    }
    noStroke();
    if (colliding){
      if (hit.number == 8)
       fill(255, 0, 0);
      else
        fill(0, 255, 0);
      circle(tracer.x, tracer.y, 8);
    }
    else{
      fill(255,255,255);
      circle(tracer.x, tracer.y, 8);
    }
  }
}
