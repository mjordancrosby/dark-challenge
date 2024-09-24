bool palindromic(String subject, int startRange, int endRange) {
  if (subject.isEmpty) {
    throw ArgumentError('subject must be an non empty string');
  }

  if (startRange < 0 || startRange >= subject.length) {
    throw RangeError('startRange must be between 0 and ${subject.length - 1}');
  }

  if (endRange < 0 && endRange >= subject.length) {
    throw RangeError('endRange must be between 0 and ${subject.length - 1}');
  }

  if (startRange > endRange) {
    throw RangeError('startRange must be greater than endRange');
  }

  if (subject[startRange] == subject[endRange]) {
    int nextStartRange = startRange + 1;
    int nextEndRange = endRange - 1;
    if (nextEndRange < nextStartRange) {
      return true;
    }
    return palindromic(subject, nextStartRange, nextEndRange);
  }
  return false;
}
