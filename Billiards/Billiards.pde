Table t1;
int distanceCueToStick = 40;
int lengthOfStick = 12;
boolean gameOver = false;
boolean winner = false;
int numOfTurns = 0;
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
   t1.stick.strength=t1.stick.strength%6 + 1; 
  }
  if (key == 'q')
    t1 = new Table(width, height);
}

void draw() {
    t1.strengthB.display();
    t1.display();
    for (PVector p : t1.pockets) {
      fill(128, 0, 0);
     ellipse(p.x, p.y, 35, 35);
    }
    if(gameOver){
      fill(255);
      textAlign(CENTER);
      textSize(80);
      if (winner){
        text("You Won! \n In " + numOfTurns + " turns" , width/2 - 40, 456); 
      }
      else{
         text("You Lost :( \n In " + numOfTurns + " turns" , width/2 - 40, 456); 
      }
    }
}
