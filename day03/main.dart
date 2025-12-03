import "dart:io";
import "dart:math";

void part1(List<String> lines) {
  int sum = 0;

  for (var l in lines) {
    int max = 0;

    // naive approach that is fast enough
    for (int i = 0; i < l.length; i++) {
      int di = int.parse(l[i]) * 10;
      for (int j = i + 1; j < l.length; j++) {
        int joltage = di + int.parse(l[j]);

        if (joltage > max) {
          max = joltage;
        }
      }
    }
    sum += max;
  }

  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;
  for (var l in lines) {
    if (l.isEmpty) {
      continue;
    }

    List<int> digits = List<int>.generate(l.length, (i) => int.parse(l[i]));

    int result = 0;
    int start = 0;
    for (int i = 0; i < 12; i++) {
      int end = digits.length - (12 - i) + 1;
      final range = digits.sublist(start, end);

      // FIXME try it with indexed and fold with custom max
      int maxDigit = range.reduce(max);
      int maxIdx = range.indexOf(maxDigit);

      result = result * 10 + maxDigit;

      // NOTE: maxIdx is relative to range and not to digits, so we have to add it
      start += maxIdx + 1;
    }

    sum += result;
  }
  print("Part 2: $sum");
}

void main() {
  var f = File("input");
  var lines = f.readAsLinesSync();

  part1(lines);
  part2(lines);
}
