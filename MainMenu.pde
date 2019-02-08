public class MainMenu {
 
  private boolean gameInProgress = false;
 
  public MainMenu(boolean gameInProgress) {
    this.gameInProgress = gameInProgress;
  }
 
  public void createMain() {
    menuMusic.play();
    textSize(50);
    fill(0, 255, 80);
    text("Asteroid Dodge Game ", 690, 210); 
    fill(0, 255, 80);
    rect(630, 700, 650, 180);
    fill(255); 
    rect(680, 720, 550, 140);
    fill(0); 
    text("Press \"space\" to play", 705, 805);
    fill(255);
    textSize(30); 
    text("Arrow keys: Movement", 100, 200); 
    text("Space: Use Powerup", 100, 250);
    text("Enter: Pause", 100, 300);
    textSize(40); 
    text("Controls", 100, 140);
  }
 
  public boolean startGame() {
    if (mouseX<1230 && mouseX>680 && mouseY<860 && mouseY>720 && mousePressed) {
      menuMusic.stop();
      lossMusic.stop();
      explosionSound.stop();
      setGame(true);
      return true;
    }
    if (isSpace) {
      menuMusic.stop();
      lossMusic.stop();
      explosionSound.stop();
      setGame(true);
      return true;
    }
    if (gameInProgress==true)
    {
      return true;
    }
    return false;
  }
 
  public void setGame(boolean gameState) {
    gameInProgress=gameState;
  }
 
  public void pause()
  {
    fill(255); 
    text("Paused, Enter to unpause", 670, 200);
  }
 
  public void createLoss()
  {
    gameMusic1.stop();
    gameMusic2.stop();
    gameMusic3.stop();
    lossMusic.play();
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("You are dead, now communism will prevail", 430, 210); 
    textSize(30);
    fill(0, 255, 80);
    text("score: " + statusBar.getSeconds() + " seconds", 800, 300);
    fill(0, 255, 80);
    text("highscores:", 800, 400);
    int counter = 0;
    highScoreTable = loadJSONArray("data/highscores.json");
    for (int i = highScoreTable.size()-1; i>0&&i>(highScoreTable.size()-6); i--) {
      JSONObject values = highScoreTable.getJSONObject(i);
      String name = values.getString("player");
      int score = values.getInt("time");
      text((counter+1) + ")", 800, 450 + (counter*50));
      text(score, 850, 450 + (counter*50));
      counter++;
    }
    fill(0, 255, 80);
    rect(630, 700, 650, 180);
    fill(255); 
    rect(680, 720, 550, 140);
    fill(0);
    textSize(45);
    text("Press \"space\" to restart", 705, 805);
    asteroidManager.restartGame();
    powerUpManager.restartGame();
    statusBar.resetGame();
    spaceship.setSpeed(0);
    spaceship.setDirection(0);
    spaceship.setX(1920/2);
    spaceship.setY(1080/2);
  }
}