void setup() {
  size(600, 400);
  frameRate(60);
  
  
  AnimatedSprite a = new AnimatedSprite();
  {
    a.addAnimation(loadAnimation("link/walk-up.json"));
    a.addAnimation(loadAnimation("link/walk-down.json"));
    a.addAnimation(loadAnimation("link/walk-left.json"));
    a.addAnimation(loadAnimation("link/walk-right.json"));
    a.addAnimation(loadAnimation("link/stand-up.json"));
    a.addAnimation(loadAnimation("link/stand-down.json"));
    a.addAnimation(loadAnimation("link/stand-left.json"));
    a.addAnimation(loadAnimation("link/stand-right.json"));
  }
  
  MovementController c = new MovementController();
  c.sprite = a;
  
  controller = c;
  
  
  scene = new Scene();
  scene.renderables.add(new Map(32, 32));
  scene.renderables.add(a);
  
  a.position.x = 200;
  a.position.y = 100;
  
  
}


int lastFrame = millis();

void draw() {
  int current = millis();
  float delta = (current - lastFrame) / 1000.0f;
  
  background(0);
  
  if (controller != null) {
    controller.update(delta);
  }
  
  scene.update();
  scene.draw();
  
  
  lastFrame = current;
}






