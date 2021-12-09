//Spaceship
//-------------
class spaceship extends floater {  
  private int invincible;
  public spaceship() {
    corners = 5;
    xCorners = new int[]{10, -6, 0, 0, -6};
    yCorners = new int[]{0, -8, -3, 3, 8}; 
    myColor = color(255, 255, 255);
    myCenterX = 0;
    myCenterY = 0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random()*360;
    invincible = 150;
  }
  public void move() {
    myXspeed *= 0.999;
    myYspeed *= 0.999;
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    camX -= myXspeed;
    camY -= myYspeed;
    if (invincible > 0) {
      invincible --;
    }
  }
  public void slows() {
    myXspeed *= 0.85;
    myYspeed *= 0.85;
  }
  public void hyperspace() {
    hyperchannel++;
    if (hyperchannel > 25) {
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random()*360;
      float tempX = 0;
      float tempY = 0;
      boolean hypCollision = true;
      while (hypCollision) {
        tempX = (float)(Math.random()*800-400);
        tempY = (float)(Math.random()*800-400);
        hypCollision = false;
        if (dist(0, 0, tempX, tempY) < 150) {
          hypCollision = true;
        }
        for (int i = 0; i < spaceJunk.size(); i++) {
          if (dist((float)(myCenterX + tempX), (float)(myCenterY + tempY), spaceJunk.get(i).getX(), spaceJunk.get(i).getY()) < (spaceJunk.get(i).getSize() + 10) + 50) {
            hypCollision = true;
          }
        }
      }
      myCenterX += tempX;
      myCenterY += tempY;
      camX -= tempX;
      camY -= tempY;
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
  public void crash() {
    if (invincible <= 0) {
      if (!crashed) {
        for (int i = 0; i < spaceJunk.size(); i++) {
          if (dist((float)(myCenterX), (float)(myCenterY), spaceJunk.get(i).getX(), spaceJunk.get(i).getY()) < (spaceJunk.get(i).getSize() + 10)) {
            crashedT = 0;
            crashed = true;
            lives--;
            if (lives <= 0) {
              gameOver = true;
            }
            myPointDirection = (float)(Math.random()*360);
          }
        }
      } else {
        camX += myCenterX;
        camY += myCenterY;
        myCenterX -= myCenterX;
        myCenterY -= myCenterY;
        myYspeed = 0;
        myXspeed = 0;
        hyper = false;
        brakes = false;
        accel = false;
        leftTurn = false;
        rightTurn = false;
        fill(200, 200, 200, 255-crashedT*2.5);
        translate(-1*(float)camX, -1*(float)camY);
        rect(0, 0, width, height);
        translate((float)camX, (float)camY);
        crashedT++;
        if (crashedT > 100) {
          crashed = false;
          invincible = 150;
        }
      }
    }
  }
  public void shoot() {
    bullet.add(new pellet(myCenterX, myCenterY, (float)(myXspeed + 5*Math.cos(myPointDirection*(Math.PI/180))), (float)(myYspeed + 5*Math.sin(myPointDirection*(Math.PI/180)))));
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

    if (invincible > 0) {
      strokeWeight(3);
      if (invincible < 50) {
        stroke(255, 255, 255, (float)(255*Math.cos(sinT)));
      } else {
        stroke(255, 255, 255);
      }
      noFill();
      ellipse(0, 0, 25, 25);
      strokeWeight(1);
    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
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
  public void troubleshoot() {
    fill(255, 0, 0);
    textAlign(LEFT, CENTER);
    text(myCenterX + "\n" + myCenterY, (float)(myCenterX), (float)(myCenterY));
  }
  public void distTroubleshoot() {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    for (int i = 0; i < spaceJunk.size(); i++) {
      line((float)myCenterX, (float)myCenterY, spaceJunk.get(i).getX(), spaceJunk.get(i).getY());
      textAlign(LEFT, CENTER);
      text(dist((float)myCenterX, (float)myCenterY, spaceJunk.get(i).getX(), spaceJunk.get(i).getY()), (float)(myCenterX + spaceJunk.get(i).getX())/2, (float)(myCenterY + spaceJunk.get(i).getY())/2);
    }
  }
}
