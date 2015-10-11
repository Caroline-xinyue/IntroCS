/*******************************************************************
 * Assignment 3
 * Name: Xinyue Zhang
 * E-mail: xzhang@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted:  2/26/2015
 * This assignment is a creative art designed using string art. 
 * String art is a kind of abstract computational art based on 
 * trigonometry. I got my inspiration from the online link provided 
 * on the assignment page. This project is contained of a colorful
 * garland in the middle with spirals inside it. Besides, there is
 * a snow flake at the upper left corner, and two flowers at the upper
 * right and lower left corners. The creative parts of my coding are 
 * the if loops controlling these shapes. Basically, the shape will 
 * be drawn dynamically and at a given point, stopped as a static art. 
 * Another feature of this project is a button named "Redraw Art", 
 * which will redraw the graph when clicked.
 *********************************************************************/
float cx, cy, fx, fy;
float r1, r2, r3, r4;
float x1, x2, y1, y2, x3, y3, x4, y4, x5, y5;
float theta, theta1, theta2;
float strokeRed, strokeGreen, strokeBlue;
float strokeDeltaRed, strokeDeltaGreen, strokeDeltaBlue;
float radiusMultiple, radius;

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  background(255);

  //Initial settings
  //cx, cy are the middle of the canvas
  cx = width/2;
  cy = height/2;
  strokeRed = 247;
  strokeGreen = 170;
  strokeBlue = 140;
  strokeDeltaRed = 0.5;
  strokeDeltaGreen = 0.25;
  strokeDeltaBlue = 1;
  theta = 0.0;
  theta1 = 0.0;
  theta2 = 0.0;
  radius = 2;
  radiusMultiple = 1.008;

  // draw the "Redraw Art" button
  strokeWeight(8);
  stroke(250, 146, 146);
  fill(205, 247, 157);
  rect(4.6 * width/6, 4.5 * height/6, width/6, height/12);
  textSize(20);
  fill(255, 0, 0);
  text("Redraw Art", 4 * width/5, 4 * height/5);
}

void draw() {
  //colorful effect
  strokeWeight(1);
  strokeRed = strokeRed + strokeDeltaRed;
  if (strokeRed > 255 || strokeRed < 0) {
    strokeDeltaRed = strokeDeltaRed * (-1);
  }
  strokeGreen = strokeGreen + strokeDeltaGreen;
  if (strokeGreen > 255 || strokeGreen < 0) {
    strokeDeltaGreen = strokeDeltaGreen * (-1);
  }
  strokeBlue = strokeBlue + strokeDeltaBlue;
  if (strokeBlue > 255 || strokeBlue < 0) {
    strokeDeltaBlue = strokeDeltaBlue * (-1);
  }
  stroke(strokeRed, strokeGreen, strokeBlue, 150);
  //draw the outer garland with its center at the middle of canvas
  if (theta1 < TWO_PI/0.5) {
    drawGarland(width/5, width/20);
  }
  //draw the snowflakes and the flowers at the corners
  stroke(strokeRed, strokeGreen, strokeBlue, 120); 
  if (theta2 < TWO_PI/0.05) {
    drawSnowflake(width/8, height/8, width/40, width/48);
    stroke(233, 173, 255);
    drawFlower(width/8, 3 * height/4, width/40, width/48);
    stroke(255, 196, 100);
    drawFlower(7 * width/8, height/8, width/40, width/48);
  }
  //draw the spiral in the middle of the garland
  noFill();
  stroke(strokeRed, strokeGreen, strokeBlue);  
  strokeWeight(2); 
  theta += PI/30;
  radius *= radiusMultiple; 
  if (radius <= width/6) {
    drawSpiral(radius, theta);
  }
}

/* Renew the background, redraw the button and reset some initial settings
 when mouse clicked within the renew button to avoid messy graphs.*/
void mouseClicked() {
  if (mouseX >= 4.6 * width/6 && mouseX <= 5.6 * width/6 &&
    mouseY >= 4.5 * height/6 && mouseY <= 5 * height/6) {
    //redraw the background
      background(255); 
    //re-setup initial settings
    theta = 0.0;
    theta1 = 0.0;
    theta2 = 0.0;
    radius = 2;
    strokeRed = 247;
    strokeGreen = 170;
    strokeBlue = 140;
    strokeDeltaRed = 0.5;
    strokeDeltaGreen = 0.25;
    strokeDeltaBlue = 1;
    // draw the "Redraw Art" button
    strokeWeight(8);
    stroke(250, 146, 146);
    fill(205, 247, 157);
    rect(4.6 *width/6, 4.5 *height/6, width/6, height/12);
    textSize(20);
    fill(255, 0, 0);
    text("Redraw Art", 4 * width/5, 4 * height/5);
  }
}

//Function of outer Garland
/* Draw the garland based on the center point, inner radius and
 * outer radius
 *
 * @param r1 the  inner circle radius
 * @param r2 the  outer circle radius
 */
void drawGarland(float r1, float r2) {
  strokeWeight(3); 
  //increment for theta1
  theta1 += PI/180; 
  //determine the two ends of the lines drawing the garland
  x1 = cx + r1 * cos(theta1 * 0.5); 
  y1 = cy + r1 * sin(theta1 * 0.5); 
  x2 = x1 + r2 * cos(theta1 * 5); 
  y2 = y1 + r2 * sin(theta1 * 5); 
  //draw the outer garland
  line(x1, y1, x2, y2);
}

//function of snow flake
/* Draw the snow flake based on the center point, inner radius and
 * outer radius
 *
 * @param sx, sy  the center of the clover
 * @param r3  the inner circle radius
 * @param r4  the outer circle radius
 */
void drawSnowflake(float sx, float sy, float r3, float r4) {
  strokeWeight(4); 
  //increment for theta2
  theta2 += 1; 
  //determine the two ends of the lines drawing the snowflake
  x3 = sx + r3 * cos(theta2 * 0.1); 
  y3 = sy + r3 * sin(theta2 * 0.1); 
  x4 = x3 + r4 * sin(theta2 * 0.4); 
  y4 = y3 + r4 * cos(theta2 * 0.4); 

  //draw the snow flake
  line(sx, sy, x3, y3); 
  line(x3, y3, x4, y4);
}

//function of flower
/* Draw the flower based on the center point, inner radius and
 * outer radius (based on the code of snow flake)
 *
 * @param sx, sy  the center of the clover
 * @param r3  the inner circle radius
 * @param r4  the outer circle radius
 */
void drawFlower(float fx, float fy, float r3, float r4) {
  strokeWeight(4); 
  //increment for theta2
  theta2 += 1; 
  //determine the two ends of the lines drawing the flower
  x3 = fx + r3 * cos(theta2 * 0.1); 
  y3 = fy + r3 * sin(theta2 * 0.1); 
  x4 = x3 + r4 * sin(theta2 * 0.4); 
  y4 = y3 + r4 * cos(theta2 * 0.4); 

  //draw the flower
  ellipse(x4, y4, 3, 3);
}//drawFlower


//function spiral
/* Draw the spiral based on the center point, inner radius and
 * outer radius
 *
 * @param radius  the circle radius which will be decreased gradually
 * @param theta  the angle which will be rotated to create spiral
 */
void drawSpiral(float radius, float theta) {
  x5 = cx + radius * cos(theta); 
  y5 = cy + radius * sin(theta); 
  point(x5, y5);
}

