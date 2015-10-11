/**********************************************************************************************************************************
 * Assignment 1
 * Name: Xinyue Zhang
 * E-mail: xzhang@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted:  2/2/2015
 *
 * Picture of Olaf from the movie "Frozen" with his baby basking 
 * in the sunshine. If you click the mouse, you will find them 
 * reaching the musical notes, and my signature will show up 
 * to the right :)
 **********************************************************************************************************************************/
void setup() {
  size(500, 500);
  smooth();
  background(191, 251, 252);
}
void draw() {
  Olaf(190, 220);
  scale(0.5);
  Olaf(760, 660);
  scale(2.0);
  //sun
  fill(255, 0, 0, 126);
  arc(500, 0, 200, 200, PI/2, PI);

  //sunshine
  fill(250, 207, 50);
  ellipse(370, 10, 10, 10);
  fill(182, 77, 247);
  ellipse(380, 40, 10, 10);
  fill(130, 252, 120);
  ellipse(395, 70, 10, 10);
  fill(252, 242, 120);
  ellipse(415, 95, 10, 10);
  fill(120, 178, 252);
  ellipse(440, 110, 10, 10);
  fill(252, 120, 252);
  ellipse(475, 125, 10, 10);

  if (mousePressed == true) {
    //musical notes
    Note(50, 100);
    scale(0.5);
    Note(620, 540);
    scale(2.0);

    //signature
    fill(#6732FA);
    textSize(24);
    text("Xinyue Zhang", 300, 200);
    /*println(mouseX);
     println(mouseY);*/
    //the method I used to find curve coordinates
  }
}
void Olaf(float centerX, float centerY) {
  //body
  stroke(200);
  strokeWeight(1.2);
  fill(250);
  ellipse(centerX - 5, centerY + 120, 200, 200);
  ellipse(centerX, centerY, 100, 100);

  fill(0);
  ellipse(centerX - 25, centerY, 20, 20);
  ellipse(centerX - 38, centerY + 100, 35, 35);
  ellipse(centerX - 40, centerY + 140, 32, 32);

  //hair
  noFill();
  stroke(98, 70, 70);
  beginShape();
  curveVertex(centerX + 2, centerY -201);
  curveVertex(centerX + 2, centerY -201);
  curveVertex(centerX, centerY -212);
  curveVertex(centerX - 10, centerY - 217);
  curveVertex(centerX - 10, centerY - 217);
  endShape();
  beginShape();
  curveVertex(centerX + 11, centerY - 194);
  curveVertex(centerX + 11, centerY - 194);
  curveVertex(centerX + 16, centerY - 210);
  curveVertex(centerX + 13, centerY - 215);
  curveVertex(centerX + 11, centerY - 217);
  curveVertex(centerX + 11, centerY - 217);
  endShape();
  beginShape();
  curveVertex(centerX + 17, centerY - 195);
  curveVertex(centerX + 17, centerY - 195);
  curveVertex(centerX + 22, centerY - 206);
  curveVertex(centerX + 32, centerY - 212);
  curveVertex(centerX + 42, centerY - 216);
  curveVertex(centerX + 55, centerY - 215);
  curveVertex(centerX + 55, centerY - 215);
  endShape();

  //arm and hand
  //right
  stroke(0);
  strokeWeight(0.5);
  fill(129, 91, 91);
  beginShape();
  curveVertex(centerX + 16, centerY + 1);
  curveVertex(centerX + 16, centerY + 1);
  curveVertex(centerX + 19, centerY - 13);
  curveVertex(centerX + 29, centerY + 5);
  curveVertex(centerX + 54, centerY + 138);
  curveVertex(centerX + 66, centerY + 152);
  curveVertex(centerX + 75, centerY + 161);
  curveVertex(centerX + 71, centerY + 165);
  curveVertex(centerX + 61, centerY + 160);
  curveVertex(centerX + 69, centerY + 177);
  curveVertex(centerX + 63, centerY + 181);
  curveVertex(centerX + 49, centerY + 161);
  curveVertex(centerX + 41, centerY + 187);
  curveVertex(centerX + 35, centerY + 189);
  curveVertex(centerX + 33, centerY + 182);
  curveVertex(centerX + 41, centerY + 158);
  curveVertex(centerX + 38, centerY + 142);
  curveVertex(centerX + 26, centerY + 149);
  curveVertex(centerX + 23, centerY + 141);
  curveVertex(centerX + 34, centerY + 134);
  curveVertex(centerX + 33, centerY + 86);
  curveVertex(centerX + 24, centerY + 39);
  curveVertex(centerX + 16, centerY + 1);
  curveVertex(centerX + 16, centerY + 1);
  endShape();
  //left
  fill(129, 91, 91);
  beginShape();
  curveVertex(centerX - 39, centerY - 31);
  curveVertex(centerX - 39, centerY - 31);
  curveVertex(centerX - 32, centerY - 37);
  curveVertex(centerX - 57, centerY - 81);
  curveVertex(centerX - 100, centerY - 118);
  curveVertex(centerX - 99, centerY - 124);
  curveVertex(centerX - 94, centerY - 127);
  curveVertex(centerX - 96, centerY - 133);
  curveVertex(centerX - 101, centerY - 128);
  curveVertex(centerX - 106, centerY - 125);
  curveVertex(centerX - 108, centerY - 131);
  curveVertex(centerX - 112, centerY - 134);
  curveVertex(centerX - 111, centerY - 161);
  curveVertex(centerX - 118, centerY - 157);
  curveVertex(centerX - 117, centerY - 131);
  curveVertex(centerX - 123, centerY - 131);
  curveVertex(centerX - 136, centerY - 154);
  curveVertex(centerX - 141, centerY - 150);
  curveVertex(centerX - 127, centerY - 126);
  curveVertex(centerX - 143, centerY - 124);
  curveVertex(centerX - 146, centerY - 115);
  curveVertex(centerX - 118, centerY - 117);
  curveVertex(centerX - 80, centerY - 87);
  curveVertex(centerX - 38, centerY - 32);
  curveVertex(centerX - 38, centerY - 32);
  endShape();
  //feet
  noFill();
  stroke(180);
  strokeWeight(1.2);
  fill(220);
  //left
  beginShape();
  curveVertex(centerX - 75, centerY + 193);
  curveVertex(centerX - 75, centerY + 193);
  curveVertex(centerX - 82, centerY + 215);
  curveVertex(centerX - 77, centerY + 231);
  curveVertex(centerX - 57, centerY + 234);
  curveVertex(centerX - 36, centerY + 236);
  curveVertex(centerX - 32, centerY + 230);
  curveVertex(centerX - 31, centerY + 218);
  curveVertex(centerX - 53, centerY + 210);
  curveVertex(centerX - 75, centerY + 193);
  curveVertex(centerX - 75, centerY + 193);
  endShape(CLOSE);
  //right
  beginShape();
  curveVertex(centerX - 31, centerY + 218);
  curveVertex(centerX - 31, centerY + 218);
  curveVertex(centerX - 32, centerY + 230);
  curveVertex(centerX - 36, centerY + 236);
  curveVertex(centerX - 8, centerY + 242);
  curveVertex(centerX + 19, centerY + 241);
  curveVertex(centerX + 26, centerY + 231);
  curveVertex(centerX + 23, centerY + 219);
  curveVertex(centerX + 21, centerY + 219);
  curveVertex(centerX - 4, centerY + 221);
  curveVertex(centerX - 32, centerY + 218);
  curveVertex(centerX - 32, centerY + 218);
  endShape(CLOSE);

  //head
  stroke(205);
  strokeWeight(1);
  fill(233);
  beginShape();
  curveVertex(centerX - 5, centerY - 135);
  curveVertex(centerX - 5, centerY - 135);
  curveVertex(centerX - 20, centerY - 137);
  curveVertex(centerX - 45, centerY - 155);
  curveVertex(centerX - 55, centerY - 140);
  curveVertex(centerX - 53, centerY - 115);
  curveVertex(centerX - 39, centerY - 76);
  curveVertex(centerX - 18, centerY - 45);
  curveVertex(centerX - 14, centerY - 42);
  curveVertex(centerX - 6, centerY - 40);
  curveVertex(centerX + 4, centerY - 39);
  curveVertex(centerX + 8, centerY - 41);
  curveVertex(centerX + 17, centerY - 46);
  curveVertex(centerX + 32, centerY - 60);
  curveVertex(centerX + 45, centerY - 91);
  curveVertex(centerX + 49, centerY - 106);
  curveVertex(centerX + 52, centerY - 126);
  curveVertex(centerX + 56, centerY - 145);
  curveVertex(centerX + 48, centerY - 153);
  curveVertex(centerX + 50, centerY - 153);
  curveVertex(centerX + 46, centerY - 157);
  curveVertex(centerX + 44, centerY - 164);
  curveVertex(centerX + 43, centerY - 178);
  curveVertex(centerX + 25, centerY - 191);
  curveVertex(centerX + 1, centerY - 198);
  curveVertex(centerX - 18, centerY - 198);
  curveVertex(centerX - 35, centerY - 181);
  curveVertex(centerX - 44, centerY - 153);
  curveVertex(centerX - 44, centerY - 153);
  endShape();

  //eyebrows
  stroke(128);
  fill(0);
  //left
  triangle(centerX + 5, centerY - 190, centerX + 5, centerY - 180, centerX - 25, centerY - 170);
  //right
  triangle(centerX + 15, centerY - 190, centerX + 15, centerY - 180, centerX + 45, centerY - 170);

  //eyes
  //left
  stroke(0);
  strokeWeight(1.5);
  fill(255);
  ellipse(centerX - 5, centerY - 150, 30, 30);
  fill(0);
  ellipse(centerX - 5, centerY - 150, 10, 10);
  //right
  fill(255);
  ellipse(centerX + 28, centerY - 150, 30, 30);
  fill(0);
  ellipse(centerX + 28, centerY - 150, 10, 10);

  //nose
  stroke(234, 164, 9);
  fill(234, 164, 9);
  triangle(centerX + 12, centerY - 140, centerX + 30, centerY - 142, centerX + 60, centerY - 100);

  //smile
  noFill();
  stroke(155);
  strokeWeight(0.8);
  beginShape();
  curveVertex(centerX - 45, centerY - 142);
  curveVertex(centerX - 45, centerY - 142);
  curveVertex(centerX - 15, centerY - 110);
  curveVertex(centerX + 55, centerY - 100);
  curveVertex(centerX + 50, centerY - 140);
  curveVertex(centerX + 50, centerY - 140);
  endShape();

  //teeth
  noStroke();
  fill(255);
  beginShape();
  curveVertex(centerX + 3, centerY - 101);
  curveVertex(centerX + 3, centerY - 101);
  curveVertex(centerX, centerY - 84);
  curveVertex(centerX + 17, centerY - 78);
  curveVertex(centerX + 34, centerY - 80);
  curveVertex(centerX + 39, centerY - 97);
  curveVertex(centerX + 39, centerY - 97);
  endShape(CLOSE);
}
void Note(int noteX, int noteY) {
  fill(225, 159, 250);
  noStroke();
  rect(noteX + 20, noteY - 90, 10, 95);
  stroke(225, 159, 250);
  strokeWeight(2);
  line(noteX + 29, noteY - 85, noteX + 51, noteY - 92);
  line(noteX + 29, noteY - 80, noteX + 51, noteY - 87);
  fill(#FAAA7C);
  ellipse(noteX, noteY, 40, 40);
}

