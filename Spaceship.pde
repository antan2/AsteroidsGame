class spaceship extends floater {  
  public spaceship() {
    corners = 5;
    xCorners = new int[]{10, -6, 0, 0, -6};
    yCorners = new int[]{0, -8, -3, 3, 8}; 
    myColor = color(255, 255, 255);
    myCenterX = 0;
    myCenterY = 0;
    myXspeed = 0;
    myYspeed = 0;
  }
  public void move() {
    myXspeed *= 0.999;
    myYspeed *= 0.999;
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    camX -= myXspeed;
    camY -= myYspeed;
  }
  public void slows() {
    myXspeed *= 0.85;
    myYspeed *= 0.85;
  }
  public void hyperspace() {
    hyperchannel++;
    if (hyperchannel > 50) {
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random()*360;
      myCenterX += hypEndX;
      myCenterY += hypEndY;
      camX -= hypEndX;
      camY -= hypEndY;
      hyper = false;
    }
  }
  public void speedCap(int cap) {
    if (myXspeed >= cap) {
      myXspeed = cap;
    }
    if (myYspeed >= cap) {
      myYspeed = cap;
    }
    if (myXspeed <= -cap) {
      myXspeed = -cap;
    }
    if (myYspeed <= -cap) {
      myYspeed = -cap;
    }
  }
  public void show ()  //overriding show for accelerate effects  
  {             
    fill(myColor);   
    stroke(myColor);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float) myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    if (accel == true) {
      triangle(-3, 3, -3, -3, (float)(Math.sin(sinT)*8-8), 0);
    }

    if (hyper == true) {
      stroke(255, 255, 255, hyperchannel*10);
      fill(255, 255, 255, hyperchannel*10);
      ellipse(0, 0, 20, 20);
    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);

    if (hyper == true) {
      float tempX = (float)hypEndX;
      float tempY = (float)hypEndY;
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
      stroke(255, 255, 255, hyperchannel*10);
      fill(255, 255, 255, hyperchannel*10);
      ellipse(tempX, tempY, 20, 20);
    }
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
}

