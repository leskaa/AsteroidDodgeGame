import processing.sound.*;
SoundFile menuMusic, gameMusic1, gameMusic2, gameMusic3, lossMusic, barrierSound, explosionSound, lazerSound, powerUpSound, swooshSound;
PImage ufo, asteroid, space;
boolean isLeft, isRight, isUp, isDown, isEnter, isSpace;
boolean powerUpDelay = false;
boolean resumed = true;
int powerUpWaitTime =0;
int counter=0;
JSONArray highScoreTable;
void setup() {
  size(1920, 1080);
  menuMusic = new SoundFile(this, "MenuMusic.wav");
  gameMusic1 = new SoundFile(this, "GameMusic1.wav");
  gameMusic2 = new SoundFile(this, "GameMusic2.wav");
  gameMusic3 = new SoundFile(this, "GameMusic3.wav");
  lossMusic = new SoundFile(this, "LossMusic.wav");
  barrierSound = new SoundFile(this, "Barrier.wav");
  explosionSound = new SoundFile(this, "Explosion.wav");
  lazerSound = new SoundFile(this, "Lazer.wav");
  powerUpSound = new SoundFile(this, "PowerUp.wav");
  swooshSound = new SoundFile(this, "Swoosh.wav");
  asteroid = loadImage("asteroid.png");
  ufo = loadImage("spaceship.png");
  space = loadImage("Space.jpg");
  background(space);
  menu.createMain();
}
MainMenu menu = new MainMenu(false);
Player spaceship = new Player(0.0, 0.0, 1920/2, 1080/2);
AsteroidManager asteroidManager = new AsteroidManager();
PowerUpManager powerUpManager = new PowerUpManager();
StatusBar statusBar = new StatusBar();
void draw() {
  if (menu.startGame()==true) {
    if (isEnter)
    {
      counter++;
    }
    if (isEnter && counter%30==0)
    {
      menu.pause(); 
      resumed=!resumed;
    }
    if (resumed)
    {
      background(space);
      statusBar.timer(frameCount);
      statusBar.update(powerUpManager.getStored());
      powerUpManager.update(frameCount);
      spaceship.move();
      spaceship.edgeCollision(spaceship.getX(), spaceship.getY());
      asteroidManager.update(frameCount);
      asteroidManager.spawnAsteroid();
      powerUpManager.spawnPowerUp();
    }
  }
}

void keyPressed() {
  setMove(keyCode, true);
}

void keyReleased() {
  setMove(keyCode, false);
}

boolean setMove(int k, boolean b) {
  switch (k) {
  case UP:
    return isUp = b;

  case DOWN:
    return isDown = b;

  case LEFT:
    return isLeft = b;

  case RIGHT:
    return isRight = b;

  case ENTER:
    return isEnter = b;

  case 32:
    return isSpace = b;

  default:
    return b;
  }
}
