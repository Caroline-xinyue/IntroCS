/*******************************************************************
 * Assignment 5
 * Name: Xinyue Zhang
 * E-mail: xzhang@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted:  3/31/2015
 * This program make use of a class titled XZhangThingy and
 * calls the constructor to display a cute whale named Thomas under 
 * the sea with twinkling big eyes. 
 *
 ********************************************************************/

XZhangThingy XZWhale;
float SIZE;
color backgroundColor = color(175, 244, 247);
void setup() {
  size(800, 600);
  background(backgroundColor);
  smooth();
  SIZE = 120;
  XZWhale = new XZhangThingy(SIZE);
}//end of setup

void draw() {
  //display the whale
  XZWhale. display();
}//end of draw

/*********************************************************
 * Represents an underwater whale named Thomas, including its
 * artistic features and its location.
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
public class XZhangThingy {//definition of creature XZhangThingy
  //Fields or Attributes
  float cx, cy;
  float vx;
  float w, h;
  color headColor = color(216, 210, 216);
  color tailColor = color(200);
  color finColor = color(230);
  color eyeColor = color(61, 149, 252);
  color strokeColor = color(33, 31, 32);
  //Constructor
  XZhangThingy(float _size) {
    w = _size;
    h = 4 * w/5;
    cx = width/2;
    cy = height/2;
    vx = 10;
  }

  void display() {
    //draw the Whale head
    fill(headColor);
    noStroke();
    ellipse(cx, cy, w, h);
    stroke(strokeColor);
    arc(cx, cy, w, h, 2 * PI/9, 26 * TWO_PI/27);
    //right eye
    fill(255);
    stroke(strokeColor);
    ellipse(cx + w/10, cy, 2 * w/7, 2 * w/7);
    fill(eyeColor);
    ellipse(cx + 11 * w/100, cy + w/50, w/4, w/4);
    fill(0);
    ellipse(cx + 12 * w/100, cy + w/20, w/6, w/6);
    //left eye
    fill(255);
    stroke(strokeColor);
    pushMatrix();
    translate(cx - w/3, cy - 3 * w/100);
    rotate(PI/9);
    ellipse(0, 0, w/5, 2 * w/7);
    fill(eyeColor);
    ellipse(w/100, w/35, 8 * w/50, 4.5 * w/20);
    fill(0);
    ellipse(w/80, w/30, w/9, w/7);
    popMatrix();

    //smile
    strokeWeight(2);
    stroke(strokeColor);
    beginShape();
    noFill();
    curveVertex(cx - 17 * w/100, cy + 13 * h/40);
    curveVertex(cx - 17 * w/100, cy + 13 * h/40);
    curveVertex(cx - 2 * w/25, cy + 27 * h/80);
    curveVertex(cx - 3 * w/100, cy + 27 * h/80);
    curveVertex(cx + 3 * w/100, cy + 3 * h/10);
    curveVertex(cx + 7 * w/100, cy + h/4);
    curveVertex(cx + 7 * w/100, cy + h/4);
    endShape();

    //mouse
    stroke(strokeColor);
    beginShape();
    curveVertex(cx - 7 * w/100, cy + 17 * h/50);
    curveVertex(cx - 7 * w/100, cy + 17 * h/50);
    curveVertex(cx - 3 * w/50, cy + 33 * h/80);
    curveVertex(cx - w/50, cy + 7 * h/16);
    curveVertex(cx + 3 * w/100, cy + 2 * h/5);
    curveVertex(cx + 2 * w/50, cy + 23 * h/80);
    curveVertex(cx + 2 * w/50, cy + 23 * h/80);
    endShape();
    //tougue
    beginShape();
    fill(255, 0, 0);
    curveVertex(cx - 11 * w/200, cy + 17 * h/40);
    curveVertex(cx - 11 * w/200, cy + 17 * h/40);
    curveVertex(cx - 3 * w/100, cy + 63 * h/160);
    curveVertex(cx + w/200, cy + 31 * h/80);
    curveVertex(cx + 7 * w/200, cy + 61 * h/160);
    curveVertex(cx + 3 * w/200, cy + 69 * h/160);
    curveVertex(cx - w/100, cy + 7 * h/16);
    curveVertex(cx - w/20, cy + 7 * h/16);
    curveVertex(cx - w/20, cy + 7 * h/16);
    endShape();

    //eyebrows
    noFill();
    stroke(strokeColor);
    //left
    beginShape();
    curveVertex(cx - 7 * w/25, cy - 3 * h/10);
    curveVertex(cx - 7 * w/25, cy - 3 * h /10);
    curveVertex(cx - 11 * w/50, cy - 5 * h/16);
    curveVertex(cx - w/5, cy - 11 * h/40);
    curveVertex(cx - w/5, cy - 11 * h/40);
    endShape();
    //right
    beginShape();
    curveVertex(cx + w/20, cy - 11 * h/40);
    curveVertex(cx + w/20, cy -11 * h/40);
    curveVertex(cx + 9 * w/100, cy - 3 * h/10);
    curveVertex(cx + 17 * w/100, cy - 21 * h/80);
    curveVertex(cx + 17 * w/100, cy - 21 * h/80);
    endShape();

    //fin
    stroke(strokeColor);
    fill(finColor);
    beginShape();
    curveVertex(cx + 11 * w/40, cy + 21 * h/80);
    curveVertex(cx + 11 * w/40, cy + 21 * h/80);
    curveVertex(cx + 67 * w/200, cy + 45 * h/160);
    curveVertex(cx + 17 * w/40, cy + 57 * h/160);
    curveVertex(cx + 93 * w/200, cy + 71 * h/160);
    curveVertex(cx + 49 * w/100, cy + 3 * h/8);
    curveVertex(cx + 97 * w/200, cy + 23 * h/80);
    curveVertex(cx + 87 * w/200, cy + 7 * h/32);
    curveVertex(cx + 74 * w/200, cy + 29 * h/160);
    curveVertex(cx + 74 * w/200, cy + 29 * h/160);
    endShape();

    //tails
    stroke(strokeColor);
    fill(tailColor);
    beginShape();
    curveVertex(cx + 91 * w/200, cy + 19 * h/80);
    curveVertex(cx + 91 * w/200, cy + 19 * h/80);
    curveVertex(cx + w/2, cy + 7 * h/40);
    curveVertex(cx + 107 * w/200, cy + h/10);
    curveVertex(cx + 14 * w/25, cy - 3 * h/160);
    curveVertex(cx + 57 * w/100, cy - 9 * h/160);
    curveVertex(cx + 16 * w/25, cy - 7 * h/160);
    curveVertex(cx + 17 * w/25, cy - 7 * h/160);
    curveVertex(cx + 149 * w/200, cy - 7 * h/160);
    curveVertex(cx + 157 * w/200, cy - 13 * h/160);
    curveVertex(cx + 167 * w/200, cy - 5 * h/32);
    curveVertex(cx + 87 * w/100, cy - 7 * h/40);
    curveVertex(cx + 41 * w/50, cy - 31 * h /160);
    curveVertex(cx + 39 * w/50, cy - 37 * h/160);
    curveVertex(cx + 149 * w/200, cy - 9 * h/40);
    curveVertex(cx + 139 * w/200, cy - 29 * h/160);
    curveVertex(cx + 33 * w/50, cy - 11 * h/80);
    curveVertex(cx + 67 * w/100, cy - 19 * h/80);
    curveVertex(cx + 31 * w/50, cy - h/4);
    curveVertex(cx + 121 * w/200, cy - 9 * h/32);
    curveVertex(cx + 114 * w/200, cy - 29 * h/80);
    curveVertex(cx + 107 * w/200, cy - 47 * h/160);
    curveVertex(cx + 13 * w/25, cy - 5 * h/32);
    curveVertex(cx + 27 * w/50, cy - h/10);
    curveVertex(cx + 49 * w/100, cy - h/10);
    curveVertex(cx + 49 * w/100, cy - h/10);
    endShape();
  }
}//end of class XZhangThingy
