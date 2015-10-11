/*********************************************************
 * Represents the butterflies, including all the artistic 
 * features and locations.
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
class Butterfly {
  //Attributes
  float w, h;
  PVector location;
  PVector speed;

  //Constructor
  Butterfly(float bx, float by, float _vx, float _vy, float s) {
    location = new PVector(bx, by);
    speed = new PVector(_vx, _vy);
    h = s;
    w = 102 * h/95;
  }//end of Butterfly constructor

  //Behavior
  void display() {
    butterfly();
  }//end of display()

  void move() {
    location.add(speed);
    bounce();
  }//end of move()

  void bounce() {
    if (location.y < h/2 || location.y > height/2) {
      speed.y *= (-1);
    }
  }//end of bounce()

  /** Function butterfly()
   * Draw the butterfly
   *
   */
  void butterfly() {
    noStroke();
    //left wing
    fill(216, 44, 255);
    ellipse(location.x - 55 * w/204, location.y - 11 * h/38, 15 * w/34, 
    15 * w/34);
    ellipse(location.x - 25 * w/102, location.y + 7 * h/19, 5 * w/17, 
    5 * w/17);
    triangle(location.x, location.y - 4 * h/19, location.x - 47 * w/102, 
    location.y - 17 * h/95, location.x - 25 * w/102, location.y + 4 * h/19);
    triangle(location.x - 5 * w/51, location.y - 32 * h/95, location.x - 20 * w/51, 
    location.y + 32 * h/95, location.x, location.y + 4 * h/19);
    triangle(location.x, location.y + 5 * h/19, location.x - 2 * w/17, 
    location.y + 42 * h/95, location.x - 5 * w/17, location.y + 2 * h/19);

    //left wing decoration
    fill(248, 169, 240);
    ellipse(location.x - 55 * w/204, location.y - 11 * h/38, 5 * w/34, 5 * w/34);
    ellipse(location.x - 25 * w/102, location.y+7 * h/19, 5 * w/51, 5 * w/51);

    //right wing
    fill(216, 44, 255);
    ellipse(location.x + 55 * w/204, location.y - 11 * h/38, 15 * w/34, 15 * w/34);
    ellipse(location.x + 25 * w/102, location.y + 7 * h/19, 5 * w/17, 5 * w/17);
    triangle(location.x, location.y - 4 * h/19, location.x + 47 * w/102, 
    location.y - 17 * h/95, location.x + 25 * w/102, location.y + 4 * h/19);
    triangle(location.x + 5 * w/51, location.y - 32 * h/95, location.x + 20 * w/51, 
    location.y + 32 * h/95, location.x, location.y + 4 * h/19);
    triangle(location.x, location.y + 5 * h/19, location.x + 2 * w/17, 
    location.y + 42 * h/95, location.x + 5 * w/17, location.y + 2 * h/19);

    //right wing decoration
    fill(248, 169, 240);
    ellipse(location.x + 55 * w/204, location.y - 11 * h/38, 5 * w/34, 5 * w/34);
    ellipse(location.x + 25 * w/102, location.y + 7 * h/19, 5 * w/51, 5 * w/51);

    //main body
    fill(0, 0, 0);
    ellipse(location.x, location.y - 43 * h/190, 25 * w/204, 25 * w/204);
    ellipse(location.x, location.y + h/19, 25 * w/204, 11 * h/19);

    //horns
    stroke(0);
    strokeWeight(2);
    noFill();
    line(location.x - w/51, location.y - 43 * h/190, location.x - 2 * w/51, 
    location.y - 8 * h/19);
    line(location.x, location.y - 43 * h/190, location.x + 2 * w/51, 
    location.y - 8 * h/19);
  }//end of butterfly()
}//end of class Butterfly

