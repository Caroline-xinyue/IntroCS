/**********************************************************************
 * Assignment 2
 * Name: Xinyue Zhang
 * E-mail: xzhang@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted:  2/10/2015
 *
 * This is a dynamic drawing designed for the incoming lunar Chinese
 * New Year. First, the hammer will move along with your mouse, and the 
 * alphabets will wander around randomly within a circle of radius 300
 * which centered at the mouse position. When you click the mouse
 * within the smallest rectangular which enclosed the painted eggshell, 
 * the egg will crash and the text "Happy new year" as well as my 
 * signature will appear in the middle of the canvas. If you click 
 * outside of that rectangular, a star will be drawn around within a 
 * circle of radius 100 which centered at the mouse position at which
 * clicking the left button; otherwise, a colorful flower will be 
 * drawn around. Have fun playing around with this project and 
 * Happy Chinese lunar New Year!
 *********************************************************************/
float radOut = random(8, 20);
float radIn = radOut*.5;
float sza = random(10, 20);
float szb = random(5, 20);
void setup() {
  size(500, 500);
  background(253, 234, 255);
  frameRate(20);
  smooth();
}

void draw() {
  /*If the mouse clicked within the smallest rectangular which enclosed the egg,
   the egg is cracked and New Year greetings and my signature will appear. */
  if (mousePressed && mouseX > width/6 && mouseX < 5*width/6 && mouseY > height/4 
    && mouseY < 3 * height/4) {
    background(253, 234, 255);
    //signature
    fill(#6732FA);
    textSize(24);
    text("Xinyue Zhang", 2 * width/3, height/10);

    //draw Crackedegg and Cracks
    //left
    stroke(255, 116, 160);
    strokeWeight(6);
    fill(250, 236, 192);
    beginShape();
    pushMatrix();
    translate(width/3, 2 * height/3);
    rotate(-PI/4);
    drawCrackedegg(0, 0, 2 * width/3, height/2);
    drawCracks(0, 0, 2 * width/3, height/2);
    popMatrix();
    endShape();
    //right
    beginShape();
    pushMatrix();
    translate(2 * width/3, 2 * height/3);
    rotate(-3*PI/4);
    drawCrackedegg(0, 0, 2 * width/3, height/2);
    drawCracks(0, 0, 2 * width/3, height/2);
    popMatrix();
    endShape();

    //draw greetings in the middle of the canvas
    strokeWeight(10);
    stroke(random(0, 255), random(126, 255), random(126, 255));
    drawH(3 * width/20, height/6, width/6, height/10);
    stroke(random(0, 255), random(126, 255), random(126, 255));
    drawA(7 * width/20, height/6, width/6, height/10);
    stroke(random(0, 255), random(126, 255), random(126, 255));
    drawP(9 * width/20, height/6, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawP(3 * width/5, height/6, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawY(3 * width/4, height/4, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawN(3 * width/10, 5*height/12, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawE(9 * width/20, 5*height/12, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawW(13 * width/20, height/2, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawY(11 * width/40, 3*height/4, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawE(3 * width/8, 2*height/3, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawA(23 * width/40, 2*height/3, width/6, height/10);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    drawR(27 * width/40, 2*height/3, width/6, height/10);
  } else {
    //the effect of random alphebets that made up of "Happy New Year"
    pushMatrix();
    background(253, 234, 255);
    strokeWeight(10);
    stroke(255, 150, 147);
    drawH(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(255, 151, 90);
    drawA(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(255, 222, 90);
    drawP(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(187, 237, 38);
    drawY(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(38, 237, 179);
    drawN(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(38, 209, 237);
    drawE(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(156, 91, 250);
    drawW(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    stroke(250, 91, 221);
    drawR(mouseX + random(-300, 300), mouseY + random(-300, 300), random(0, 100), 
    random(0, 50));
    popMatrix();

    /*if mouse clicked outside of that rectangular, stars will be drawn randomly
     according to the mouse position, if clicked the left button; similarly,
     flowers will be drawn randomly when clicked the right button*/
    if (mousePressed && (mouseButton == LEFT)) {
      //draw star
      strokeWeight(2 * radOut/5);
      pushMatrix();
      translate(mouseX - random(-100, 100), mouseY - random(-100, 100));
      stroke(random(255), random(255), random(255));
      fill(151, 250, 242);
      drawStar(5, radIn, radOut);
      popMatrix();
    } else if (mousePressed && (mouseButton == RIGHT)) {
      //draw flower
      pushMatrix();
      noStroke();
      drawFlower(mouseX + random(-100, 100), mouseY + random(-100, 100), random(0, 30));
      popMatrix();
    }
    //} 

    //draw egg in the middle of the canvas
    stroke(247, 90, 90);
    strokeWeight(6);
    fill(252, 204, 107);
    drawEgg(width/2, height/2, 2 * width/3, height/2);

    //draw decorative stars on the egg
    strokeWeight(2 * radOut/5);
    pushMatrix();
    translate(width/2, height/2);
    drawStar(5, radIn, radOut);
    popMatrix();

    pushMatrix();
    translate(2 * width/3, 2 * height/5);
    scale(.7);
    drawStar(5, radIn, radOut);
    popMatrix();

    pushMatrix();
    translate(7 * width/12, 7 * height/20);
    scale(.7);
    rotate(PI/4);
    drawStar(5, radIn, radOut);
    popMatrix();

    pushMatrix();
    translate(9 * width/20, 2 * height/3);
    scale(.5);
    rotate(PI/4);
    drawStar(5, radIn, radOut);
    popMatrix();

    pushMatrix();
    translate(8 * width/15, 13 * height/20);
    scale(.3);
    rotate(PI/4);
    drawStar(5, radIn, radOut);
    popMatrix();

    pushMatrix();
    translate(width/4, 7*height/15);
    scale(.4);
    rotate(PI/3);
    drawStar(5, radIn, radOut);
    popMatrix();

    pushMatrix();
    translate(width/3, 7*height/12);
    scale(.7);
    rotate(PI/2);
    drawStar(5, radIn, radOut);
    popMatrix();

    //draw decorative flowers on the egg
    pushMatrix();
    noStroke();
    drawFlower(13 * width/20, 7 * height/12, sza);
    popMatrix();

    pushMatrix();
    noStroke();
    drawFlower(10 * width/30, 3 * height/8, szb);
    popMatrix();

    //draw the hammer based on the mouse position
    pushMatrix();
    strokeWeight(1);
    translate(mouseX, mouseY);
    rotate(-PI/4);
    drawHammer(0, 0, width/6, height/12);
    popMatrix();
  }
}

//function hammer
void drawHammer(float x, float y, float w, float h) {
  strokeWeight(8);
  stroke(137, 110, 81);
  fill(252, 249, 176);
  rect(x, y, w, h);
  stroke(70, 45, 21);
  fill(124, 90, 21);
  rect(x + 2*w/5, y + h, w/5, 4*h);
}

//function egg
void drawEgg(float x, float y, float w, float h) {
  strokeWeight(10);
  ellipse(x, y, w, h);
}

//function crackedegg
void drawCrackedegg(float x, float y, float w, float h) {
  strokeWeight(10);
  arc(x, y, w, h, PI/2, 3*PI/2);
}

//function cracks
void drawCracks(float x, float y, float w, float h) {
  beginShape();
  vertex(x, y - h/2);
  vertex(x - w/8, y - h/3);
  vertex(x, y - h/6);
  vertex(x - w/8, y);
  vertex(x, y + h/6);
  vertex(x - w/8, y + h/3);
  vertex(x, y + h/2);
  endShape();
}

//function alphebet H
void drawH(float x, float y, float w, float h) {
  line(x, y, x, y + w);
  line(x, y + w/2, x + h, y + w/2);
  line(x + h, y, x + h, y + w);
}

//function alphebet A
void drawA(float x, float y, float w, float h) {
  line(x, y, x - h/2, y + w);
  line(x, y, x + h/2, y + w);
  line(x - 3 * h/10, y + 3 * w/5, x + 3 * h/10, y + 3 * w/5);
}

//function alphebet P
void drawP(float x, float y, float w, float h) {
  noFill();
  line(x, y, x, y + w);
  arc(x, y + w/4, 1.5 * h, w/2, -PI/2, PI/2);
}

//function alphebet Y
void drawY(float x, float y, float w, float h) {
  line(x, y, x - h/2, y - w/2);
  line(x, y, x + h/2, y - w/2);
  line(x, y, x, y + w/2);
}

//function alphebet N
void drawN(float x, float y, float w, float h) {
  line(x, y, x, y + w);
  line(x, y, x + h, y + w);
  line(x + h, y + w, x + h, y);
}

//function alphebet E
void drawE(float x, float y, float w, float h) {
  line(x, y, x + h, y);
  line(x, y + w/2, x + h, y + w/2);
  line(x, y + w, x + h, y + w);
  line(x, y, x, y + w);
}

//function alphebet W
void drawW(float x, float y, float w, float h) {
  line(x, y, x - h/3, y + w/2);
  line(x, y, x + h/3, y + w/2);
  line(x - h/3, y + w/2, x - h/2, y - w/2);
  line(x + h/3, y + w/2, x + h/2, y - w/2);
}

//function alphebet R
void drawR(float x, float y, float w, float h) {
  noFill();
  line(x, y, x, y + w);
  line(x, y + w/2, x + h, y + w);
  arc(x, y + w/4, 2*h, w/2, -PI/2, PI/2);
}

//function star incorporated from textbook
void drawStar(int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0;
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;

  beginShape();
  for (int i=0; i<pointCount; i++) {
    for (int j=0; j<2; j++) {
      tempRadius = innerRadius;
      if (j%2==0) {
        tempRadius = outerRadius;
      }
      x = cos(theta)*tempRadius;
      y = sin(theta)*tempRadius;
      vertex(x, y);
      theta += thetaRot;
    }
  }
  endShape(CLOSE);
}

//function flower
void drawPedal(float x, float y, float sz) {
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x + 0.1 * sz, y - 0.5 * sz);
  curveVertex(x + 0.5 * sz, y - sz);
  curveVertex(x + sz, y - 0.5 * sz);
  curveVertex(x + 0.5 * sz, y - 0.1 * sz);
  curveVertex(x, y);
  curveVertex(x, y);
  endShape();
}

void drawFlower(float x, float y, float sz) {
  pushMatrix();
  translate(x, y);
  fill(#F07979);
  drawPedal(0, 0, sz);
  rotate(2*PI/5);
  fill(#D379F0);
  drawPedal(0, 0, sz);
  rotate(2*PI/5);
  fill(#79EBF0);
  drawPedal(0, 0, sz);
  rotate(2*PI/5);
  fill(#FA9A23);
  drawPedal(0, 0, sz);
  rotate(2*PI/5);
  fill(#C3F775);
  drawPedal(0, 0, sz);
  rotate(2*PI/5);
  fill(#FA60BD);
  drawPedal(0, 0, sz);
  popMatrix();
}

