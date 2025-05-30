class StrengthBar{
  int strength;
  CueStick cue;
  
  public StrengthBar(CueStick cueStick){
    cue = cueStick;
    strength = cue.strength;
  }
  //size(592, 912);
  public void display(){
    fill(253, 253, 150);
    rect(552, 456, 80, 912);
    
    fill(252, 238, 167);
    for (int i = 512-30; i < width; i += 50) {
    for (int j = 0; j < height; j += sin(45)*25) {
      triangle(i, j, i + sin(45)*25, j + sin(45)*25, i + 50, j);
    }
    fill(255);
    stroke(0);
    circle(552, 200, 50);
    circle(552, 712, 50);
    rect(552, 456, 50, 512);
    noStroke();
    circle(552.5, 200, 49);
    circle(552.5, 712, 49);
  }
  }
}
