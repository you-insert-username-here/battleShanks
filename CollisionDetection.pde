/*
* New tab in processing sketch
* Collision Detection
* this tab handles collision detection
* Handles:
* - Player vs Player collisions
* TODO: All other collisions
*/

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* colDetection() is used to loop through the players and call collDetectRect
* Currently also displays information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void colDetection()
{
  textSize(10);
  text("Player 1 Position x: " + player[0].currentPosition.x + "\nPlayer 1 Position Y: " + player[0].currentPosition.y, 10, 10);
  text("Player 2 Position x: " + player[1].currentPosition.x + "\nPlayer 2 Position Y: " + player[1].currentPosition.y, 10, 50);
  //text("Hittness: " + isHit, 200, 10);

  text("P1: Hit Right: " + player[0].hitRight, 10, 80);
  text("P1: Hit Left: " + player[0].hitLeft, 10, 90);
  text("P1: Hit Above: " + player[0].hitAbove, 10, 100);
  text("P1: Hit Below: " + player[0].hitBelow, 10, 110);

  text("P2: Hit Right: " + player[1].hitRight, 10, 130);
  text("P2: Hit Left: " + player[1].hitLeft, 10, 140);
  text("P2: Hit Above: " + player[1].hitAbove, 10, 150);
  text("P2: Hit Below: " + player[1].hitBelow, 10, 160);

  for (int i = 0; i < player.length; i++)
  {
    if (i == 1)
      collDetectRect(player[i].currentPosition, player[i].targetPosition, player[i].playerSize, player[i-1].currentPosition, player[i-1].playerSize, player[i]);
    if (i == 0)
      collDetectRect(player[i].currentPosition, player[i].targetPosition, player[i].playerSize, player[i+1].currentPosition, player[i+1].playerSize, player[i]);
  }
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* collDetectRect() handles the collision detection of rect <> rect collisions
* Currently used solely for player collisions it accepts variables:
* - curPos:  current (x, y) position of the base object
* - tarPos: target/future (x, y)  position of the base object
* - curSize: size in (x, y) of the object
* - objPos: current (x, y) position of the object we are checking against
* - objSize: size in (x, y) of the object we are checking against
*
* TODO: 
* - Expand to include other objects inclusive of projectles
* - Expand to detect collisions with objects within the level
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
boolean collDetectRect(PVector curPos, PVector tarPos, PVector curSize, PVector objPos, PVector objSize, Player player)
{
  if ((tarPos.x + curSize.x >= objPos.x && tarPos.x <= objPos.x + objSize.x) && (tarPos.y + curSize.y >= objPos.y && tarPos.y <= objPos.y + objSize.y))
  {
    if ((curPos.x + curSize.x >= objPos.x && curPos.y + curSize.y == objPos.y) || (curPos.x + curSize.x >= objPos.x && curPos.y == objPos.y + objSize.y))
    { 
      if (curPos.x + curSize.x >= objPos.x && curPos.y + curSize.y == objPos.y && curPos.y + curSize.y <= objPos.y + objSize.y)
        return player.hitBelow = true;
      else return player.hitAbove = true;
    } else if ((curPos.x + curSize.x >= objPos.x && curPos.y + curSize.y >= objPos.y) || (curPos.x <= objPos.x + objSize.x && curPos.y + curSize.y >= objPos.y))
    {
      if (curPos.x <= objPos.x + objSize.x && curPos.x >= objPos.x && curPos.y + curSize.y >= objPos.y)
        return player.hitLeft = true;
      else return player.hitRight = true;
    }
  }
  player.hitRight = false;
  player.hitLeft = false;
  player.hitAbove = false;
  player.hitBelow = false;  
  return false;
}

