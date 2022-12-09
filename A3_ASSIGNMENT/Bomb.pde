class Bomb {
  //properties
  float x;
  float y;
  float r;
  float speedY;
  color c;

  //constructor
  Bomb() {
    r = 32;
    reset();
    c = color(0);
  }
  
  //methods
  void update() {
    //update position
    x += random(-2,2);
    y += speedY;
    //check bounds
    if (y > height + r) {
      y = -r;
      x = random(width);
    }
  }

  void display() {
    noStroke();
    image(bombImage, x-r, y-r);
  }

  void caught() {
    speedY = 0;
    y = -r * 4;
  }

  void reset() {
    x = random(width);
    y = -r * 4;
    speedY = random(5,10);
  } 
}
