public class PowerUp {
 
  private float speed;
  private float direction;
  private float xpos;
  private float ypos;
  private int type;
 
  public PowerUp(int side, int speed) {
    this.speed = speed;
    this.type = (int)random(1,4.9);
    switch (side) {
    case 1:
      //Top
      this.direction = random(40, 140);
      this.xpos = 960;
      this.ypos = -100;
      break;
    case 2:
      //Right
      this.direction = random(130, 230);
      this.xpos = 2020;
      this.ypos = 540;
      break;
    case 3:
      //Left
      this.direction = random(310, 410);
      this.xpos = -100;
      this.ypos = 540;
      break;
    case 4:
      //Bottom
      this.direction = random(220, 320);
      this.xpos = 960;
      this.ypos = 1180;
      break;
    }
  }
 
  public PowerUp(float speed, float direction, float xpos, float ypos) {
    this.speed = speed;
    this.direction = direction;
    this.xpos = xpos;
    this.ypos = ypos;
  }
 
  public void movePowerUp() {
    ypos+=((int)speed)*sin(radians(direction));
    xpos+=((int)speed)*cos(radians(direction));
    pushMatrix();
    translate(xpos-71, ypos-71);
    rotate(radians(direction));
    switch (type) {
    case 1:
      //speed
      fill(#114AF0);
      break;
    case 2:
      //shield
      fill(#F7EC0A);
      break;
    case 3:
      //lazer
      fill(#CE3639);
      break;
    case 4:
      //teleport
      fill(#9416F0);
      break;
    }
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
  
  public boolean collisionPlayer(float playerX, float playerY) {
    if ((sq(xpos - (playerX)))+(sq(ypos - (playerY)))<10000) {
      powerUpSound.play();
      return true;
    }
    return false;
  }
  
  public int getType(){
    return type;
  }
  
}