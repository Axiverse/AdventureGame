class Sprite extends Renderable {
  PVector size;
  PImage sprite;
  
  Sprite() {
    
  }
  
  Sprite(PImage sprite, float width, float height) {
    this.sprite = sprite;
    this.size = new PVector(width, height);
  }
  
  void update(float delta) {
    
  }
  
  void draw() {
    if (sprite != null) {
      imageMode(CENTER);
      image(this.sprite, 0, 0, size.x, size.y);
    }
  }
}

class KeyFrame {
  PImage sprite;
  float time;
  
  int x;
  int y;
  int w;
  int h;
}

class Animation {
  ArrayList<KeyFrame> frames = new ArrayList();
  float duration;
  boolean loop;
  boolean flipHorizontal;
  String name;
}

class AnimatedSprite extends Sprite {
  
  HashMap<String, Animation> animations = new HashMap();
  
  Animation animation;
  int frame;
  float frameTime;
  
  AnimatedSprite() {
    this.size = new PVector(32, 32);
  }
  
  void update(float delta) {
    if (animation == null) {
      return;
    }
    
    frameTime += delta;
    
    while (frameTime > animation.duration) {
      frameTime -= animation.duration;
      frame = (frame + 1) % animation.frames.size();
    }
     
    this.sprite = animation.frames.get(frame).sprite;
  }
  
  void draw() {
    if (sprite != null) {
      if (animation != null && animation.flipHorizontal) {
        scale(-1, 1);
      }
      
      imageMode(CENTER);
      image(this.sprite, 0, 0, size.x, size.y);
      
      stroke(255, 0, 0);
      noFill();
      rectMode(CENTER);
      //rect(0, 0, size.x, size.y);
    }
  }
  
  /**
   * 
   * @param name
   * @param
   */
  void play(String name, boolean restart) {
    if (restart == false && animation != null && animation.name.equals(name)) {
      return;
    }
    
    if (animations.containsKey(name)) {
      animation = animations.get(name);
      sprite = animation.frames.get(0).sprite;
      frame = 0;
    } else {
      // animation not found
      print(name + " not found");
    }
  }
  
  void play(String name) {
    play(name, false);
  }
  
  void addAnimation(Animation animation) {
    animations.put(animation.name, animation);
  }
  
}

class Character {
  
}
