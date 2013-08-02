import processing.serial.*;
import processing.opengl.*;
import java.lang.reflect.Method;
import hypermedia.net.*;
import java.io.*;
import codeanticode.gsvideo.*;

SetList setList;

// Step 1. Create set list variable
TutorialNoisePlayer tutorialNoise;
TutMovingLinesSet tutMovingLines;
TechDemo techDemo;
Demo demo;
DebuggingSetList debuggingSetList;

void setup() {
  size(602, 420, P2D);
  frameRate(FRAMERATE);
  setupPyramid();

  // Step 2. Instantiate set list.
  tutorialNoise = new TutorialNoisePlayer();
  tutMovingLines = new TutMovingLinesSet();
  techDemo = new TechDemo();
  demo = new Demo();
  debuggingSetList = new DebuggingSetList();

  // Step 3. Set active player to set list
  setList = tutMovingLines;
}

void draw() {
  background(64);
  setList.update();
  image(canvasOut.pg, 0, 0, canvasOut.w, canvasOut.h);
  sign.sendData();
  drawWindowBorders();
}
