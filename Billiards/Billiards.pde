Table t1;
int distanceCueToStick = 40;
int lengthOfStick = 12;
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
}

void draw() {
    t1.display();
    for (PVector p : t1.pockets) {
      fill(128, 0, 0);
     ellipse(p.x, p.y, 35, 35);
    }
    t1.strengthB.display();
    fill(255);
    for(int k = 0; k<912; k+=856){
      for(int i = 100; i < 400; i+=100)
        quad(i+51, 28+k, i+56, 20+k, i+61, 28+k, i+56, 36+k);
    }
}
