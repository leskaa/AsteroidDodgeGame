public class PowerUpManager {
  
  private int powerUpSpeed = 1;
  private int speedDuration = -1;
  private int lazerDurationHorizontal = -1;
  private int lazerDurationVertical = -1;
  private int shieldDelay = -1;
  private ArrayList<PowerUp> powerUpList = new ArrayList<PowerUp>();
  public int[] storedPowerUps = new int[4];
  public void update(float frames) {
    if(frameCount%6000==0){
      powerUpSpeed++;
    }
    speedDuration--;
    shieldDelay--;
    lazerDurationHorizontal--;
    lazerDurationVertical--;
    if(lazerDurationHorizontal<3&&lazerDurationHorizontal>0){
      fill(#EA4C4C);
      rect(0,spaceship.getY()-74,1920,-2);
    }
    if(lazerDurationHorizontal>3&&lazerDurationHorizontal<7){
      fill(#AD7F7F);
      rect(0,spaceship.getY()-70,1920,-10);
    }
    if(lazerDurationHorizontal==7||lazerDurationHorizontal==3){
      fill(#EA4C4C);
      rect(0,spaceship.getY()-72,1920,-6);
    }
    if(lazerDurationHorizontal>7){
      fill(#EA4C4C);
      rect(0,spaceship.getY()-74,1920,-2);
    }
    if(lazerDurationVertical<3&&lazerDurationVertical>0){
      fill(#C240F2);
      rect(spaceship.getX()-74,0,-2,1080);
    }
    if(lazerDurationVertical>3&&lazerDurationVertical<7){
      fill(#A381AF);
      rect(spaceship.getX()-70,0,-10,1080);
    }
    if(lazerDurationVertical==7||lazerDurationVertical==3){
      fill(#C240F2);
      rect(spaceship.getX()-72,0,-6,1080);
    }
    if(lazerDurationVertical>7){
      fill(#C240F2);
      rect(spaceship.getX()-74,0,-2,1080);
    }
    if(speedDuration==0){
      spaceship.setMaxSpeed(8);
      spaceship.setTurnRate(4);
    }
    if(shieldDelay==0){
      barrierSound.play();
      ufo = loadImage("spaceship.png");
      spaceship.setShield(false);
    }
    for (PowerUp i : powerUpList) {
      i.movePowerUp();
      if(i.collisionPlayer(spaceship.getX(), spaceship.getY())==true){
        for(int x=0; x<storedPowerUps.length; x++){
          if(storedPowerUps[x]==0){
            storedPowerUps[x]=i.getType();
            break;
          }
        }
        powerUpList.remove(i);
        break;
      }
    }
  }
  
  public void usePowerUp(int[]powerUps){
    if(powerUpDelay==true){
      powerUpWaitTime++;
      if(powerUpWaitTime==60){
        powerUpWaitTime=0;
        powerUpDelay=false;
      }
    }
    if(isSpace==true&&powerUpDelay==false){
      powerUpDelay=true;
      int last=0;
      for(int slot = 0; slot<powerUps.length; slot++){
        if(powerUps[slot]>0){
          last=slot;
        }
      }
      if(powerUps[last]==1){
        speed();
      }
      if(powerUps[last]==2){
        shield();
      }
      if(powerUps[last]==3){
        lazerHorizontal();
      }
      if(powerUps[last]==4){
      lazerVertical();
      }
      powerUps[last]=0;
    }
  }
  
  public void spawnPowerUp() {
    if(frameCount%600==0){
      float x = random(1, 5);
      powerUpList.add( new PowerUp((int)x, powerUpSpeed));
    }
  }
  
  public int[] getStored(){
    return storedPowerUps;
  }
  
  public void restartGame() {
    powerUpList.clear();
    for(int i=0; i<storedPowerUps.length;i++){
      storedPowerUps[i]=0;
    }
    powerUpSpeed=1;
    speedDuration = 10;
    lazerDurationHorizontal = -1;
    lazerDurationVertical = -1;
    shieldDelay = -1;
  }
  
  public void speed(){
    swooshSound.play();
    spaceship.setMaxSpeed(14);
    spaceship.setTurnRate(5);
    speedDuration=400;
  }
  
  public void shield(){
    swooshSound.play();
    ufo = loadImage("spaceshipShield.png");
    spaceship.setShield(true);
  }
  
  public void lazerHorizontal(){
    lazerSound.play();
    lazerDurationHorizontal=10;
  }
  public void lazerVertical(){
    lazerSound.play();
    lazerDurationVertical=10;
  }
  
  public void setShieldDelay(int shieldDelay){
    this.shieldDelay=shieldDelay;
  }
  
  public int getLazerDurationHorizontal(){
    return lazerDurationHorizontal;
  }
  
  public int getLazerDurationVertical(){
    return lazerDurationVertical;
  }
  
}