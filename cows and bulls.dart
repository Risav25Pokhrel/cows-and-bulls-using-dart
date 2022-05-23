/*The game works like this:

Randomly generate a 4-digit number. Ask the user to guess a 4-digit number. 
For every digit the user guessed correctly in the correct place, they have a 'cow'. 
For every digit the user guessed correctly in the wrong place is a 'bull.'
Every time the user makes a guess, tell them how many “cows” and 'bulls'
 they have. Once the user guesses the correct number, the game is over. 
 Keep track of the number of guesses the user makes throughout the game and tell the user at the end.*/

import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  String randnumber = (1000 + random.nextInt(9999 - 1000)).toString();
  stdout.write("Welcome to Cows and Bulls\nType 'exit' to stop the game\n");

  int attempts = 0;

  while (true) {
    int cows = 0;
    int bulls = 0;
    attempts += 1;

    stdout.writeln("enter the 4 digit number:");
    String usernum = stdin.readLineSync() ?? '\0';

    if (usernum.length != randnumber.length) {
      print("\nplease enter 4 digit number");
      break;
    }

    if (usernum == randnumber) {
      print("congratulation!!you have completed in $attempts attempt");
      break;
    }
    if (usernum == 'exit') {
      print("bye bye");
      break;
    }

    //game logic
    for (var n = 0; n < usernum.length; n++) {
      if (usernum[n] == randnumber[n]) {
        cows += 1;
        print("cow's=${usernum[n]}");
      } else if (randnumber.contains(usernum[n])) {
        print("bull's=${usernum[n]}");
        bulls += 1;
      }
    }
    print("\nAttempts: $attempts \nCows: $cows, Bulls: $bulls");
  }
}
