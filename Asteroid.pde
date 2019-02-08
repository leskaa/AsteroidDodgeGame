public class Asteroid {
 
  private float speed;
  private float direction;
  private float xpos;
  private float ypos;
 
  public Asteroid(int side, int minSpeed, int maxSpeed) {
    this.speed = random(minSpeed, maxSpeed);
    switch (side) {
    case 1:
      //Top
      this.direction = random(20, 160);
      this.xpos = random(5, 1915);
      this.ypos = -100;
      break;
    case 2:
      //Right
      this.direction = random(110, 250);
      this.xpos = 2020;
      this.ypos = random(5, 1075);
      break;
    case 3:
      //Left
      this.direction = random(290, 430);
      this.xpos = -100;
      this.ypos = random(5, 1075);
      break;
    case 4:
      //Bottom
      this.direction = random(200, 340);
      this.xpos = random(5, 1915);
      this.ypos = 1180;
      break;
    }
  }
 
  public Asteroid(float speed, float direction, float xpos, float ypos) {
    this.speed = speed;
    this.direction = direction;
    this.xpos = xpos;
    this.ypos = ypos;
  }
 
  public void moveAsteroid() {
    ypos+=((int)speed)*sin(radians(direction));
    xpos+=((int)speed)*cos(radians(direction));
    pushMatrix();
    translate(xpos-71, ypos-71);
    rotate(radians(direction));
    image(asteroid, -(100/2), -(100/2));
    popMatrix();
  }
 
  public boolean collisionPlayer(float playerX, float playerY) {
    if ((sq(xpos - (playerX)))+(sq(ypos - (playerY)))<15129) {
      if (spaceship.playerHasShield()==false) {
        explosionSound.play();
        menu.setGame(false);
        highScoreTable = loadJSONArray("data/highscores.json");
        JSONObject highScore = new JSONObject();
        highScore.setInt("time", statusBar.getSeconds());
        highScoreTable.append(highScore);
        JSONObject temp = new JSONObject();
        boolean sorted = false;
        do {
          sorted=false;
          for (int j=1; j < (highScoreTable.size()); j++) {
            if (highScoreTable.getJSONObject(j-1).getInt("time") > highScoreTable.getJSONObject(j).getInt("time")) {
              //swap elements
              temp = highScoreTable.getJSONObject(j-1);
              highScoreTable.setJSONObject(j-1, highScoreTable.getJSONObject(j));
              highScoreTable.setJSONObject(j, temp);
              sorted = true;
            }
          }
        } while (sorted);
        saveJSONArray(highScoreTable, "data/highscores.json");
        menu.createLoss();
        return true;
      }
      powerUpManager.setShieldDelay(5);
      return false;
    }
    return false;
  }
  
  public boolean lazerCollisionHorizontal(float playerX, float playerY){
    if(powerUpManager.getLazerDurationHorizontal()>1){
    return(ypos-50<(playerY)&&ypos+50>(playerY));
    }
    return false;
  }
    public boolean lazerCollisionVertical(float playerX, float playerY){
    if(powerUpManager.getLazerDurationVertical()>1){
    return(xpos-50<(playerX)&&xpos+50>(playerX));
    }
    return false;
  }
}