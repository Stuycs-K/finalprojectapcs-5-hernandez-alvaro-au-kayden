Table t1;
int distanceCueToStick = 40;
int lengthOfStick = 12;
boolean gameOver = false;
boolean winner = false;

// turn based movement
int currentPlayer = 0;

// trakcing stripes or solid
ArrayList<String> strOrSol = new ArrayList<String>(2);

int numOfTurns = 0;
float radius = 12.5;


//playable table is 400x800

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
   t1.stick.strength=t1.stick.strength % 6 + 1; 
  }
  if (key == 'q')
    t1 = new Table(width, height);
}

void mouseDragged() 
{
  if (t1.cueBall.inPocket || (t1.cueBall.velocity.mag() < 0.1 && t1.cueBall.scratched)) {
    t1.cueBall.position.x = mouseX;
    t1.cueBall.position.y = mouseY;
  }
}

void draw() {
    t1.strengthB.display();
    t1.display();
    for (PVector p : t1.pockets) {
      fill(128, 0, 0);
     ellipse(p.x, p.y, 35, 35);
    }
    
    // testing, works so far
    //System.out.println(strOrSol.toString());

    if(gameOver){
      fill(255);
      textAlign(CENTER);
      textSize(80);
      if (winner){
        text("You Won! \n In " + numOfTurns + " turns" , width/2 - 40, 456); 
      }
      else{
         text("You Lost :( \n In " + numOfTurns + " turns" , width/2 - 40, 456); 
    t1.strengthB.display();
      }
    }
    
    // when the cue ball is pocketed, spawn a new one at center
    if (t1.cueBall.inPocket) {
      
      // new cue ball
      Ball cueBall = new Ball(width / 2 - 40, 456.0,  0, 0, radius, 0, color(255), t1.pockets);
      t1.ballList.add(cueBall);
      t1.cueBall = cueBall;
      t1.cueBall.scratched = true;
      
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
