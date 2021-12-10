//Asteroid General
//-----------------------
public star[] shines = new star[500];
public ArrayList <spaceship> ship = new ArrayList <spaceship>();
public ArrayList <asteroid> spaceJunk = new ArrayList <asteroid>();
public ArrayList <pellet> bullet = new ArrayList <pellet>();
public double sinT = 0;
public double camX = 500;
public double camY = 500;
public boolean accel = false;
public boolean leftTurn = false;
public boolean rightTurn = false;
public boolean brakes = false;
public boolean hyper = false;
public boolean shoots = false;
public int hyperchannel = 0;
public boolean crashed = false;
public int crashedT = 0;
public boolean collided = false;
public int lives = 4;
public int score = 0;
public boolean gameOver = false;


public void setup() {
  size(1000, 1000);
  for (int i = 0; i < shines.length; i++) {
    shines[i] = new star();
  }
  ship.add(new spaceship());
}
public void draw() {
  background(0, 0, 0);
  float tempCamX = (float)camX;
  float tempCamY = (float)camY;
  translate((float) tempCamX, (float) tempCamY);
  for (int i = 0; i < shines.length; i++) {
    shines[i].show();
    shines[i].fade();
  }
  for (int i = 0; i < spaceJunk.size(); i++) {
    spaceJunk.get(i).move();
    spaceJunk.get(i).show();
    //spaceJunk.get(i).troubleshoot();
  }
  ship.get(0).move();
  if (hyper) {
    ship.get(0).hyperspace();
  } else if (!crashed) {
    if (leftTurn) {
      ship.get(0).turn(-5);
    }
    if (rightTurn) {
      ship.get(0).turn(5);
    }
    if (accel) {
      ship.get(0).accelerate(0.5);
    }
    if (brakes) {
      ship.get(0).slows();
    }
  }
  ship.get(0).speedCap(15);
  ship.get(0).show();
  //ship.get(0).troubleshoot();
  //ship.get(0).distTroubleshoot();
  ship.get(0).crash();

  for (int i = bullet.size()-1; i >= 0; i--) {
    bullet.get(i).lifeDecay();
    if (bullet.get(i).getLife() <= 0) {
      bullet.remove(i);
    }
  }
  for (int i = bullet.size()-1; i >= 0; i--) {
    collided = false;
    bulletCollide(i);
    if (collided) {
      bullet.remove(i);
    }
  }
  for (int i = 0; i < bullet.size(); i++) {
    bullet.get(i).move();
    bullet.get(i).show();
  }

  translate(-1*(float)tempCamX, -1*(float)tempCamY);
  sinT++;
  display();
  asteroidReplenish();
}
public void keyPressed() {
  if (!crashed) {
    if (keyCode == 38) { //up key
      accel = true;
    }
    if (keyCode == 37) { //left key
      leftTurn = true;
    }
    if (keyCode == 39) { //right key
      rightTurn = true;
    }
    if (keyCode == 40) { //down key
      brakes = true;
    }
    if (keyCode == 81 && hyper == false) { //Q
      if (Math.sqrt(Math.pow(ship.get(0).getXspd(), 2) + Math.pow(ship.get(0).getYspd(), 2)) < 1) {
        hyperchannel = 0;
        hyper = true;
      } else {
        brakes = true;
      }
    }
  }
}
public void keyReleased() {
  if (keyCode == 38) { //up key
    accel = false;
  }
  if (keyCode == 37) { //left key
    leftTurn = false;
  }
  if (keyCode == 39) { //right key
    rightTurn = false;
  }
  if (keyCode == 40) { //down key
    brakes = false;
  }
  if (keyCode == 32) { //space key
    ship.get(0).shoot();
  }
  if (keyCode == 81) { //Q
    brakes = false;
  }
  if (gameOver) {
    gameOver = false;
    reset();
  }
}
public void display() {
  for (int i = 1; i < lives; i++) {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    beginShape();
    vertex((25*i+5)- 10, 20);
    vertex((25*i+5), 30);
    vertex((25*i+5)+ 10, 20);
    vertex((25*i+5)+ 5, 15);
    vertex((25*i+5), 20);
    vertex((25*i+5)- 5, 15);
    endShape();
  }
  /*
  fontText("score " + score, width-10, 20, 10, 15, color(255, 255, 255), "RIGHT", "digital");
  strokeWeight(1);
  */
  textSize(20);
  textAlign(RIGHT);
  text("Score: " + score, width-10, 20);
  if (gameOver) {
    fill(0, 0, 0, 50);
    noStroke();
    rect(0, 0, width, height);
    /*
    fontText("game over", width/2, height/2-height/10, 30, 45, color(255, 255, 255), "CENTER", "digital");
     fontText("final score " + score, width/2, height/2, 20, 30, color(255, 255, 255), "CENTER", "digital");
     fontText("press any key to try again", width/2, height/2+height/10, 20, 30, color(255, 255, 255), "CENTER", "digital");
     strokeWeight(1);
     */
    fill(255, 255, 255);
    textSize(60);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2-height/10);
    textSize(40);
    text("Final Score: "+ score, width/2, height/2);
    text("Press any key to try again", width/2, height/2+height/10);
    noLoop();
  }
}
public void reset() {
  loop();
  camX = 500;
  camY = 500;
  accel = false;
  leftTurn = false;
  rightTurn = false;
  brakes = false;
  hyper = false;
  shoots = false;
  hyperchannel = 0;
  crashed = false;
  crashedT = 0;
  collided = false;
  lives = 4;
  score = 0;
  gameOver = false;
  while (spaceJunk.size() > 0) {
    spaceJunk.remove(0);
  }
  ship.get(0).setX(0);
  ship.get(0).setY(0);
  ship.get(0).setXspd(0);
  ship.get(0).setYspd(0);
}
