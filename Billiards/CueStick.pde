class CueStick{
 int strength;
 float x, y;
 PVector dir;
 Ball ball; //need t0 make this a cueball eventually

 public CueStick(Ball cue) {
   this.x = cue.position.x;
   this.y = cue.position.y;
   strength = 5;
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

    x -= dir.x * 55;
    y -= dir.y * 55;
    fill(144, 238, 144);
    circle(x, y, 15);
    fill(255,255,255);
    //rotate(PI/5.0);
    float angle = atan(dir.y / abs(dir.x));
    print(degrees(angle));
    float a = cos(angle) * 2;
    float b = sin(angle) * 2;
  
    quad(x+10*b, y-10*a, x-10*b, y+10*a, x-10*b+20*a, y+10*a+20*b, x+10*b+20*a, y-10*a+20*b);
  }
}
