import 'package:dart_challenge/palindromic.dart';
import 'package:test/test.dart';

void main() {
  group('palindromic tests', () {
    test('Palindrome in the full string - odd', () {
      expect(palindromic('racecar', 0, 6), isTrue);
    });

    test('Palindrome in the full string - even', () {
      expect(palindromic('sees', 0, 3), isTrue);
    });

    test('Non-palindromic string - odd', () {
      expect(palindromic('abcda', 0, 4), isFalse);
    });

    test('Non-palindromic string - even', () {
      expect(palindromic('abccda', 0, 5), isFalse);
    });

    test('Palindrome in a substring - odd', () {
      expect(palindromic('abcbd', 1, 3), isTrue);  // 'bcb' is a palindrome
    });

    test('Palindrome in a substring - odd', () {
      expect(palindromic('abbd', 1, 2), isTrue);  // 'bb' is a palindrome
    });

    test('Single character is considered palindrome', () {
      expect(palindromic('abcdef', 2, 2), isTrue);  // 'c' is a palindrome
    });

    test('Empty string should throw error', () {
      expect(() => palindromic('', 0, 0), throwsArgumentError);
    });

    test('Out of bounds should throw an error - end range exceeded', () {
      expect(() => palindromic('test', 0, 10), throwsRangeError);
    });

    test('Out of bounds should throw an error - start range exceeded', () {
      expect(() => palindromic('test', -1, 3), throwsRangeError);
    });

    test('Out of bounds should throw an error - end range before start', () {
      expect(() => palindromic('test', 3, 0), throwsRangeError);
    });
  });
}
