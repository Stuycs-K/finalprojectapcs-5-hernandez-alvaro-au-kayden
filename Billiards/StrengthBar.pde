class StrengthBar{
  CueStick cue;
  
  public StrengthBar(CueStick cueStick){
    cue = cueStick;
  }
  //size(592, 912);
  public void display(){
    fill(173, 216, 230);
    rect(552, 456, 80, 912);
    
    fill(255);
    stroke(0);
    circle(552, 200, 50);
    circle(552, 712, 50);
    fill(255, 127, 127);
    rect(552, 456, 50, 512);
    int x1 = 527;
    int x2 = 577;
    int y1 = 200;
    int level = 2;
    for (int y2 = 622; y2 > 200; y2 -= 90){
       if (cue.strength >= level)
         fill(255, 127, 127);
       else
         fill(255);
       quad(x1, y1, x2, y1, x2, y2, x1, y2);
       y1 = y2;
       level++;
    }
    noStroke();
    fill(255, 127, 127);
    circle(552.5, 712, 49);
    if (cue.strength !=  6)
      fill(255);
    circle(552.5, 200, 49);
  }
  
  public void setStrength(int num){
    cue.strength = num; 
  }
}
