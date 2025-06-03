Table t1;
int distanceCueToStick = 40;
int lengthOfStick = 12;

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

void draw() {
    t1.display();
    //for (PVector p : t1.pockets) {
    //  fill(128, 0, 0);
    // ellipse(p.x, p.y, 50, 50);
    //}
    t1.strengthB.display();
}
