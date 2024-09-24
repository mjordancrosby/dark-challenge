int getMinDenoms(List<int> coins, int amount) {
  if (amount < 0) {
    throw ArgumentError("Amount must greater than or equal to 0");
  }

  if (coins.isEmpty) {
    throw ArgumentError("At least one coin must be passed");
  }

  for (var coin in coins) {
    if (coin <= 0) {
      throw ArgumentError(
          "$coin invalided value. Coins must contain postive integers only");
    }
  }

  // subAmmount[i] will hold the minimum number of coins needed to make amount i
  List<int> subAmmount = List.filled(amount + 1, amount + 1);

  // Base case: no coins are needed to make amount 0
  subAmmount[0] = 0;

  // Iterate through all amounts from 1 to the given amount
  for (int i = 1; i <= amount; i++) {
    // For each amount, try every coin
    for (int coin in coins) {
      if (i - coin >= 0) {
        subAmmount[i] = subAmmount[i] <= subAmmount[i - coin] + 1
            ? subAmmount[i]
            : subAmmount[i - coin] + 1;
      }
    }
  }

  // If subAmmount[amount] is still greater than the amount, return -1
  return subAmmount[amount] > amount ? -1 : subAmmount[amount];
}
