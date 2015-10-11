/*********************************************************
 * Represents the giving texts, including all the contents and
 * movement.
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
class Text {
  //Attribute
  String t;
  PFont f;
  float x, y;
  color c = color(23, 75, 255);

  //Constructor
  Text(String _t, float _x, float _y, float s) {
    t = _t;
    x = _x;
    y = _y;
    f = createFont("Arial Bold", s, true);
  }//end of constructor Text()

  //Behavior
  void display() {
    textFont(f);
    fill(c);
    text(t, x, y);
  }//end of display()

  void fromRight() {
    x--;
  }//end of fromRight()

  void fromLeft() {
    x++;
  }//end of fromLeft()

  void  fromTop() {
    y++;
  }//end of fromTop()

  void fromBottom() {
    y--;
  }//end of fromBottom()
}//end of class Test

