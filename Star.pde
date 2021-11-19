class star //note that this class does NOT extend Floater
{
  private float sx, sy, ssiz, st;
  public star() {
    sx = (float)(Math.random()*width);
    sy = (float)(Math.random()*height);
    ssiz = (float)(Math.random()*5+3);
    st = (float)(Math.random()*TWO_PI*10);
  }
  public void show() {
    float tempX = sx;
    float tempY = sy;
    while (tempX + camX> width) {
      tempX -= width;
    }
    while (tempY + camY> height) {
      tempY -= height;
    }
    while (tempX + camX< 0) {
      tempX += width;
    }
    while (tempY + camY< 0) {
      tempY += height;
    }
    noStroke();
    fill(255, 255, 255, (float)(50*Math.sin(st/10.0))+50);
    ellipse(tempX, tempY, ssiz, ssiz);
  }
  public void fade() {
    st+= 0.5;
  }
}

//Asteroid
//------------
class asteroid extends floater {
  private float size;
  public asteroid() {
    float tempX = 9999;
    float tempY = 9999;
    float tempRot = 0;
    size = (float)(Math.random()*15+10);
    corners = (int)(Math.random()*8+8);
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++) {
      tempRot  = i*TWO_PI/corners;
      tempRot += Math.random()*TWO_PI/corners;
      if (i % 3 == 0) {
        xCorners[i] = (int)(0.8*size*Math.cos(tempRot));
        yCorners[i] = (int)(0.8*size*Math.sin(tempRot));
      } else {
        xCorners[i] = (int)(size*Math.cos(tempRot));
        yCorners[i] = (int)(size*Math.sin(tempRot));
      }
    }
    myColor = color(255, 255, 255);
    tempX = 0;
    tempY = 0;
    while (dist(0, 0, tempX, tempY)<300) {
      tempX = (int)(Math.random()*1000-500);
      tempY = (int)(Math.random()*1000-500);
    }
    myCenterX = tempX;
    myCenterY = tempY;
    myXspeed = (Math.random()*4-2);
    myYspeed = (Math.random()*4-2);
  }
}

