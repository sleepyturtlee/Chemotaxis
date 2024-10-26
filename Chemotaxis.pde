class Walker {
  int myX, myY;
  color coolColor;
  Walker() {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*200);
    coolColor = color(0, 255, 0);
  }
 
  void walk() {
    myX += (int)(Math.random()*3) - 1; // can be -1, 0, 1
    myY += (int)(Math.random()*3) - 1; // -1, 0, 1
  
  if(playerX > myX) {
    myX += (int)(Math.random()*6) - 0;
  } else {
    myX += (int)(Math.random()*6) - 5; 
  }
  if(playerY > myY) {
    myY += (int)(Math.random()*6) - 0;
  } else {
    myY += (int)(Math.random()*6) - 5;
  }
  
    if(dist(playerX, playerY, myX, myY) < 10) {
      gameOver = true;
    }
  }
 
  
  void show() {
    fill(117, 83, 52);
    triangle(myX, myY, myX - 10, myY + 20, myX + 10, myY + 20);
    fill(coolColor);
    ellipse(myX, myY, 20, 20);
    fill(255);
    // whites of eyes
    ellipse(myX - 6, myY, 7, 7);
    ellipse(myX + 6, myY, 7, 7);
    fill(0);
    //ellipse(myX - 6, myY, 3, 3);
    //ellipse(myX + 6, myY, 3, 3);
    fill(209, 44, 102);
    ellipse(myX, myY + 5, 5, 5);
  }
 
}

Walker bobby;
Walker [] friends = new Walker[20];
// main stuff for formatting
int x = 250;
int y = 250;
boolean gameOver = false;
int playerX = 250;;
int playerY = 250;
int playerVelocity = 4;
boolean upButton = false;
boolean downButton = false;
boolean leftButton = false;
boolean rightButton = false;
void setup() {
  size(500, 500);
  background(100);
  textAlign(CENTER, CENTER);
  bobby = new Walker();
  for(int i = 0; i < friends.length; i++) {
    friends[i] = new Walker();
  }
}

void draw() {
  background(20);
  
  // person
  fill(0, 0, 255);
  triangle(playerX, playerY, playerX - 10, playerY + 20, playerX + 10, playerY + 20);
  fill(255);
  ellipse(playerX, playerY, 17, 17);
  
  for(int i = 0; i < friends.length; i++) {
    friends[i].walk();
    friends[i].show();
  }
  
  // if the game is over... (ZOMBIES TOUCH PLAYER !)
  if(gameOver == true) {
    fill(255);
    rect(125, 125, 250, 250);
    fill(82, 163, 99);
    rect(250 - 90, 280, 180, 50);
    fill(0);
    textSize(30);
    text("Game over !", 250, 160);
    textSize(25);
    text("The zombies ate your", 250, 195);
    textSize(60);
    text("BRAINS!", 250, 240);
    textSize(30);
    text("Try again ?", 250, 305);
    playerVelocity = 0;
  }
  
  // player controls
  if(upButton == true){
  playerY -= playerVelocity;
  }
  if(downButton == true){
  playerY += playerVelocity;
  }
  if(leftButton == true){
  playerX -= playerVelocity;
  }
  if(rightButton == true){
  playerX += playerVelocity;
  }
  
  // wrap around
  if(playerX < -5) {
    playerX = 505;
  }
  if(playerX > 505) {
    playerX = -5;
  }
  if(playerY < -12) {
    playerY = 512;
  }
  if(playerY > 512) {
    playerY = -12;
  }
  
}

void mousePressed() {
if(mousePressed == true) {
  if(gameOver == true) {
        // if try again is pressed during game over...
      if(mouseX < 340 && mouseX > 160) {
        if(mouseY > 280 && mouseY < 330) {
          text("You clicked", 100, 100);
         for(int i = 0; i < friends.length; i++) {
           friends[i] = new Walker();
         }
         playerX = 250;
         playerY = 250;
         playerVelocity = 4;
        }
      }
    }
}
gameOver = false;
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == SHIFT) {
      playerVelocity = 5;
    }
    if(keyCode == UP) {
      upButton = true;
    }
    if(keyCode == DOWN) {
      downButton = true;
    }
    if(keyCode == LEFT) {
      leftButton = true;
    }
    if(keyCode == RIGHT) {
      rightButton = true;
    }
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == SHIFT) {
      playerVelocity = 4;
    }
    if(keyCode == UP) {
      upButton = false;
    }
    if(keyCode == DOWN) {
      downButton = false;
    }
    if(keyCode == LEFT) {
      leftButton = false;
    }
    if(keyCode == RIGHT) {
      rightButton = false;
    }
  }
}
