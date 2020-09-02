PImage photo;
PShape shape;
PShape photoTransform;
PShader shader;

void setup(){
  
  size(825, 360, P2D);
   background(0,0,10);
  photo = loadImage("luffy.png");
  shape = createShape(RECT, 10, 10, photo.width, photo.height);
  photoTransform = createShape(RECT, photo.width+15, 10, photo.width, photo.height);
  shape.setTexture(photo);
  photoTransform.setTexture(photo);
  shader = loadShader("rfc.glsl");
  
}

void draw(){
  resetShader();
  shape(shape);
  shader(shader);
  shape(photoTransform);
  
}
