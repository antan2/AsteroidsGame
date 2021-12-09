
//Pellet
//-----------
class pellet extends floater {
  private int life;
  pellet(double x, double y, float xspd, float yspd) {
    myCenterX = x;
    myCenterY = y;
    myXspeed = xspd;
    myYspeed = yspd;
    life = 100;
  }
  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }
  public void show() {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    translate((float)myCenterX, (float)myCenterY);
    ellipse(0, 0, 5, 5);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void lifeDecay() {
    life--;
  }
  public int getLife() {
    return life;
  }
  public float getX() {
    return (float)myCenterX;
  }
  public float getY() {
    return (float)myCenterY;
  }
}
public void bulletCollide(int n) {
  for (int j = 0; j < spaceJunk.size(); j++) {
    if (dist(bullet.get(n).getX(), bullet.get(n).getY(), spaceJunk.get(j).getX(), spaceJunk.get(j).getY()) <= spaceJunk.get(j).getSize() + 5) {
      collided = true;
      score += 10;
      if (score%1000 == 0) {
        lives++;
      }
      if (spaceJunk.get(j).getSize() >= 25) { 
        spaceJunk.get(j).splits();
      }
      spaceJunk.remove(j);
      j--;
    }
  }
}
