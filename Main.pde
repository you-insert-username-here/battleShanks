/*
* New tab in processing sketch
* Main loop
* this tab handles setup, draw and key presses etc.
*/

Player player[] = new Player[2];

void setup()
{
  player[0] = new Player(new PVector(0, height >> 1), new PVector(20, 20), 1, "Player 1");
  player[1] = new Player(new PVector(width - 21, height >> 1), new PVector(20, 20), 1, "Player 2");

  size(600, 600);
}

void draw()
{
  background(0305);
  colDetection();
  for (int i = 0; i < player.length; i++)
  {
    player[i].update();
  }
  
}

void keyPressed()
{
  player[0].setMove(keyCode, true, "Player 1");
  player[1].setMove(keyCode, true, "Player 2");
}

void keyReleased()
{
  player[0].setMove(keyCode, false, "Player 1");
  player[1].setMove(keyCode, false, "Player 2");
}
}
