import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

// Trying out the kinect 
// Using the depth values in the array to downsample video
// Shiffman tutorial 12.2 Depth Image
// (Only the basic downsample part)


Kinect kinect;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.enableIR(true);
  kinect.setTilt(10);
}

void draw() {
  PImage depthImg = kinect.getDepthImage();
  //int[] depth = kinect.getRawDepth();

  //PImage videoImg = kinect.getVideoImage();

  image(depthImg, 0, 0);
  //image(videoImg, 0, 0);

  int skip = 20;
  // look at every 20 pixels instead of each one

  // looking through each pixel in array
  for (int x = 0; x < depthImg.width; x+=skip) {
    for (int y = 0; y < depthImg.height; y+=skip) {
      int index = x + y * depthImg.width;
      float b = brightness(depthImg.pixels[index]);
      fill(b); 
      rect(x, y, skip, skip);
    }
  }
}
