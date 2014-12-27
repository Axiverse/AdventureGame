class Map extends Renderable {
  
  HashMap<Integer, Tile> tileset;
  Tile[] tiles;
  int width;
  int height;
  
  Map(int width, int height) {
    this.width = width;
    this.height = height;
    this.tiles = new Tile[width * height];
    this.tileset = new HashMap();
    
    // temporarily populate tiles
    PImage tileImage = loadImage("tiles.png");
    
    for (int x = 0; x < 16; x++) {
      for (int y = 0; y < 16; y++) {
        Tile t = new Tile();
        t.image = tileImage.get(x * 16, y * 16, 16, 16);
        
        tileset.put(x * 16 + y, t);
      }
    }
    
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rx = (int)random(8,11);
        int ry = (int)random(7,9);
        Tile t = tileset.get(rx * 16 + ry);
        
        
        tiles[x * 16 + y] = t;
      }
    }
  }
  
  void update(float delta) {
    
  }
  
  void draw() {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        Tile t = tiles[x * 16 + y];
        imageMode(CORNER);
        image(t.image, x * 16, y * 16, 16, 16);
      }
    }
  }
  
  
}

class Tile {
  PImage image;
}
