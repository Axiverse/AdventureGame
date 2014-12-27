HashMap<String, PImage> images = new HashMap();

PImage loadPicture(String path) {
  if (images.containsKey(path)) {
    return images.get(path);
  } else {
    PImage image = loadImage(path);
    images.put(path, image);
    return image;
  }
}

Animation loadAnimation(String path) {
  
  Animation animation = new Animation();
  JSONObject json = loadJSONObject(path);
  
  animation.name = json.getString("name");
  animation.duration = json.getFloat("duration");
  
  if (!json.isNull("flipHorizontal")) {
    animation.flipHorizontal = json.getBoolean("flipHorizontal");
  }
  
  String imagePath = json.getString("image");
  PImage image = loadPicture(imagePath);
  
  JSONArray frames = json.getJSONArray("frames");
  
  for (int i = 0; i < frames.size(); ++i) {
    animation.frames.add(loadKeyFrame(frames.getString(i), image));
  }
  
  return animation;
}

KeyFrame loadKeyFrame(String json, PImage image) {
  
  KeyFrame keyFrame = new KeyFrame();
  String[] parts = json.split(",");
  
  keyFrame.x = parseInt(parts[0]);
  keyFrame.y = parseInt(parts[1]);
  keyFrame.w = parseInt(parts[2]);
  keyFrame.h = parseInt(parts[3]);
  
  keyFrame.sprite = image.get(keyFrame.x, keyFrame.y, keyFrame.w, keyFrame.h);
  
  return keyFrame;
}
