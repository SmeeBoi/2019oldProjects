import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

// Trying out the kinect for the first time
// Shows all the different types of data you can get from it
// 1) RGB webcam video image
// 2) IR video image (infrared)
// 3) Depth image (grayscale)
// 4) depth values in mm 0-2048 put it in an array

Kinect kinect;

void setup() {
  size(640, 480);
  // biggest kinect image is 640 x 480
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.enableIR(true);
  // with the video image your can choose RGB (initVideo)
  // or the IR video (enableIR(true)) you can't do both with kinect v1
  //kinect.setTilt(-5);
  // change tilt of kinect
}

void draw() {
  background(0);
  PImage videoImg = kinect.getVideoImage();

  PImage depthImg = kinect.getDepthImage();
  //int[] depth = kinect.getRawDepth();
  // depth values in kinect1 values between 0-2048 millimeter measurements
  // I use it in kinectTest1_1

  image(videoImg, 0, 10);
  //image(depthImg, 0, 50);
  // as of 1/11/20 i don't know how to display both video and depth?
}
