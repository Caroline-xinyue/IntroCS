/*********************************************************
 * Represents the hearts, including all the artistic features 
 * and locations.
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
class Heart {
  //Attributes
  float w, h;
  PVector location, speed;
  color c;

  //Constructor
  Heart(float _hx, float _hy, float _hw, float _hh, float _vx, float _vy, color _c) {
    location = new PVector(_hx, _hy);
    speed = new PVector(_vx, _vy);
    w = _hw;
    h = _hh;
    c = _c;
  }//end of constructor Heart

  //behaviors
  void accelerate(float a) {
    speed.y += a;
  }//end of accelerate()

  boolean update() {
    location.add(speed);
    heart();
    return location.y > height || location.x < 0 || location.x > width;
  }//end of update()

  /***************************************
   * Function flower()
   * Draw the flower
   *
   * I referred to Proce55ing.walker, blog
   * http://blog.p5info.com/?p=28
   ***************************************/

  void heart() {
    final float WIDTH = w/2 * 0.85;
    final float HEIGHT = h/2;
    final float OFFSET = location.y - (HEIGHT / 6 * 5);
    noStroke();
    fill(c);
    beginShape();
    for (int i = 0; i < 30; i++) {
      float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) 
        * sin(radians(i * 12)) * WIDTH + location.x;
      float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) 
        * HEIGHT + OFFSET;
      vertex(tx, ty);
    }
    endShape(CLOSE);
  }
}//end of class Heart

