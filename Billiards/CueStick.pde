class CueStick{
 int strength;
 float x, y;
 PVector dir;
 Ball ball; //need t0 make this a cueball eventually

 public CueStick(Ball cue) {
   this.x = Ball.position.x;
   this.y = Ball.position.y;
   strength = 5;
   ball = cue;
   dir = new PVector(x - mouseX, y - mouseY);
 }

 public void setStrength(int num){
   strength = num;
 }

 public void show(){
    x = ball.x;
    y = ball.y;
    dir.set(x - mouseX, y - mouseY);
    dir.normalize();

  }
}
