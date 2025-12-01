import "dart:io";

void part1(List<String> lines) {
  int sum = 0;

  var re = RegExp(r"(L|R)(\d+)");

  int current = 50;

  for (final l in lines) {
    final match = re.firstMatch(l);
    if (match == null) {
      continue;
    }

    final dir = match.group(1)!;
    final step = int.parse(match.group(2)!);

    current += (dir == 'R') ? step : -step;
    current %= 100;

    if (current == 0) {
      sum++;
    }
  }
  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;

  var re = RegExp(r"(L|R)(\d+)");

  int current = 50;

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
      current += (dir == 'R') ? 1 : -1;
      current %= 100;

      if (current == 0) {
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
