class Ship {
  
  int x = int(width / 2);
  int y = int(height / 2);
  float vx = 0;
  float vy = 0;
  float direction = -HALF_PI;
  ArrayList<Bullet> bullets = new ArrayList();
  
  Ship() {
    
  }
  
  void move() {
    PVector mouse = new PVector(mouseX - x, mouseY - y);
    direction = mouse.heading();
    
    
    control();
    vx *= 0.9;
    vy *= 0.9;
    x += int(this.vx);
    y += int(this.vy);
    vx = min(max(vx,-10), 10);
    vy = min(max(vy,-10), 10);
    x = (x+600)%600;
    y = (y+600)%600;
    y = min(max(y,0), 600);
    
    if (frameCount % 30 == 0) {
      bullets.add(new Bullet(x, y, mouse.x, mouse.y));
    }
    
    for (Bullet bullet : bullets) {
      bullet.move();
      bullet.render();
      if (dist(bullet.x, bullet.y, x, y) < 20) {
        death();
      }
    }
  }
  
  void render() {
    noFill();
    stroke(0, 255, 100);
    resetMatrix();
    translate(x, y);
    rotate(direction);
    line(20, 0, -10, 10);
    line(0, 0, -10, 10);
    line(0, 0, -10, -10);
    line(20, 0, -10, -10);
  }
  
  void control() {
    if (up) {
      println(1);
      vy = -10;
    }
    
    if (down) {
      println(1);
      vy = 10;
    }
    
    if (right) {
      println(1);
      vx = 10;
    }
    
    if (left) {
      println(1);
      vx = -10;
    }
  }
  
}