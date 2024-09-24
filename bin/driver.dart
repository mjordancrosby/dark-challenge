import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_challenge/fewest_coins.dart';
import 'package:dart_challenge/palindromic.dart';

void main(List<String> args) {
  CommandRunner("driver", "App to test code challenge solutions")
    ..addCommand(MinDenomsCommand())
    ..addCommand(PalindromicCommand())
    ..run(args).catchError((error) {
      print(error);
      exit(64); // Exit code 64 indicates a usage error.
    });
}

class MinDenomsCommand extends Command {
  @override
  final name = "mindenoms";
  @override
  final description =
      "Calculate min number of coins to total a specified amount";

  MinDenomsCommand() {
    argParser.addMultiOption('coins', abbr: 'c', help: 'List of coins');
    argParser.addOption('amount',
        abbr: 'a', mandatory: true, help: 'Amount to test');
  }

  @override
  void run() {
    var coins = argResults?['coins'] as List<String>;
    var amount = argResults?['amount'] as String;

    var result = getMinDenoms(
        List.from(coins.map((coin) => int.parse(coin))), int.parse(amount));
    print('min denominations for $amount with coins $coins: $result');
  }
}

class PalindromicCommand extends Command {
  @override
  final name = "palindromic";
  @override
  final description = "Determine if a string is a palindrom";

  PalindromicCommand() {
    argParser.addOption('subject',
        abbr: 's', mandatory: true, help: 'String to test');
    argParser.addOption('startRange',
        mandatory: true, help: 'Start range of substring');
    argParser.addOption('endRange',
        mandatory: true, help: 'End range of substring');
  }

  @override
  void run() {
    var subject = argResults?['subject'] as String;
    var startRange = argResults?['startRange'] as String;
    var endRange = argResults?['endRange'] as String;

    var intStart = int.parse(startRange);
    var intEnd = int.parse(endRange);
    if (palindromic(subject, intStart, intEnd)) {
      print('${subject.substring(intStart, intEnd + 1)} is a palindrom');
    } else {
      print('${subject.substring(intStart, intEnd + 1)} is not a palindrom');
    }
  }
}
