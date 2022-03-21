// Martín van Puffelen López
// Interaction design with optical flow based on Bryan WC Chung´s work with virtual hotspots and Two-Frame Motion Estimation Based on Polynomial Expansion
import cvimage.*;
import org.opencv.core.*;
import processing.video.*;
import org.opencv.video.*;
import org.opencv.video.Video;
import java.awt.Rectangle;
import processing.sound.*;

// Camera capture size
final int CAPW = 900;
final int CAPH = 480;

int triggerCount=0;
int previousTime;
SoundFile startEpic;

int mode;
final int MODE_VIEW_FLOW=0;
final int MODE_VIEW_AURORA=1;
final int MODE_VIEW_BEAST=2;
final int MODE_VIEW_SKULL=3;
final int MODE_VIEW_CIRCLES=4;
PImage aurora, beast, circles, skull;

Capture cap;
CVImage img;
float scaling;
int w, h;
Mat last;
Region [] regions;
// Flag to indicate if it is the first frame.
boolean first;
// Offset to the right hand side display.
PVector offset;

void setup() {
  size(1800, 480);
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  cap = new Capture(this, CAPW, CAPH);
  startEpic=new SoundFile(this,"epicStart.wav");
  aurora=loadImage("wallpaper_aurora.jpg");
  beast=loadImage("wallpaper_Beast.jpg");
  circles=loadImage("wallpaper_circles.jpg");
  skull=loadImage("wallpaper_skull.jpg");  
  cap.start();
  scaling = 20;
  w = floor(CAPW/scaling);
  h = floor(CAPH/scaling);
  img = new CVImage(w, h);
  last = new Mat(h, w, CvType.CV_8UC1);
  Rectangle screen = new Rectangle(0, 0, cap.width, cap.height);
  // Define 2 hotspots.
  regions = new Region[2];
  regions[0] = new Region(this, new Rectangle(50, 200, 100, 100), 
    screen, scaling, 1); // Left Region
  regions[1] = new Region(this, new Rectangle(750, 200, 100, 100), 
    screen, scaling, 2); // Right Region
  first = true;
  offset = new PVector(cap.width, 0);
  mode=MODE_VIEW_FLOW;
}

void draw() {
  if (!cap.available()) 
    return;
  background(0);
  cap.read();
  img.copy(cap, 0, 0, cap.width, cap.height, 
    0, 0, img.width, img.height);
  img.copyTo();
    Mat grey = img.getGrey();
    if (first) {
      grey.copyTo(last);
      first = false;
      return;
    }
    Mat flow = new Mat(last.size(), CvType.CV_32FC2);
    Video.calcOpticalFlowFarneback(last, grey, flow, 
      0.5, 3, 10, 2, 7, 1.5, Video.OPTFLOW_FARNEBACK_GAUSSIAN);
    grey.copyTo(last);
    image(cap, 0, 0);
    if(mode==MODE_VIEW_FLOW){
      textSize(17);
      text("Siguiente fondo",width-160,height/3+15);
      text("Anterior fondo",width/2+50,height/3+15);
      textSize(20);
      text("¡Toca un recuadro y luego el otro para entrar en la galería!",width/2+225,height/1.25);
      textSize(35);     
      text("Wallpaper CVisualizer",width/2+350,height/4);
    }
      drawFlow(flow);
    // Update the hotspots with the flow matrix.
    // Draw the hotspot rectangle.
    // Draw also the flow on the right hand side display.
    for (Region rg : regions) {
      rg.update(flow);
      if(mode==MODE_VIEW_CIRCLES && rg.getId()==2 || mode==MODE_VIEW_AURORA && rg.getId()==1) rg.drawBox(false);
      else rg.drawBox(true);
      rg.drawFlow(flow, offset);
    }
    grey.release();
    flow.release();
  switch(mode){
    case MODE_VIEW_AURORA:
      image(aurora, CAPW, 0);
      break;  
    case MODE_VIEW_BEAST:
      image(beast, CAPW, 0);
      break;  
    case MODE_VIEW_SKULL:
      image(skull, CAPW, 0);
      break;  
    case MODE_VIEW_CIRCLES:
      image(circles, CAPW, 0);
      break;  
}
    textSize(20);
    text(nf(round(frameRate), 2), 10, 20);
    if(mode!=MODE_VIEW_FLOW){
      textSize(30);
      text(str(mode)+"/4",width/2+10,height-20);
    }
}

void drawFlow(Mat f) {
  // Draw the flow data.
  pushStyle();
  noFill();
  stroke(255);
  for (int y=0; y<f.rows(); y++) {
    int py = (int)constrain(y*scaling, 0, cap.height-1);
    for (int x=0; x<f.cols(); x++) {
      double [] pt = f.get(y, x);
      float dx = (float)pt[0];
      float dy = (float)pt[1];
      // Skip areas with no flow.
      if (dx == 0 && dy == 0) 
        continue;
      int px = (int)constrain(x*scaling, 0, cap.width-1);
      dx *= scaling;
      dy *= scaling;
      line(px, py, px+dx, py+dy);
    }
  }
  popStyle();
}

void regionTriggered(Region r) {
  // Callback function from the Region class.
  // It displays the flow magnitude number on 
  // top of the hotspot rectangle.
  triggerCount++;
  if(mode==MODE_VIEW_FLOW){
      if(triggerCount==1) previousTime=r.getId();
      int mag = round(r.getFlowMag());
      r.writeMsg(offset, nf(mag, 3));
      if(r.getId()==1&&previousTime==2 || r.getId()==2 && previousTime==1 ){
        startEpic.play();
        triggerCount=0;
        mode=MODE_VIEW_AURORA;
      }
  }else{
    fill(255);
    triggerCount++;
    if(triggerCount>2 && mode>1 && r.getId()==1){
      mode--;
      triggerCount=0;
    }
    if(triggerCount>2 && mode<4 && r.getId()==2){
      mode++;
      triggerCount=0;
  
    }
  }
  //println(r.getId());
}

void mousePressed() {
  saveFrame("data/flow####.jpg");
}
