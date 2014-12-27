Scene scene;

interface IScene {
  void update();
  void draw();
}

class Scene implements IScene {
  
  ArrayList<Renderable> renderables = new ArrayList();
  PVector position = new PVector();
  
  int lastFrame;
  
  Scene() {
    lastFrame = millis();
  }
  
  void update() {
    int current = millis();
    float delta = (current - lastFrame) / 1000.0f;
    
    for (Renderable r : renderables) {
      r.update(delta);
    }
    
    lastFrame = current;
  }
  
  void draw() {
    translate(-position.x, -position.y);
    for (Renderable r : renderables) {
      pushMatrix();
      translate(r.position.x, r.position.y);
      rotate(r.rotation);
      r.draw();
      popMatrix();
    }
  }
  
}

interface IRenderable {
  void update(float delta);
  void draw();
}

class Renderable {
  
  PVector position;
  float rotation;
  
  Renderable() {
    position = new PVector();
  }
  
  void update(float delta) {
    float speed = 50;
    
    if (keysActive[UP]) {
      position.y -= delta * speed;
    }
    if (keysActive[DOWN]) {
      position.y += delta * speed;
    }
    if (keysActive[LEFT]) {
      position.x -= delta * speed;
    }
    if (keysActive[RIGHT]) {
      position.x += delta * speed;
    }
  }
  
  void draw() {
    fill(100);
    rect(0, 0, 30, 30);
  }
}
