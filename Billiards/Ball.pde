class Ball {
 float x, y;
 float dx, dy;
 float radius;
 color c;
 int number;
 boolean inPocket;
 
 
 public Ball(float x, float y, float r, int num, color c) {
   this.x = x;
   this.y = y;
   radius = r;
   number = num;
   this.c = c;
   inPocket = false;
 }
 
 public void show(){
   noStroke();
   fill(c);
   circle(x, y, radius);
   fill(255);
   circle(x, y, radius / 2.5);
   fill(0);
   text(str(number), x-2, y+3);
 }
}
