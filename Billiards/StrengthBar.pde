class StrengthBar{
  int strength;
  CueStick cue;
  
  public StrengthBar(CueStick cueStick){
    cue = cueStick;
    strength = cue.strength;
  }
  //size(592, 912);
  public void display(){
    fill(173, 216, 230);
    rect(552, 456, 80, 912);
    
    fill(255);
    stroke(0);
    circle(552, 200, 50);
    circle(552, 712, 50);
    rect(552, 456, 50, 512);
    int x1 = 527;
    int x2 = 577;
    for (int y = 622; y > 200; y -= 90){
       line(x1, y, x2, y); 
    }
    noStroke();
    circle(552.5, 200, 49);
    circle(552.5, 712, 49);
  }
  
  public void setStrength(int num){
    strength = num; 
  }
}
