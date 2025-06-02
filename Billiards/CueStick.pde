class CueStick{
 int strength;
 float x, y;
 PVector dir;
 Ball ball; //need t0 make this a cueball eventually

 public CueStick(Ball cue) {
   this.x = cue.position.x;
   this.y = cue.position.y;
   strength = 60;
   ball = cue;
   dir = new PVector(x - mouseX, y - mouseY);
 }

 public void setStrength(int num){
   strength = num;
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
  }

  public void strike(){
    if (ball.velocity.mag() < 0.01){
      dir.mult(strength);
      ball.acceleration.add(dir);
    }
  }
}
