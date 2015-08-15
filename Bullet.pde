class Bullet {
  
  int x, y;
  float vx, vy;
  
  Bullet(int _x, int _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    PVector temp = new PVector(_vx, _vy);
    temp.setMag(10);
    vx = temp.x;
    vy = temp.y;
    x += vx * 3;
    y += vy * 3;
  }
  
  void move() {
    x = int(vx + x);
    y = int(vy + y);
    x = (x+600)%600;
    y = (y+600)%600;
  }
  
  void render() {
    noStroke();
    fill(0,255,120);
    ellipse(x, y, 2, 2);
  } 
}