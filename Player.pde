/*
* New tab in processing sketch
* Player class
* this is the base player class, all players will be instances of this class
* Handles:
* Init, moving based off Input(), displaying the object
*/

class Player
{
  boolean hitRight, hitLeft, hitAbove, hitBelow;
  boolean isUp, isDown, isLeft, isRight;   // Movement booleans
  PVector targetPosition;                  // Movement (x, y) position, used to check for collisions occurring if targetPosition moves into occupied space
  PVector currentPosition;                 // Current (x, y) position of the player object
  PVector playerSize;                      // Width and Height of player object in (x, y)

  int moveSpeed;                           // Movement speed of the player object
  String playerTag;                        // Identifier of the object


  // Player object constructor. Initialises variables used when an instance of this object is created.
  Player(PVector initPosition, PVector initSize, int initMoveSpeed, String initPlayerTag)
  {
    currentPosition = initPosition;
    playerSize = initSize;
    moveSpeed = initMoveSpeed;
    playerTag = initPlayerTag;
    targetPosition = new PVector(0, 0);
  }

  // Function to render the player object
  void display()
  {
    pushMatrix();
    rect(currentPosition.x, currentPosition.y, playerSize.x, playerSize.y);
    popMatrix();
  }

  // Function to move the player
  void move()
  {
    pushMatrix();
    if (hitBelow)
    {
      targetPosition.x = constrain(targetPosition.x + moveSpeed * (int(isRight) - int(isLeft)), 0, (width - playerSize.x) - 1);
      targetPosition.y = constrain(targetPosition.y + moveSpeed * (0  - int(isUp)), 0, (height - playerSize.y) - 1);
      currentPosition.x = targetPosition.x;
      currentPosition.y = targetPosition.y;
    } else if (hitRight)
    {
      targetPosition.x = constrain(targetPosition.x + moveSpeed * (0 - int(isLeft)), 0, (width - playerSize.x) - 1);
      targetPosition.y = constrain(targetPosition.y + moveSpeed * (int(isDown)  - int(isUp)), 0, (height - playerSize.y) - 1);
      currentPosition.x = targetPosition.x;
      currentPosition.y = targetPosition.y;
    } else if (hitLeft)
    {
      targetPosition.x = constrain(targetPosition.x + moveSpeed * (int(isRight) - 0), 0, (width - playerSize.x) - 1);
      targetPosition.y = constrain(targetPosition.y + moveSpeed * (int(isDown)  - int(isUp)), 0, (height - playerSize.y) - 1);
      currentPosition.x = targetPosition.x;
      currentPosition.y = targetPosition.y;
    } else if (hitAbove)
    {
      targetPosition.x = constrain(targetPosition.x + moveSpeed * (int(isRight) - int(isLeft)), 0, (width - playerSize.x) - 1);
      targetPosition.y = constrain(targetPosition.y + moveSpeed * (int(isDown)  - 0), 0, (height - playerSize.y) - 1);
      currentPosition.x = targetPosition.x;
      currentPosition.y = targetPosition.y;
    } else
    {
      targetPosition.x = constrain(targetPosition.x + moveSpeed * (int(isRight) - int(isLeft)), 0, (width - playerSize.x) - 1);
      targetPosition.y = constrain(targetPosition.y + moveSpeed * (int(isDown)  - int(isUp)), 0, (height - playerSize.y) - 1);
      currentPosition.x = targetPosition.x;
      currentPosition.y = targetPosition.y;
    }  
    popMatrix();
  }

  // Function wrapper for object functions
  void update()
  {
    display();
    move();
  }

  /*
  * setMove() is used to set the direction that the player object is moving
   *  - keyVal:         Returned from keyPressed as an int value
   *  - bool:           Sets direction boolean based on keyPressed() (Pressed == true, released == false)
   *  - localPlayerTag: Player identifier to abstract player one and player two movement
   */

  public boolean setMove(int keyVal, boolean bool, String localPlayerTag)
  {
    if (localPlayerTag == "Player 1")
    {
      switch(keyVal)
      {
      case 'W':
        return isUp = bool;

      case 'S':      
        return isDown = bool;

      case 'A':      
        return isLeft = bool;

      case 'D':
        return isRight = bool;

      default:
        return bool;
      }
    }

    if (localPlayerTag == "Player 2")
    {
      switch(keyVal)
      {          
      case UP:
        return isUp = bool;            

      case DOWN:
        return isDown = bool;            

      case LEFT:
        return isLeft = bool;            

      case RIGHT:
        return isRight = bool;

      default:
        return bool;
      }
    } else return bool;
  }
}
