Table t1;
int distanceCueToStick = 40;
int lengthOfStick = 12;
boolean tracerToggle = true;
boolean gameOver = false;
boolean winner = false;

// turn based movement
int currentPlayer = 0;
boolean shotTaken = false;
boolean waitForTurnChange = false;
boolean assignedCate = false;

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
  t1.stick.strike(t1);
}

void keyPressed() {
  if (keyCode >= 49 && keyCode <= 54){
    t1.stick.strength = int(key) - 48;
  }
  if (key == ' '){
   t1.stick.strength=t1.stick.strength % 6 + 1; 
  }
  if (key == 'q') {
    t1 = new Table(width, height);
    currentPlayer = 0;
    assignedCate = false;
  }
    
  // toggle tracer
  if (key == 't') {
    tracerToggle = !tracerToggle;
  }
   
  if (key == '.') {
    for (int i = 2; i < t1.ballList.size() - 1; i++) {
      if (!t1.ballList.get(i).eightball) {
        t1.ballList.remove(i);
        i--;
      }
    }
    strOrSol.add("stripes");
    strOrSol.add("solids");
  }
}

void mouseDragged() 
{
  if (t1.cueBall.inPocket || (t1.cueBall.velocity.mag() < 0.1 && t1.cueBall.scratched)) {
    t1.cueBall.position.x = mouseX+0.0001;
    t1.cueBall.position.y = mouseY+0.0001;
    
    // reset globals
    shotTaken = false;
    waitForTurnChange = false;
  }
}

void draw() {
    t1.strengthB.display();
    t1.display();
    for (PVector p : t1.pockets) {
      fill(128, 0, 0);
     ellipse(p.x, p.y, 35, 35);
    }
    
    // direction for toggling tracer
    fill(0);
    textSize(15);
    text("'t' = Tracer", 552, 32);
    
    
    fill(0);
    textSize(15);
    text("\n\n\n\n\n Player: " + (currentPlayer + 1), 552, 50);
    
    fill(0);
    if (assignedCate) {
      textSize(15);
      text("P1: " + (strOrSol.get(0)), 552, 120);
      text("P2: " + (strOrSol.get(1)), 552, 140);
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
    
    // if the cue ball is scratched 
    if (t1.cueBall.scratched) {
       fill(255, 0, 0);
       textAlign(CENTER, CENTER);
       textSize(20);
       text("SCRATCH", width / 2 - 40, 456.0);
    }
    
    // when the cue ball is pocketed, spawn a new one at center
    if (t1.cueBall.inPocket &&  !waitForTurnChange) {
    // Determine scratch due to hitting wrong ball type
    if (!waitForTurnChange) {
      if (t1.cueBall.inPocket) {
        t1.cueBall.scratched = true;
      }
      Ball hit = t1.firstHit;
      if (hit != null && assignedCate) {
        String playerType = strOrSol.get(currentPlayer);
        if ((playerType.equals("stripes") && !hit.striped) ||
            (playerType.equals("solids") && hit.striped)) {
          t1.cueBall.scratched = true;
        }
      }
    }
      
      // new cue ball
      Ball cueBall = new Ball(width / 2 - 40, 456.0, 0, 0, radius, 0, color(255), t1.pockets);
      t1.ballList.set(0, cueBall);
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
        text("GAME OVER!", width / 2 - 40, 456.0);
        exit();
      }
    }
}
