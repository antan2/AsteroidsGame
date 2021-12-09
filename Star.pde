//Stars
//-------------
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
