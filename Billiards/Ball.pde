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
}
