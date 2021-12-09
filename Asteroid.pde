
//Asteroid
//------------
class asteroid extends floater {
  private float size, rotSpd;
  public asteroid() {
    float tempX = 9999;
    float tempY = 9999;
    float tempRot = 0;
    size = (float)(Math.random()*20+25);
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
    tempX = ship.get(0).getX();
    tempY = ship.get(0).getY();
    while (dist((float)ship.get(0).getX(), (float)ship.get(0).getY(), tempX, tempY)< 400) {
      tempX = (int)ship.get(0).getX() + (int)(Math.random()*1000-500);
      tempY = (int)ship.get(0).getY() + (int)(Math.random()*1000-500);
    }
    myCenterX = tempX;
    myCenterY = tempY;
    myXspeed = (Math.random()*4-2);
    myYspeed = (Math.random()*4-2);
    myPointDirection = (Math.random()*TWO_PI);
    rotSpd = (float)(Math.random()*4*PI-TWO_PI);
  }
  public asteroid(double x, double y, double xspd, double yspd, float siz, int cor, int col, double dir, float rot) {
    size = siz;
    corners = cor;
    xCorners = new int[corners];
    yCorners = new int[corners];
    /*
    for (int i = 0; i < corners; i++) {
     xCorners[i] = xcor[i];
     yCorners[i] = ycor[i];
     }
     */
    float tempRot = 0;
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
    myColor = color(col);
    myCenterX = x;
    myCenterY = y;
    myXspeed = xspd;
    myYspeed = yspd;
    myPointDirection = dir;
    rotSpd = rot;
  }
  public void move ()
  {         
    turn(rotSpd);
    super.move();
  }
  public void splits() {
    spaceJunk.add(new asteroid(myCenterX, myCenterY, 1.25*myYspeed, 1.25*myXspeed, size/2, corners, myColor, myPointDirection, rotSpd));
    spaceJunk.add(new asteroid(myCenterX, myCenterY, -1.25*myYspeed, -1.25*myXspeed, size/2, corners, myColor, myPointDirection, rotSpd));
  }
  public float getX() {
    return (float)myCenterX;
  }
  public float getY() {
    return (float)myCenterY;
  }
  public float getXspd() {
    return (float)myXspeed;
  }
  public float getYspd() {
    return (float)myYspeed;
  }
  public float getSize() {
    return size;
  }
  public void setX(double x) {
    myCenterX = x;
  }
  public void setY(double y) {
    myCenterY = y;
  }
  public void setXspd(double xs) {
    myXspeed = xs;
  }
  public void setYspd(double ys) {
    myYspeed = ys;
  }
  public void setSize(float s) {
    size = s;
  }

  public void troubleshoot() {
    fill(255, 0, 0);
    textAlign(LEFT, CENTER);
    text(myCenterX + "\n" + myCenterY, (float)(myCenterX), (float)(myCenterY));
  }
}
public void asteroidReplenish() {
  while (spaceJunk.size() <= 15) {
    spaceJunk.add(new asteroid());
  }
}
