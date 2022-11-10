
// load the pictures
PImage [] gif; 
// number of frame
int numberOfFrames;
// declare a new variable to represent index of the currentImage showing
int currentImage;
void setup () {
  background(225);
  numberOfFrames = 5;
  gif = new PImage[numberOfFrames];
  // using while loop to load images
  int i = 0;
   while( i < numberOfFrames) {
     gif[i] = loadImage("frame_"+i+"_delay-0.06s.gif");
     i++;
   } 
size(600, 600);
} 
void draw() {
  image(gif[currentImage], 0, 0, width, height);
  println(frameCount);
  //modulus of mode
  if (frameCount % 3 == 0)currentImage++;
  // using conditional statement if ensure that you don't go beyond the array of image
  if (currentImage >= numberOfFrames) currentImage = 0;
}
