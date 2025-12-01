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

    if (dir == 'R') {
      current += step;
    } else {
      current -= step;
    }
    if (current < 0) {
      current += 100;
    }
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

    if (dir == 'R') {
      for (var i = 0; i < step; i++) {
        current++;
        if (current == 100) {
          sum++;
          current = 0;
        }
      }
    } else if (dir == 'L') {
      for (var i = 0; i < step; i++) {
        current--;
        if (current == -1) {
          current = 99;
        }
        if (current == 0) {
          sum++;
        }
      }
    } else {
      print("Invalid direction $dir");
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
