class CueStick{
 int strength;
 float x, y;
 PVector stick;
 Ball ball; //need t0 make this a cueball eventually
 
 public CueStick(Ball cue) {
   this.x = ball.x;
   this.y = ball.y;
   strength = 5;
   ball = cue;
   stick = new PVector(x - mouseX, y - mouseY);
 }
 
 public void setStrength(int num){
   strength = num; 
 }
 
 public void show(){
    stick.set(x - mouseX, y - mouseY);
    stick.normalize();
 }
 
 
  
}
