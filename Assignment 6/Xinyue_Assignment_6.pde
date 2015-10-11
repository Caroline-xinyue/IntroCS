/*******************************************************************
 * Assignment 7
 * Name: Xinyue Zhang
 * E-mail: xzhang@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted:  4/23/2015
 *     This program shows a well-designed Mother-day card that contains
 * an artistic text "MOM" with flowers at each vertex, a pink butterfly, 
 * symbolizing my hardworking mom, flying up and down and finally a poem
 * written for my mom to express my deep love and thankfulness. Additionally,
 * the decorative hearts will spread all the canvas from the top center.
 *     The second part of this program contains a fading effect of the scenery
 * of Bryn Mawr within four seasons. I wish my mom could enjoy the beautiful
 * campus through this mother's day card! Finally, I displayed an image as 
 * the ending to wish my mom Happy Mother’s Day.
 *     Enjoy the movie and happy mother's day for moms all over the world.
 ********************************************************************/
Butterfly myButterfly;
Flower[] myFlower = new Flower[10];
Text[] text = new Text[11];
Text description;
ArrayList <Spread> spreads;
PImage[] img = new PImage[5];
PImage end = new PImage();
int alpha = 255;
int i1 = 0, i2 = 1;
float y = height;
String[] Mother = {
  "Mom's Love", 
  "Mom's smiles can brighten any moment,", 
  "Mom's hugs put joy in all our days,", 
  "Mom's love will stay with us forever.", 
  "and touch our lives in precious ways...", 
  "The values you've taught,", 
  "the care you've given,", 
  "and the wonderful love you've shown,", 
  "have enriched my life,", 
  "in more ways than I can count.", 
  "I Love you Mom!"
};
String Season = "Being alone for almost a year \n I have experienced all four seasons at Bryn Mawr \n I wanna share with you \n the seasonal sceneries of my great, beautiful campus";


void setup() {
  size(600, 500, P3D);
  background(255, 227, 245);
  smooth();
  frameRate(40);

  //create the arrayList spreads from class Spread
  spreads = new ArrayList <Spread>();
  //add spreads to the arrayList spreads
  spreads.add(new Spread(width/2, 0, width/20, width/20, int(random(30, 40))));

  //create myButterfly from class Butterfly
  myButterfly = new Butterfly(width/2, height/2, 0, -2, 19 * height/100);
  //array posX to store all the x values of myFlowers
  float[] posX = {
    3 * width/20, width/5, width/4, 3 * width/10, 7 * width/20, 13 * width/20, 
    7 * width/10, 3 * width/4, 4 * width/5, 17 * width/20
  };
  //array posY to store all the y values of myFlowers
  float[] posY = {
    3 * height/5, 13 * height/30, 17 * height/30, 13 * height/30, 3 * height/5, 
    3 * height/5, 13 * height/30, 17 * height/30, 13 * height/30, 3 * height/5
  };

  //create myFlower from class Flower and initialize the array myFlower
  for (int i = 0; i < myFlower.length; i++) {
    myFlower[i] = new Flower(posX[i], posY[i], width/15);
  }

  //create text from class Text and initialize the array text
  for (int i = 0; i < text.length; i++) {
    text[i] = new Text(Mother[i], width, 4 * height/5, width/30);
  }

  //create description from class Text
  y = height;
  description = new Text(Season, width/10, height, 3 * width/100);

  // Load images
  for (int i=0; i < img.length; i++) {
    img[i] = loadImage("bmc"+i+".png");
  }
  //load the end image
  end = loadImage("final.png");

  //P3D will not affect the rest of drawing
  hint(DISABLE_OPTIMIZED_STROKE);
}//end of setup()

void draw() {
  background(255, 227, 245);
  //outer condition
  if (frameCount < 7200) {
    for (int i = spreads.size () -1; i >= 0; i--) {
      Spread d = spreads.get(i);
      if (d.update()) spreads.remove(i);
    }
    //periodically add new spreads
    if (frameCount % 500 == 0) {
      spreads.add(new Spread(width/2, 0, width/20, width/20, int(random(30, 40))));
    }

    //display the butterfly
    myButterfly.move();
    myButterfly.display();

    //display the flowers
    for (Flower flowers : myFlower) {
      flowers.display();
    }

    //display the text "MOM"
    strokeWeight(5);
    stroke(245, 187, 79);
    noFill();
    //draw the text "M"
    beginShape();
    vertex(3 * width/20, 3 * height/5);
    vertex(width/5, 13 * height/30);
    vertex(width/4, 17 * height/30);
    vertex(3 * width/10, 13 * height/30);
    vertex(7 * width/20, 3 * height/5);
    vertex(13 * width/20, 3 * height/5);
    vertex(7 * width/10, 13 * height/30);
    vertex(3 * width/4, 17 * height/30);
    vertex(4 * width/5, 13 * height/30);
    vertex(17 * width/20, 3 * height/5);
    endShape();
    //draw the text "O"
    ellipse(width/2, height/2, width/6, height/5);

    //1st inner condition
    //display the poem for mother
    if (frameCount < 6600) {
      text[int(frameCount/600)].fromRight();
      text[int(frameCount/600)].display();
    } else {
      if (y > height/5) { //2nd inner condition
        pushMatrix();
        translate(0, y);
        rotateX(PI/10);
        description.fromBottom();
        description.display();
        y--;
        popMatrix();
      } else {
        pushMatrix();
        translate(0, y);
        rotateX(PI/10);
        description = new Text(Season, width/10, y, 18);
        description.display();
        popMatrix();
      }
    }
  } else if (frameCount < 9300) { //outer condition
    //display the images of Bryn Mawr College in different seasons
    imageMode(CENTER);
    tint(255, alpha);
    image(img[i1], width/2, height/2);
    tint(255, 255 - alpha);
    image(img[i2], width/2, height/2);
    // Swap images when fade complete
    alpha -= 1;
    if (alpha < 0) {
      i1 = (i1 + 1) % img.length;
      i2 = (i2 + 1) % img.length;
      alpha = 255;
    }
  } else { //outer condition
    imageMode(CENTER);
    image(end, width/2, height/2);
  }
  saveFrame("frame/####.png");
  if (frameCount > 9500) {
    noLoop();
    exit();
  }
}//end of draw()

