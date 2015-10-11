/*********************************************************
 * Represents the underwater creature whale and the bubbles it
 * produces, including all the artistic features and locations.
 *
 * @author Xinyue Zhang (xzhang@brynmawr.edu)
 *
 *****************************************************************/
class XZhangThingy {//definition of creature XZhangThingy
  //Fields or Attributes
  //Attributes for the whale
  float cx, cy;
  float vx, vy;
  float w, h;
  PVector location;
  PVector speed;
  float tailRot;
  float tailSpeed = 1;
  color headColor = color(216, 210, 216);
  color tailColor = color(200);
  color finColor = color(216);
  color eyeColor = color(61, 149, 252);
  color strokeColor = color(33, 31, 32);
  float whaleSpeed = 2; //base whale move speed
  float whaleVSpeed = .20; //factor to determine whale vertical speed
  //Attributes for the bubble
  PVector bubbleLocation;
  PVector bubbleSpeed;
  float br;
  color bubbleColor;

  //Constructor
  XZhangThingy(float _size) {
    //for the whale
    w = _size;
    h = 4 * w/5;
    cx = random(0.5 * w, width - 0.8 * w);
    cy = random(h/2, height - h/2);
    location = new PVector(cx, cy);
    vx = whaleSpeed;
    vy = vx * random(0.5 * whaleVSpeed, whaleVSpeed);
    speed = new PVector(vx, vy);
    //for the bubble
    bubbleLocation = new PVector(cx, cy - h/2 - 10);
    br = 6.0;
    bubbleSpeed = new PVector(vx, - 0.5);
    bubbleColor = color(255, 180);
  }

  void display() {
    if (speed.x > 0) {//face to the right
      pushMatrix();
      translate(location.x, location.y);
      w += 0.01;
      h = 4 * w/5;
      scale(-1, 1);
      whale();
      tail();
      popMatrix();
    } else {//face to the left
      w += 0.01;
      h = 4 * w/5;
      pushMatrix();
      translate(location.x, location.y);
      whale();
      tail();
      popMatrix();
    }
    show();
  }//end of display

  //move the whale
  void move() {
    location.add(speed);
    bounce();
    shift();
  }//end of move
  //bounce the whale back from the edges of the canvas
  void bounce() {
    if (location.x < 0.5 * w) {
      location.x = 0.5 * w;
      speed.x = -speed.x;
    }
    if (location.x > width - 0.8 * w) {
      location.x = width - 0.8 * w;
      speed.x = -speed.x;
    }
    if (location.y < 0.5 * h) {
      location.y = 0.5 * h;
      speed.y = -speed.y;
    }
    if (location.y > height - 0.5 * h) {
      location.y = height - 0.5 * h;
      speed.y = -speed.y;
    }
  }//end of bounce

  //draw the bubble
  void show() {
    pushMatrix();
    fill(bubbleColor);
    noStroke();
    translate(bubbleLocation.x, bubbleLocation.y);
    ellipse(0, 0, 2 * br, 2 * br);
    popMatrix();
  }//end of show()

  //Move the bubble together with the whale
  void shift() {
    bubbleLocation.add(bubbleSpeed);
    bubbleBounce();
  }//end of shift()

  //bounce the bubble back from the edges of the canvas
  void bubbleBounce() {
    if (bubbleLocation.x < 0.5 * w) {
      bubbleLocation.x = 0.5 * w;
      bubbleSpeed.x = -bubbleSpeed.x;
    }
    if (bubbleLocation.x > width - 0.8 * w) {
      bubbleLocation.x = width - 0.8 * w;
      bubbleSpeed.x = -bubbleSpeed.x;
    }
    //bounce the bubble continually up and down
    if (bubbleLocation.y < location.y - h/2 - 50) {
      bubbleLocation.y = location.y - h/2 - 10;
    }
  }//end of bubbleBounce()

