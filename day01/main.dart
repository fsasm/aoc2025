import "dart:io";

void part1(List<String> lines) {
  int sum = 0;

  var re = RegExp(r"(L|R)(\d+)");

  int dial = 50;

  for (final l in lines) {
    final match = re.firstMatch(l);
    if (match == null) {
      continue;
    }

    final dir = match.group(1)!;
    final step = int.parse(match.group(2)!);

    dial += (dir == 'R') ? step : -step;
    dial %= 100;

    if (dial == 0) {
      sum++;
    }
  }
  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;

  var re = RegExp(r"(L|R)(\d+)");

  int dial = 50;

  for (final l in lines) {
    final match = re.firstMatch(l);
    if (match == null) {
      continue;
    }

    final dir = match.group(1)!;
    final step = int.parse(match.group(2)!);

    // inefficent but gives correct result
    // it would be better to use no loop and instead divisions and modulo,
    // when trying there was problem with negative numbers (maybe off-by-1 problem)
    for (int i = 0; i < step; i++) {
      dial += (dir == 'R') ? 1 : -1;
      dial %= 100;

      if (dial == 0) {
        sum++;
      }
    }
  }
  print("Part 2: $sum");
}

void main() {
  var f = File("input");
  var lines = f.readAsLinesSync();

  part1(lines);
  part2(lines);
}
