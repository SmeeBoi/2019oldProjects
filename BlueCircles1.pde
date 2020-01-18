// Sameer Desai
// OSC from Ableton to Processing
// Volume levels of 4 tracks in Ableton
// control the radius of 4 circles
import oscP5.*;
import netP5.*;

OscP5 oscP5;
float r1;
float r2;
float r3;
float r4;

void setup() {
  //size(400, 400);
  fullScreen();
  // Receiving messages on port 3000 (same device, so same IP Address)
  oscP5 = new OscP5(this, 3000);
}

void draw() {
  background(0);
  noStroke();
  fill(0, 100, 255);
  int space = 100;
  int initSize = 50;
  int bounceFactor = 100;
  circle(width/2, height/2 - space, initSize + r1*bounceFactor);

  fill(0, 200, 255);
  circle(width/2 - space, height/2, initSize + r2*bounceFactor);

  fill(0, 255, 255);
  circle(width/2 + space, height/2, initSize + r3*bounceFactor);

  fill(255, 255, 255);
  circle(width/2, height/2 + space, initSize + r4*bounceFactor);
}

void oscEvent(OscMessage theOscMessage) {
  //print("### received an osc message.");
  //print(" addrpattern: " + theOscMessage.addrPattern());
  //println(" typetag: "+ theOscMessage.typetag());

  println("incoming data: " + theOscMessage.get(0).floatValue());
  if (theOscMessage.addrPattern().equals("/drums")) {
    r1 = theOscMessage.get(0).floatValue();
  }
  if (theOscMessage.addrPattern().equals("/keys")) {
    r2 = theOscMessage.get(0).floatValue();
  }
  if (theOscMessage.addrPattern().equals("/bass")) {
    r3 = theOscMessage.get(0).floatValue();
  }
  if (theOscMessage.addrPattern().equals("/bell")) {
    r4 = theOscMessage.get(0).floatValue();
  }
}
