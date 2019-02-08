public class StatusBar {

  private int seconds;

  public void update(int[]powerUps) {
    powerUpManager.usePowerUp(powerUps);
    fill(0, 255, 80);
    rect(0, 0, 150, 100); 
    fill(0);
    rect(0, 0, 148, 98);
    fill(255);
    text(seconds, 55, 63);
    for (int i=0; i<powerUps.length; i++) {
      if (powerUps[i]==1) {
        fill(#114AF0);
        ellipse(20+(30*i), 80, 20, 20);
      }
      if (powerUps[i]==2) {
        fill(#F7EC0A);
        ellipse(20+(30*i), 80, 20, 20);
      }
      if (powerUps[i]==3) {
        fill(#CE3639);
        ellipse(20+(30*i), 80, 20, 20);
      }
      if (powerUps[i]==4) {
        fill(#9416F0);
        ellipse(20+(30*i), 80, 20, 20);
      }
    }
  }

  public void timer(int frames) {
    if (frames%60==0) {
      seconds++;
    }
    if(frames%60==0&&seconds==1) {
      int musicChoice = (int)random(0, 2.99);
      switch (musicChoice) {
      case 0:
      gameMusic1.play();
        break;
      case 1:
      gameMusic2.play();
        break;
      case 2:
      gameMusic3.play();
        break;
      }
    }
  }

  public void resetGame() {
    seconds=0;
  }

  public int getSeconds() {
    return seconds;
  }
}