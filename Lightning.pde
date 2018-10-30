/*
Lightning Colour Dissolver
Created by: Blythe O'Connor
October 29, 2018
For: Grade 12 Computer Science Course
Purpose: To create a cool lightning pattern using the random walk concept.
Description: Various colours of lightening fall down the screen while a box 
             grows from bottom up until it covers the screen, then repeats.
*/

int startX = 275;
int startY = 0;
int endX = 275;
int endY = 0;
int w = 1;
int R = (int)(Math.random() * 53) + 205;      //red colour variable
int G = (int)(Math.random() * 53) + 205;      //green colour variable
int B = (int)(Math.random() * 53) + 205;      //blue colour variable


void setup() {
  size(700,400);
  background(255);
  frameRate(100);
}

void draw() {
  lightning();                         //draws continuous lightning
  growingLine();                       //draws growing line
  if (w >= height * 2) {               //resets the program when the line covers the whole screen
      reset();
 }
}

                                       //draws lightning using random walk
void lightning() {
  if (endY < 400) {
    strokeWeight(3.5);
    stroke(R,G,B);
    endX = startX + (int)(Math.random() * 27) - 13;
    endY = startY + (int)(Math.random() * 30);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
    w = w + 1;
  } else if (endY >= 400) {             //when the lightning reaches the bottom, draw another 
      repeat();                                          
  }
}

                                       //draws growing line from the bottom up
void growingLine() {
    stroke(R,G,B);
    strokeWeight(w);
    line(0, 400, 700, 400);
}

                                      //repeats the lightning streak drawing process
void repeat() {
  R = (int)(Math.random() * 120) + 205;
  G = (int)(Math.random() * 120) + 205;
  B = (int)(Math.random() * 120) + 205;
  startX = (int)(Math.random() * 701);
  startY = 0;
  endX = 275;
  endY = 0;
}

                                     //resets the program if the line covers the whole screen
void reset() {
  startX = 275;
  startY = 0;
  endX = 275;
  endY = 0;
  w = 1;
  background(255);
}
