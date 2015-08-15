Ship ship;
int state = 0; // 0 menu 1 playing
boolean up, down, left, right = false;



void setup() {
  size(600, 600);
}

void draw() {
  if (state == 0) {
    background(0);
    textSize(32);
    text("dodge your own bullets forever", 60, height / 2);
    textSize(12);
    text("press spaaace", 250, 320);
  } else if (state == 1) {
    background(0);
    process();
    render();
  }
}

void keyPressed() {
  if (key == ' ' && state == 0) {
    startRound();
  }
  if (key == CODED) {
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == DOWN) {
      down = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == DOWN) {
      down = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
  }
}

void startRound() {
  ship = new Ship();
  state = 1;
}

void process() {
  ship.move();
}

void render() {
  ship.render();
}