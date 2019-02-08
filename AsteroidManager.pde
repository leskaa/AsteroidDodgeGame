public class AsteroidManager {
  
  private int asteroidMaxSpeed = 3;
  private int asteroidMinSpeed = 1;
  private int asteroidSpawnRate = 2;
 
  ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
 
  public void update(float frames) {
    if (frames%1000==0) {
      asteroidMaxSpeed++;
      asteroidSpawnRate++;
      if (asteroidMinSpeed==1) {
        asteroidMinSpeed++;
      }
    }
 
    if (frames%3000==0) {
      asteroidMinSpeed++;
    }
    for (int x = 0; x<asteroidList.size(); x++){
      if(asteroidList.get(x).lazerCollisionHorizontal(spaceship.getX(), spaceship.getY())==true){
        asteroidList.remove(x);
        x--;
      }
    }
    for (int x = 0; x<asteroidList.size(); x++){
      if(asteroidList.get(x).lazerCollisionVertical(spaceship.getX(), spaceship.getY())==true){
        asteroidList.remove(x);
        x--;
      }
    }
    for (Asteroid i : asteroidList) {
      i.moveAsteroid();
      if (i.collisionPlayer(spaceship.getX(), spaceship.getY())==true) {
        break;
      }
    }
  }
  public void spawnAsteroid() {
    if (random(1, 200)>(200-asteroidSpawnRate)) {
      float x = random(1, 5);
      asteroidList.add( new Asteroid((int)x, asteroidMinSpeed, asteroidMaxSpeed));
    }
  }
  public void restartGame() {
    asteroidList.clear();
    asteroidMinSpeed = 2;
    asteroidMaxSpeed = 3;
    asteroidSpawnRate = 1;
  }
  
}