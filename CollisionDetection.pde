/*
* New tab in processing sketch
* Collision Detection
* this tab handles collision detection
* Handles:
* - Player vs Player collisions
* TODO: All other collisions
*/

boolean isHit;

boolean collDetectRect(PVector curPos, PVector tarPos, PVector curSize, PVector objPos, PVector objSize, Player player)
{
  if ((tarPos.x + curSize.x >= objPos.x && tarPos.x <= objPos.x + objSize.x) && (tarPos.y + curSize.y >= objPos.y && tarPos.y <= objPos.y + objSize.y))
  {
    if ((curPos.x + curSize.x >= objPos.x && curPos.y + curSize.y == objPos.y) || (curPos.x + curSize.x >= objPos.x && curPos.y == objPos.y + objSize.y))
    { 
      if(curPos.x + curSize.x >= objPos.x && curPos.y + curSize.y == objPos.y && curPos.y + curSize.y <= objPos.y + objSize.y)
        return player.hitBelow = true;
      else return player.hitAbove = true;
    } 
    else if ((curPos.x + curSize.x >= objPos.x && curPos.y + curSize.y >= objPos.y) || (curPos.x <= objPos.x + objSize.x && curPos.y + curSize.y >= objPos.y))
    {
      if(curPos.x <= objPos.x + objSize.x && curPos.x >= objPos.x && curPos.y + curSize.y >= objPos.y)
        return player.hitLeft = true;
      else return player.hitRight = true;
    }    
  }
  isHit = false;
  player.hitRight = false;
  player.hitLeft = false;
  player.hitAbove = false;
  player.hitBelow = false;  
  return false;
}
