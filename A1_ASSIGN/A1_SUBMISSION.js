//Odinkachukwu Nzekwe
//A1 Submission
let angle1 = 0;
let angle2 = 0;
let angle3 = 0;
let angle4 = 0;
let angle5 = 0;

let scalar = 30;

let c = ("blue")
let b = ("pink")

function setup() {
  createCanvas(710, 400);
  noStroke();
  rectMode(CENTER);
}

function draw() {
  background(0);

  let ang1 = radians(angle1);
  let ang2 = radians(angle2);
   
 

  let x1 = width / 2 + scalar * cos(ang1);
  let x2 = width / 3 + scalar * cos(ang2);
  let x3 = width / 4 + scalar * cos(ang2);
  let x4 = width / 6 + scalar * cos(ang2);
  let x5 = width / 5 + scalar * cos(ang2);
 
  let y1 = height / 2 + scalar * sin(ang1);
  let y2 = height / 4 + scalar * sin(ang2);
   let y3 = height / 6 + scalar * sin(ang2);
    let y4 = height / 4 + scalar * sin(ang2);
    let y5 = height / 2 + scalar * sin(ang2);


  fill(255, 200);
  rect(width * 0.4, height * 0.4, 140, 140);

  fill(c);
  ellipse(x1, height * 0.4 - 120, scalar, scalar);
  ellipse(x2, height * 0.4 + 120, scalar, scalar);
   ellipse(x3, height * 0.4 - 40, scalar, scalar);
   ellipse(x4, height * 0.4 + 50, scalar, scalar);
   ellipse(x5, height * 0.5 - 150, scalar, scalar);

  fill(b);
  ellipse(width * 0.5 - 120, y1, scalar, scalar);
  ellipse(width * 0.5 + 120, y2, scalar, scalar);
  ellipse(width * 0.5 - 130, y3, scalar, scalar);
   ellipse(width * 0.5 + 5, y4, scalar, scalar);
   ellipse(width * 0.5 - 200, y5, scalar, scalar);

  angle1 += 5;
  angle2 += 6;
  angle3 += 8;
  angle4 += 9;
  angle5 += 12;
}
