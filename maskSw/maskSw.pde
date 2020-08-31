

PGraphics pg;
PImage photo;
PImage convolution;
int xend = 300;
int yend = 300;
int sizeM = 3;
PFont f; 

float val = 1.0/50;

// definimos los kernel para las diferentes operaciones
float[][] edgeDetect = { { -1, -1, -1 },
                     { -1,  8, -1 },
                     { -1, -1, -1 } };
                     

float[][] boxBlur = { { 0.111, 0.111, 0.111 },
                     {0.111, 0.111, 0.111  },
                     { 0.111, 0.111, 0.111 } };

float[][] sharpen = { { 0, -1, 0 },
                     { -1,  5, -1 },
                     { 0, -1, 0 } };
                     
float[][] gaussianBlurKernel = { { val, 2*val, val },
                                  { 2*val ,4*val ,2*val },
                                {val, 2*val, val } };

                     

void setup() {
  size(630, 350);
  f = createFont("ITCFranklinGothicStd-Book.otf",15);
  pg = createGraphics(295, 295);
  photo = loadImage("luffy.png");
  convolution = loadImage("luffy.png");
}

void draw() {
  background(0,0,10);
  textFont(f,18);                  

  pg.beginDraw();
  pg.image(photo,0,0);
  pg.endDraw();
  image(pg, 10, 10);
  pg.beginDraw();
  photo.loadPixels();      
  convolution.updatePixels(); 
  pg.image(convolution,0,0);
  pg.endDraw();
  image(pg, 320, 10);
  
 
  
}

color convolution(int x, int y, float[][] m, int sizeM, PImage photo)
{
  float r = 0.0;
  float g = 0.0;
  float b = 0.0;
  int offset = sizeM / 2;
  for (int i = 0; i < sizeM; i++){
    for (int j= 0; j < sizeM; j++){
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + photo.width*yloc;
    
      loc = constrain(loc,0,photo.pixels.length-1);
      // Calculate the convolution
      r += (red(photo.pixels[loc]) * m[i][j]);
      g += (green(photo.pixels[loc]) * m[i][j]);
      b += (blue(photo.pixels[loc]) * m[i][j]);
    }
  }
  // Make sure RGB is within range
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);
  // Return the resulting color
  return color(r, g, b);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      
        for (int x = 0; x < xend; x++) {
          for (int y = 0; y < yend; y++ ) {
            color c = convolution(x, y, edgeDetect, sizeM, photo);
            int loc = x + y*photo.width;
            convolution.pixels[loc] = c;
          }
        }
        fill(255);
        text("Edge detect",415,330);        

      
    } 
    if (keyCode == DOWN) {
       for (int x = 0; x < xend; x++) {
          for (int y = 0; y < yend; y++ ) {
            color c = convolution(x, y, sharpen, sizeM, photo);
            int loc = x + y*photo.width;
            convolution.pixels[loc] = c;
            
          }
        }
         fill(250); 
         text("sharpen",415,330);          
      
    }
     if (keyCode == LEFT) {
       for (int x = 0; x < xend; x++) {
          for (int y = 0; y < yend; y++ ) {
            color c = convolution(x, y, boxBlur, sizeM, photo);
            int loc = x + y*photo.width;
            convolution.pixels[loc] = c;
            
          }
        }
         fill(250); 
         text("boxBlur",415,330);          
      
    }
    
       if (keyCode == RIGHT) {
       for (int x = 0; x < xend; x++) {
          for (int y = 0; y < yend; y++ ) {
            color c = convolution(x, y, gaussianBlurKernel, sizeM, photo);
            int loc = x + y*photo.width;
            convolution.pixels[loc] = c;
            
          }
        }
         fill(250); 
         text("gaussianBlurKernel",415,330);          
      
    }
    
    
  }
}
