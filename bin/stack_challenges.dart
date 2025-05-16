import 'package:data_structure_challenges/stack.dart';

void main() {
  // Challenge 1: Reverse a List
  // Create a function that prints the contents of a list in reverse order.
  // Challenge 2: Balance the Parentheses
  // Check for balanced parentheses. Given a string,
  // check if there are ( and ) characters, and return true if the parentheses
  //in the string are balanced.
  firstChallenge();
  secondChallenge();
}

void firstChallenge() {
  reverseList(['1', '2', '3', '4', '5']);
}

void reverseList(List<String> list) {
  List reversedlist = [];
  final stackedList = Stack.of(list);

  while (stackedList.isNotEmpty) {
    reversedlist.add(stackedList.pop());
  }
  print(reversedlist);
}

void secondChallenge() {
  checkBalancedParentheses('h((e))llo(world)()');
  checkBalancedParentheses('(hello world');
}

void checkBalancedParentheses(String word) {
  final stackedLetters = Stack.of(word.split(''));

  int rpCount = 0; //)
  int lpCount = 0; //(
  while (stackedLetters.isNotEmpty) {
    final currentChar = stackedLetters.pop();
    if (currentChar == ')') {
      rpCount = rpCount + 1;
    } else if (currentChar == '(') {
      lpCount = lpCount + 1;
      if (rpCount == 0) {
        break;
      } else {
        rpCount = rpCount - 1;
        lpCount = lpCount - 1;
      }
    }
  }

  if (rpCount == 0 && lpCount == 0) {
    print('balanced');
  } else {
    print('unbalanced');
  }
}
