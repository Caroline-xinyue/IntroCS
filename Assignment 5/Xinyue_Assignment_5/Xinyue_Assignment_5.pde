/*******************************************************************
 * Assignment 6
 * Name: Xinyue Zhang
 * E-mail: xzhang@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted:  4/6/2015
 * This program makes use of the class XZhangThingy, which defines the
 * movement of the whale and the bubbles. Besides this program makes good
 * use of the PVector class to control the movements. Every time the 
 * program runs, a whale of random size will be displayed at a random 
 * location within the canvas creating bubbles that rise upwards. It will 
 * grow bigger as it moves, its tail will wave back and forth and it will 
 * bounce back when it hits the edges.
 ********************************************************************/
XZhangThingy XZWhale;
float SIZE;
color backgroundColor = color(175, 244, 247);
void setup() {
  size(800, 600);
  background(backgroundColor, 20);
  smooth();
  SIZE = random(80, 150);
  XZWhale = new XZhangThingy(SIZE);
}//end of setup()

void draw() {
  background(backgroundColor, 20);
  //move the whale and bubble
  XZWhale.move();
  //display the whale and bubble
  XZWhale.display();
}//end of draw()
