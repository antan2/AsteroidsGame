public star[] shines = new star[500];
public floater[] spaceJunk = new floater[250];
public int numAster = 0;
public double sinT = 0; 
public double camX = 500;
public double camY = 500;
public boolean accel = false;
public boolean leftTurn = false;
public boolean rightTurn = false;
public boolean brakes = false;
public boolean hyper = false;
public int hyperchannel = 0;
public float hypEndX = 0;
public float hypEndY = 0;


public void setup() {
  size(1000, 1000);
  for (int i = 0; i < shines.length; i++) {
    shines[i] = new star();
  }
  for (int i = 0; i < 31; i++) {
    spaceJunk[i] = new asteroid();
    numAster ++;
  }
  spaceJunk[0] = new spaceship();
}
public void draw() {
  background(0, 0, 0);
  translate((float) camX, (float) camY);
  for (int i = 0; i < shines.length; i++) {
    shines[i].show();
    shines[i].fade();
  }
  for (int i = 1; i < numAster; i++) {
    spaceJunk[i].move();
    spaceJunk[i].turn(3);
    spaceJunk[i].show();
  }
  spaceJunk[0].move();
  if (hyper) {
    ((spaceship) spaceJunk[0]).hyperspace();
  } else {
    if (leftTurn) {
      spaceJunk[0].turn(-5);
    }
    if (rightTurn) {
      spaceJunk[0].turn(5);
    }
    if (accel) {
      spaceJunk[0].accelerate(0.5);
    }
    if (brakes) {
      ((spaceship) spaceJunk[0]).slows();
    }
  }
  ((spaceship) spaceJunk[0]).speedCap(15);
  spaceJunk[0].show();

  translate((float)-camX, (float)camY);
  sinT++;
}
public void keyPressed() {
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
    if (Math.sqrt(Math.pow(((spaceship) spaceJunk[0]).getXspd(), 2) + Math.pow(((spaceship) spaceJunk[0]).getYspd(), 2)) < 3) {
      hyperchannel = 0;
      hypEndX = (int)(Math.random()*1000);
      hypEndY = (int)(Math.random()*1000);
      hyper = true;
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
}
