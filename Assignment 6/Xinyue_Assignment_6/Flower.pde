/*********************************************************
 * Represents the flowers, including all the artistic features 
 * and locations.
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
class Flower {
  //Attributes
  float w, h, r;
  PVector location, speed;
  int numPedals = 15;
  float rad = TWO_PI/numPedals;
  int count;

  //Constructor
  Flower(float fx, float fy, float s) {
    location = new PVector(fx, fy);
    w = s;
    h = 59 * w/38;
    r = 5 * w/19;
  }//end of Flower constructor

  //behaviors
  void display() {
    flower();
  }//end of display()

  /** Function flower()
   * Draw the flower
   *
   */
  void flower() {
    //Stem
    noStroke();
    fill(0, 188, 53);
    rectMode(CENTER);
    rect(location.x, location.y + 20 * h/59, w/38, 40 * h/59);

    //Leaf
    fill(0, 188, 53);
    ellipse(location.x + 9 * w/76, location.y + 26 * h/59, 
    4 * w/19, 3 * h/59);

    //Flower
    fill(245, 94, 170);
    stroke(0);
    //strokeWeight(2);
    ellipse(location.x, location.y, r, r);

    //Pedals
    fill(255, 252, 201);
    strokeWeight(1.2);
    for (int i = 0; i < numPedals; i++) {
      pushMatrix();
      translate(location.x, location.y);
      rotate(rad * i);
      pushMatrix();
      translate(0, -12 * h/59);
      ellipse(0, 0, 3 * w/19, 14 * h/59);
      popMatrix();
      popMatrix();
    }
  }//end of flower()
}//end of class Flower
