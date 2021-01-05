PImage diamond, gold, netherrack, ancientDebrisTop, ancientDebrisSide;

float rotx, roty;


void setup() {
  size(800, 800, P3D);
  diamond = loadImage("diamond.png");
  gold = loadImage("gold.png");
  ancientDebrisTop = loadImage("ancientDebrisTop.png");
  ancientDebrisSide = loadImage("anicentDebrisSide.png");
  netherrack = loadImage("netherrack.png");
  textureMode(NORMAL);
}

void draw() {
  background(255);

  int i = 0;
  while (i++ < 8) {
    //texturedCube(i*100, 200, 0, netherrack, netherrack, netherrack, netherrack, netherrack, netherrack, 100);
    texturedCube(i*100, 300, 0, netherrack, netherrack, netherrack, netherrack, netherrack, netherrack, 100);
    //texturedCube(i*100, 400, 0, netherrack, netherrack, netherrack, netherrack, netherrack, netherrack, 100);
  }
  texturedCube(300, 300, 0, ancientDebrisTop, ancientDebrisTop, ancientDebrisSide, ancientDebrisSide, ancientDebrisSide, ancientDebrisSide, 100);
  texturedCube(100, 100, 0, ancientDebrisTop, ancientDebrisTop, ancientDebrisSide, ancientDebrisSide, ancientDebrisSide, ancientDebrisSide, 100);
  texturedCube(600, 0, 0, diamond, diamond, diamond, diamond, diamond, diamond, 100);
  texturedCube(100, 300, 0, gold, gold, gold, gold, gold, gold, 100);
}

void texturedCube(float x, float y, float z, PImage top, PImage bottom, PImage left, PImage right, PImage front, PImage back, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  noStroke();

  beginShape(QUADS);
  texture(top);

  //top
  //     x,y,z,tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();

  //bottom
  beginShape(QUADS);
  texture(bottom);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(front);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();


  beginShape(QUADS);
  texture(back);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(left);
  //left
  vertex(1, 0, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 0, 1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(right);
  //right
  vertex(0, 0, 0, 0, 0);
  vertex(0, 1, 0, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();
  popMatrix();
}

void mouseDragged() {
  rotx+= (pmouseY - mouseY)*0.005;
  roty+= (pmouseX - mouseX)*-0.005;
}
