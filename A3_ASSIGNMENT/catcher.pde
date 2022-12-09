 class Catcher {
 float r;
 float x, y;
 
 Catcher(float tempRadius){
   r = tempRadius;
   // x and y object
   x = width/2;
   y = height/2;
 }
  void update(){
    // update function move x and y object
    x = mouseX;
    y = mouseY;
  }
  void display(){
    noStroke();
    fill(0,255,0,128);
    ellipse(x,y,r*2,r*2);
    image(boy, x-r, y-r);
  }
 }
