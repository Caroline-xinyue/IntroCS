/*********************************************************
 * Represents the spread of hearts, using ArrayList
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
class Spread {
  //Attribute
  ArrayList<Heart> myHearts;

  //Constructor
  Spread(float x, float y, float w, float h, int qty) {
    myHearts = new ArrayList <Heart>();
    color c =  color(168, 241, 245, 150);
    for (int i = 0; i < qty; i++) {
      float vx = random(-5, 5);
      float vy = random(1, 5);
      myHearts.add(new Heart(x, y, w, h, vx, vy, c));
    }
  }//end of constructor Spread()

  //Behavior
  boolean update() {
    for (int i = myHearts.size () - 1; i >= 0; i--) {
      Heart h = myHearts.get(i);
      if (h.update()) myHearts.remove(i);
    }
    return myHearts.size() == 0;
  }//end of boolean update()
}//end of class Spread

