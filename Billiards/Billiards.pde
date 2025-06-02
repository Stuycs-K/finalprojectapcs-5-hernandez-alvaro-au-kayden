Table t1;

void setup() {
  size(592, 912);
  t1 = new Table(width, height);
}
void mouseClicked() {
  t1.stick.strike();
}

void draw() {
    t1.display();
    for (PVector p : t1.pockets) {
      fill(128, 0, 0);
     ellipse(p.x, p.y, 50, 50); 
    }
    t1.strengthB.display();
}
