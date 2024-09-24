import 'package:dart_challenge/fewest_coins.dart';
import 'package:test/test.dart';

void main() {
  group('getMinDenoms', () {
    test('Returns correct result for standard test cases', () {
      expect(getMinDenoms([25, 10, 3], 12), equals(4)); // 3 + 3 + 3 + 3
      expect(getMinDenoms([25, 10, 3], 15), equals(5)); // 3 + 3 + 3 + 3 + 3
      expect(getMinDenoms([25, 10, 5, 1], 2), equals(2)); // 1 + 1
      expect(getMinDenoms([25, 10, 5, 1], 5), equals(1)); // 5
      expect(getMinDenoms([25, 10, 5, 1], 6), equals(2)); // 5 + 1
      expect(getMinDenoms([25, 10, 5, 1], 1005), equals(41)); // 40 * 25 + 5
      expect(getMinDenoms([25, 10, 5, 1], 11), equals(2)); // 10 + 1
      expect(getMinDenoms([25, 10, 5, 1], 3), equals(3)); // 1 + 1 + 1
      expect(getMinDenoms([25, 10, 5, 1], 0), equals(0)); // 0 coins needed
    });

    test('Returns correct result for unordered coins list', () {
      expect(getMinDenoms([25, 4, 16], 12), equals(3)); // 4 + 4 + 4
    });

    test('Returns -1 when no combination can form the amount', () {
      expect(getMinDenoms([25, 10, 5], 3), equals(-1)); // Impossible to form 3
    });

    test('Negative amount throws error', () {
      expect(() => getMinDenoms([25, 10, 5, 1], -1), throwsArgumentError);
    });

    test('Empty coins list throws error', () {
      expect(() => getMinDenoms([], 1), throwsArgumentError);
    });

    test('Negative coin value throws error', () {
      expect(() => getMinDenoms([1, -1], 1), throwsArgumentError);
    });
  });
}
