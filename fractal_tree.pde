float angle, h;
int maxLength;
boolean autoRotate = false;
void setup() {
  background(255);
  //size(800, 800);
  fullScreen();
  angle = PI/4;
  h =  height/32 ;
  maxLength = 10;
}

void draw() {
  background(255);
  translate(width /2, height);
  pushMatrix();
  ramifica(h, 10);
  popMatrix();
  
  if (autoRotate)
    angle += 0.01;
}

void ramifica(float length, float weigth) {
  strokeWeight(weigth);
  stroke(200-length*10, 0, 0);
  line (0, 0, 0, -length);
  translate(0, - length);
  if (length >= maxLength) {
    pushMatrix();
    rotate(angle);
    ramifica(length * 0.67, weigth * 0.67);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    ramifica(length * 0.67, weigth* 0.67);
    popMatrix();
  }
}
void mouseDragged() {
  h = height - mouseY;
  angle = mouseX*0.01;
}

void mousePressed() {
  h = height - mouseY;
  angle = mouseX*0.01;
}
void keyPressed() {
  if (keyCode==UP) {
    h+=10;
  } else if (keyCode==DOWN) {
    h-=10;
  } else if (keyCode == LEFT) {
    angle -= 0.05;
  } else if (keyCode==RIGHT) {
    angle += 0.05;
  } else if (key == 'r') {
    autoRotate = ! autoRotate;
  } else if (key == ' ') {
    setup();
  }
}