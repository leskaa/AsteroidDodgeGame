public class Player{
  
  private float speed;
  private float direction;
  private float xpos;
  private float ypos;
  private float maxSpeed;
  private float turnRate;
  private boolean shield;
  
  public Player(float speed, float direction, float xpos, float ypos){
    this.speed = speed;
    this.direction = direction;
    this.xpos = xpos;
    this.ypos = ypos;
    this.maxSpeed=8;
    this.turnRate=4;
    this.shield=false;
  }
  
  public void move(){
    if(isUp){
    speed+=0.9;
    }
    if(speed>0){
    speed-=0.3;
    }
    if(speed>maxSpeed){
    speed-=0.65;
    }
    if(isLeft){
    direction-=turnRate;
    }
    if(isRight){
    direction+=turnRate;
    }
    ypos+=((int)speed)*sin(radians(direction));
    xpos+=((int)speed)*cos(radians(direction));
    pushMatrix();
    translate(xpos-75,ypos-75);
    rotate(radians(direction));
    image(ufo,-(150/2),-(150/2));
    popMatrix();
  }
  
  public void edgeCollision(float x, float y){
    if(x<150){
      xpos=151;
    }
    if(y<150){
      ypos=151;
    }
    if(x>1920){
      xpos=1919;
    }
    if(y>1080){
      ypos=1079;
    }
  }
  
  public float getX(){
    return xpos;
  }
  
  public float getY(){
    return ypos;
  }
  
  public void setSpeed(float speed){
    this.speed=speed;
  }
  
  public void setDirection(float direction){
    this.direction=direction;
  }
  
  public void setX(float xpos){
    this.xpos=xpos;
  }
  
  public void setY(float ypos){
    this.ypos=ypos;
  }
  
  public void setMaxSpeed(float maxSpeed){
    this.maxSpeed=maxSpeed;
  }
  
  public void setTurnRate(float turnRate){
    this.turnRate=turnRate;
  }
  
  public void setShield(boolean shield){
    this.shield=shield;
  }
  
  public boolean playerHasShield(){
    return shield;
  }
  
}