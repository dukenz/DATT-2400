String gameState;
int wins;
int losses;
// pass in the value of how many times the timer is going to run
Timer countDownTimer;
int timeLeft;
int maxTime;

//variables from catcher game
Catcher catcher;
Drop [] drops;
int numDrops;
// How many times the timer is going to run
Timer timer;
int timeInterval;
int activeDrops;

int score;
String s;

//bomb
Bomb b;

//images
PImage backgroundImage;
PImage boy;
PImage bombImage;
PImage[] appleImages;


void setup() {
  size(900, 800);

  //images
  backgroundImage = loadImage("bg.jpg");
  boy = loadImage("boycatcher.jpg");
  bombImage = loadImage("lion2.jpg");
  appleImages = new PImage[100];
  for (int i = 0; i < 100; i++) {
    appleImages[i] = loadImage("apple1.jpg");
  }


  //bomb
  b = new Bomb();

  //catcher game vars init
  catcher = new Catcher(16);
  // loop through timer complete method
  numDrops = 500;
  drops = new Drop [numDrops];
  for (int i = 0; i < numDrops; i++) {
    drops[i] = new Drop();
  }
  activeDrops = 0;
  timeInterval = 500;

  timer = new Timer(timeInterval);
  timer.start();

  score = 0;
  s = "";

  //game state vars init
  gameState = "START";
  wins = 0;
  losses = 0;

  countDownTimer = new Timer(1000);
  maxTime = 60;
  timeLeft = maxTime;
}

void draw() {
  clearBackground();
  if (gameState == "START") {
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
     noCursor();;
  } else if (gameState == "WIN") {
    winGame();
    cursor();
  } else if (gameState == "LOSE") {
    loseGame();
    cursor();
  }
}

void startGame() {
  textAlign(CENTER);
  textSize(18);
  fill(255, 0, 0);
  text("Click Anywhere to Play!", width/2, height/2);
  textSize(14);
  fill(0, 0, 255);
  text("Catch the drops\nbefore time runs out", width/2, height/2+30);
  //look for the click
  if (mousePressed == true) {
    gameState = "PLAY";
    countDownTimer.start();
  }
  showScore();
}
void playGame() {
  //catcher game logic
  noStroke();
  //clearBackground();
  image(backgroundImage, 0, 0);
  catcher.update();
  catcher.display();
  //timer stuff
  if (timer.complete()==true) {
    if (activeDrops < numDrops ) {
      activeDrops++;
    }
    timer.start();
  }

  //bomb stuff
  b.update();
  b.display();
  if (intersect(catcher, b) == true) {
    gameState = "LOSE";
  }

  //update stuff
  for (int i = 0; i < activeDrops; i++) {
    drops[i].update();
    drops[i].display();
    //check collisions
    if (intersect(catcher, drops[i]) == true ) {
      drops[i].caught();
      score++;
      if (score >= 100) {
        //win
        wins++;
        gameState = "WIN";
      }
    }
  }
  //countDown logic
  if (countDownTimer.complete() == true) {
    if (timeLeft > 1 ) {
      timeLeft--;
      countDownTimer.start();
    } else {
      //lose
      losses++;
      gameState = "LOSE";
    }
  }
  //update UI
  textAlign(LEFT);
  textSize(12);
  fill(255, 205, 255);

  //show countDown on UI
  s = "Time Left: " + timeLeft;
  text(s, 20, 20);

  //show score
  s = "Score: " + score;
  text(s, 20, 40);
}

void winGame() {
  textAlign(CENTER);
  textSize(32);
  fill(0, 255, 0);
  text("Great Job! That was so difficult.\nYou should be proud", width/2, height/2);
  textSize(14);
  fill(0, 0, 255);
  text("Play Again?", width/2, height/2+50);

  drawReplayButton();
  showScore();
}
void loseGame() {
  textAlign(CENTER);
  textSize(32);
  fill(255, 0, 0);
  text("You Lost! it takes talent to win.", width/2, height/2);
  textSize(14);
  fill(0, 0, 255);
  text("Try Again?", width/2, height/2+50);

  drawReplayButton();
  showScore();
}

void resetGame() {
  timeLeft = maxTime;
  countDownTimer.start();
  score = 0;
  for (int i = 0; i < numDrops; i++) {
    drops[i].reset();
  }
  activeDrops = 0;
  timer.start();
  b.reset();
}

void showScore() {
  //set the text for w/l
  textAlign(LEFT);
  textSize(14);
  fill(0);
  String s = "Wins: " + wins + "\n" + "Losses: " + losses;
  text(s, 20, 50);
}
void drawReplayButton() {
  //draw button
  fill(100);
  rect(width/2-50, height/2+80, 100, 60);
  fill(0, 0, 255);
  textSize(32);
  text("PLAY", width/2, height/2+120);
  //edges of the button
  float leftEdge = width/2-50;
  float rightEdge = width/2 + 50;
  float topEdge = height/2 + 80;
  float bottomEdge = height/2 + 140;
  //look for the click
  if (mousePressed == true &&
    mouseX > leftEdge &&
    mouseX < rightEdge &&
    mouseY > topEdge &&
    mouseY < bottomEdge
    ) {
    resetGame();
    gameState = "PLAY";
  }
}

boolean intersect(Catcher a, Drop b) {
  float distance = dist(a.x, a.y, b.x, b.y);
  if (distance < a.r+b.r) {
    return true;
  } else {
    return false;
  }
}
boolean intersect(Catcher a, Bomb b) {
  float distance = dist(a.x, a.y, b.x, b.y);
  if (distance < a.r+b.r) {
    return true;
  } else {
    return false;
  }
}

void clearBackground() {
  fill(255, 120);
  rect(0, 0, width, height);
}
