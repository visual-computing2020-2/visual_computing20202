
PImage photo;
PImage photoTransform;
PImage photoAscii;
int resolution = 6;
char[] ascii;
PFont font;

void setup(){
  
 size(1200, 710);
 photo = loadImage("luffy.png");
 photoTransform = loadImage("luffy.png");
 

 
 ascii = new char[256];
 String letters = "0MNBKAE5#tr<+-. ";
 
 for (int i = 0; i < 256; i++) {
   int index = int(map(i, 0, 256, 0, letters.length()));
   ascii[i] = letters.charAt(index);
  }
  
}

void draw(){
  
  color newColor;
  int pixelLoc;
  image(photo,420,5);
  loadPixels();
  photo.loadPixels();
  
  
  
  // escala de grises Promedio RGB
  for (int x = 0; x < photo.width; x++ ){
    for(int y = 0; y < photo.height; y++){
       pixelLoc = x + y*photo.width;
       float dataColor = (red(photo.pixels[pixelLoc]) + green(photo.pixels[pixelLoc]) + blue(photo.pixels[pixelLoc]))/3;
       newColor = color(dataColor, dataColor, dataColor);
       photoTransform.pixels[pixelLoc] = newColor;      
    }        
  }
  photoTransform.updatePixels();
  image(photoTransform,5,345);
  text("Promedio RGB", 170,690);
  
  // Escala de grises Formula LUMA
  
    for (int x = 0; x < photo.width; x++ ){
    for(int y = 0; y < photo.height; y++){
       pixelLoc = x + y*photo.width;
       float dataColor = red(photo.pixels[pixelLoc])*0.2126 + green(photo.pixels[pixelLoc])*0.7152 + blue(photo.pixels[pixelLoc])*0.0722;
       newColor = color(dataColor, dataColor, dataColor);
       photoTransform.pixels[pixelLoc] = newColor;      
    }        
  }
  photoTransform.updatePixels();
  image(photoTransform,420,345);
   text("lUMA", 600,690);
  
  
  
  
  //ascii
  for (int y = 0; y < photoTransform.height; y += resolution) {
    for (int x = 0; x < photoTransform.width; x += resolution) {
      color pixel = photoTransform.pixels[y * photoTransform.width + x];
      text(ascii[int(brightness(pixel))], 830+x, 355+y);
      fill(50, 50, 50);
    }
  }
   text("ASCII", 1000,700);
  
    
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (resolution < 25) resolution = resolution + 5;
    } 
    if (keyCode == DOWN) {
      if (resolution > 1) resolution = resolution - 5;
    }
  }
}
