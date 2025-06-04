Table t1;
int distanceCueToStick = 40;
int lengthOfStick = 12;
float radius = 12.5;

void setup() {
  size(592, 912);
  t1 = new Table(width, height);
}
void mouseClicked() {
  t1.stick.strike();
}

void keyPressed() {
  if (keyCode >= 49 && keyCode <= 54){
    t1.stick.strength = int(key) - 48;
  }
  if (key == ' '){
   t1.stick.strength=t1.stick.strength%6 + 1; 
  }
}

void mouseDragged() 
{
  t1.cueBall.position.x = mouseX;
  t1.cueBall.position.y = mouseY;
  
}

void draw() {
    t1.display();
    for (PVector p : t1.pockets) {
      fill(128, 0, 0);
     ellipse(p.x, p.y, 35, 35);
    }
    t1.strengthB.display();
    
    // when the cue ball is pocketed, spawn a new one at center
    if (t1.cueBall.inPocket) {
      
      // new cue ball
      Ball cueBall = new Ball(width / 2 - 40, 456.0,  0, 0, radius, 0, color(255), t1.pockets);
      t1.ballList.add(cueBall);
      t1.cueBall = cueBall;
      
      // make a new stick
      CueStick newStick = new CueStick(cueBall);
      t1.stick = newStick;
      
      // make a new strength bar
      t1.strengthB = new StrengthBar(newStick);
    }
    
    // if 8 ball goes in you lose
    
    // if the eight ball is in the pocket
    if (t1.eightBall.inPocket) {
      
      // if there still exists balls
      if (! (t1.ballList.size() == 1)) {
        textAlign(CENTER, CENTER);
        textSize(100);
        text("YOU LOSE!", width / 2 - 40, 456.0);
        exit();
      }
    }
}