  /** Draw the Whale
   *
   */
  void whale() {
    strokeWeight(1.5);
    //draw the Whale head
    fill(headColor);
    noStroke();
    ellipse(0, 0, w, h);
    stroke(strokeColor);
    arc(0, 0, w, h, 2 * PI/9, 26.5 * TWO_PI/27);
    //fill the connection part between the head and the tail
    noStroke();
    beginShape();
    curveVertex(70 * w/200, 15 * h/80);
    curveVertex(70 * w/200, 15 * h/80);
    curveVertex(w/2, 7 * h/40);
    curveVertex(107 * w/200, h/10);
    curveVertex(14 * w/25, -3 * h/160);
    curveVertex(49 * w/100, -h/10);
    curveVertex(49 * w/100, -h/10);
    endShape();
    //draw the connection part
    stroke(strokeColor);
    beginShape();
    curveVertex(91 * w/200, 19 * h/80);
    curveVertex(91 * w/200, 19 * h/80);
    curveVertex(w/2, 7 * h/40);
    curveVertex(107 * w/200, h/10);
    curveVertex(14 * w/25, -3 * h/160);
    curveVertex(14 * w/25, -3 * h/160);
    curveVertex(14 * w/25, -3 * h/160);
    endShape();
    line(60 * w/120, -8 * h/96, 14 * w/25, -3 * h/160);

    //right eye
    fill(255);
    ellipse(w/10, 0, 2 * w/7, 2 * w/7);
    fill(eyeColor);
    ellipse(11 * w/100, w/50, w/4, w/4);
    fill(0);
    ellipse(12 * w/100, w/20, w/6, w/6);
    //left eye
    pushMatrix();
    stroke(strokeColor);
    translate(-w/3, -3 * w/100);
    rotate(PI/15);
    fill(255);
    ellipse(0, 0, w/5, 2 * w/7);
    fill(eyeColor);
    ellipse(w/100, w/35, 8 * w/50, 4.5 * w/20);
    fill(0);
    ellipse(w/80, w/30, w/9, w/7);
    popMatrix();

    //smile
    stroke(strokeColor);
    beginShape();
    noFill();
    curveVertex(-17 * w/100, 13 * h/40);
    curveVertex(-17 * w/100, 13 * h/40);
    curveVertex(-2 * w/25, 27 * h/80);
    curveVertex(-3 * w/100, 27 * h/80);
    curveVertex(3 * w/100, 3 * h/10);
    curveVertex(7 * w/100, h/4);
    curveVertex(7 * w/100, h/4);
    endShape();

    //mouse
    stroke(strokeColor);
    noFill();
    beginShape();
    curveVertex(-7 * w/100, 17 * h/50);
    curveVertex(-7 * w/100, 17 * h/50);
    curveVertex(-3 * w/50, 33 * h/80);
    curveVertex(-w/50, 7 * h/16);
    curveVertex(3 * w/100, 2 * h/5);
    curveVertex(2 * w/50, 23 * h/80);
    curveVertex(2 * w/50, 23 * h/80);
    endShape();
    beginShape();
    fill(255, 0, 0);
    curveVertex(-11 * w/200, 17 * h/40);
    curveVertex(-11 * w/200, 17 * h/40);
    curveVertex(-3 * w/100, 63 * h/160);
    curveVertex(w/200, 31 * h/80);
    curveVertex(7 * w/200, 61 * h/160);
    curveVertex(3 * w/200, 69 * h/160);
    curveVertex(-w/100, 7 * h/16);
    curveVertex(-w/20, 7 * h/16);
    curveVertex(-w/20, 7 * h/16);
    endShape();

    //eyebrows
    noFill();
    stroke(strokeColor);
    //left
    beginShape();
    curveVertex(-7 * w/25, -3 * h/10);
    curveVertex(-7 * w/25, -3 * h /10);
    curveVertex(-11 * w/50, -5 * h/16);
    curveVertex(-w/5, -11 * h/40);
    curveVertex(-w/5, -11 * h/40);
    endShape();
    //right
    beginShape();
    curveVertex(w/20, -11 * h/40);
    curveVertex(w/20, 0 -11 * h/40);
    curveVertex(9 * w/100, -3 * h/10);
    curveVertex(17 * w/100, -21 * h/80);
    curveVertex(17 * w/100, -21 * h/80);
    endShape();

    //fin
    stroke(strokeColor);
    fill(finColor);
    beginShape();
    curveVertex(11 * w/40, 21 * h/80);
    curveVertex(11 * w/40, 21 * h/80);
    curveVertex(67 * w/200, 45 * h/160);
    curveVertex(17 * w/40, 57 * h/160);
    curveVertex(93 * w/200, 71 * h/160);
    curveVertex(49 * w/100, 3 * h/8);
    curveVertex(97 * w/200, 23 * h/80);
    curveVertex(87 * w/200, 7 * h/32);
    curveVertex(74 * w/200, 29 * h/160);
    curveVertex(74 * w/200, 29 * h/160);
    endShape();
  }//end of whale()

  /** Draw the Whale's tail
   *
   */
  void tail() {
    //tail rotational movement
    tailRot += tailSpeed;
    if (tailRot > 5) {
      tailRot = 5;
      tailSpeed *= -1;
    }
    if (tailRot < -5) {
      tailRot = -5;
      tailSpeed *= -1;
    }
    pushMatrix();
    rotate(radians(tailRot));
    //tails
    stroke(strokeColor);
    fill(tailColor);
    beginShape();
    curveVertex(14 * w/25, -3 * h/160);
    curveVertex(14 * w/25, -3 * h/160);
    curveVertex(16 * w/25, -7 * h/160);
    curveVertex(17 * w/25, -7 * h/160);
    curveVertex(149 * w/200, -7 * h/160);
    curveVertex(157 * w/200, -13 * h/160);
    curveVertex(167 * w/200, -5 * h/32);
    curveVertex(87 * w/100, -7 * h/40);
    curveVertex(41 * w/50, -31 * h /160);
    curveVertex(39 * w/50, -37 * h/160);
    curveVertex(149 * w/200, -9 * h/40);
    curveVertex(139 * w/200, -29 * h/160);
    curveVertex(33 * w/50, -11 * h/80);
    curveVertex(67 * w/100, -19 * h/80);
    curveVertex(31 * w/50, -h/4);
    curveVertex(121 * w/200, -9 * h/32);
    curveVertex(114 * w/200, -29 * h/80);
    curveVertex(107 * w/200, -47 * h/160);
    curveVertex(13 * w/25, -5 * h/32);
    curveVertex(14 * w/25, -3 * h/160);
    curveVertex(14 * w/25, -3 * h/160);
    endShape();
    popMatrix();
  }//end of tail()
}//end of class XZhangThingy

