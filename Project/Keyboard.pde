boolean[] keysActive = new boolean[300];
IController controller;

void keyPressed() {
  keysActive[keyCode] = true;
  
  if (controller != null) {
    controller.keyPressed();
  }
}

void keyReleased() {
  keysActive[keyCode] = false;
  
  if (controller != null) {
    controller.keyReleased();
  }
}

interface IController {
  void keyPressed();
  void keyReleased();
  void update(float delta);
}

class MovementController implements IController {
  
  AnimatedSprite sprite;
  String direction = "down";
  
  void keyPressed() {
    switch (keyCode) {
      case UP:
        direction = "up";
        break;
      case DOWN:
        direction = "down";
        break;
      case LEFT:
        direction = "left";
        break;
      case RIGHT:
        direction = "right";
        break;
    }
  }
  
  void keyReleased() {
    
  }
  
  void update(float delta) {
    float speed = 100;
    boolean moving = false;
    
    if (keysActive[UP]) {
      sprite.position.y -= speed * delta;
      moving = true;
    }
    
    if (keysActive[DOWN]) {
      sprite.position.y += speed * delta;
      moving = true;
    }
    
    if (keysActive[RIGHT]) {
      sprite.position.x += speed * delta;
      moving = true;
    }
    
    if (keysActive[LEFT]) {
      sprite.position.x -= speed * delta;
      moving = true;
    }
    
    if (moving) {
      sprite.play("walk-" + direction);
    } else {
      sprite.play("stand-" + direction);
    }
  }
}
