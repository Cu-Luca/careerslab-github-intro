int playerTotal = 0;
int botTotal = 0;
int turn = 0;
int[] ladders = new int[6];
int[] snakes = new int[6];
boolean playerLadder = false;
boolean playerSnake = false;
boolean botLadder = false;
boolean botSnake = false;

void setup() {
  for (int i=0; i<6; i++) {
    snakes[i]=int(random(11, 100));
    ladders[i]=int(random(1, 89));
  }

  print("Snakes are: ");
  for (int i=0; i<6; i++) {
    print(snakes[i]+" ");
  }

  println();
  print("Ladders are: ");
  for (int i=0; i<6; i++) {
    print(ladders[i]+" ");
  }
  println();
}

void draw() {
  if(playerTotal==100){
    println();
    println("-CONGRATULATIONS-");
    println("   You are win   ");
    playerTotal=0;
  }
  
  if(botTotal==100){
    println();
    println("-Condolences-");
    println("You are lose.");
    botTotal=0;
  }
}

void mouseReleased() {
  if (mouseButton==LEFT) {
    playerLadder = false;
    playerSnake = false;
    botLadder = false;
    botSnake = false;
    int playerRoll = int(random(1, 7));
    int botRoll = int(random(1, 7));
    if (playerRoll+playerTotal>100) {
      playerRoll=0;
    }
    if (botRoll+botTotal>100) {
      botRoll=0;
    }
    playerTotal+=playerRoll;
    botTotal+=botRoll;
    turn++;
    println("--- TURN "+turn+" ---");
    if (playerRoll>0) {
      println("You rolled a "+playerRoll+" and moved to space "+playerTotal+".");
    } else if (playerRoll==0) {
      println("You rolled too high and didn't move from space "+playerTotal+".");
    }
    if (botRoll>0) {
      println("Your opponent rolled a "+botRoll+" and moved to space "+botTotal+".");
    } else if (botRoll==0) {
      println("Your opponent rolled too high and didn't move from space "+botTotal+".");
    }

    for (int i=0; i<6; i++) {
      if (playerTotal==snakes[i]) {
        playerTotal-=10;
        println("You hit a snake and was sent back to space " + playerTotal + "!");
      }
    }
    for (int i=0; i<6; i++) {
      if (playerTotal==ladders[i]) {
        playerTotal+=10;
        println("You hit a ladder and climbed up to space " + playerTotal + "!");
      }
    }
    for (int i=0; i<6; i++) {
      if (botTotal==snakes[i]) {
        botTotal-=10;
        println("Your opponent hit a snake and was sent back to space " + botTotal + "!");
      }
    }
    for (int i=0; i<6; i++) {
      if (botTotal==ladders[i]) {
        botTotal+=10;
        println("Your opponent hit a ladder and climbed up to space " + botTotal + "!");
      }
    }
  }

  if (mouseButton==RIGHT) {
    println();
    print("Snakes are: ");
    for (int i=0; i<6; i++) {
      print(snakes[i]+" ");
    }

    println();
    print("Ladders are: ");
    for (int i=0; i<6; i++) {
      print(ladders[i]+" ");
    }
    println();
  }
}





//void draw() {
//  for (int i=0; i<6; i++) {
//    if (playerTotal==snakes[i]) {
//      playerTotal-=10;
//      println("You hit a snake and was sent back to space " + playerTotal + "!");
//    }
//  }
//  for (int i=0; i<6; i++) {
//    if (playerTotal==ladders[i]) {
//      playerTotal+=10;
//      println("You hit a ladder and climbed up to space " + playerTotal + "!");
//    }
//  }
//  for (int i=0; i<6; i++) {
//    if (botTotal==snakes[i]) {
//      botTotal-=10;
//      println("Your opponent hit a snake and was sent back to space " + botTotal + "!");
//    }
//  }
//  for (int i=0; i<6; i++) {
//    if (botTotal==ladders[i]) {
//      botTotal+=10;
//      println("Your opponent hit a ladder and climbed up to space " + botTotal + "!");
//    }
//  }
//}
