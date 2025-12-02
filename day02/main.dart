import "dart:io";

void part1(List<String> lines) {
  int sum = 0;

  for (var l in lines[0].split(",")) {
    final pair = l.split("-");
    final start = int.parse(pair[0]);
    final end = int.parse(pair[1]);

    for (var i = start; i <= end; i++) {
      String n = i.toString();
      if (n.length.isOdd) {
        continue;
      }

      final upper = n.substring(0, n.length ~/ 2);
      final lower = n.substring(n.length ~/ 2);

      if (upper == lower) {
        sum += i;
      }
    }
  }

  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;
  for (var l in lines[0].split(",")) {
    final pair = l.split("-");
    final start = int.parse(pair[0]);
    final end = int.parse(pair[1]);

    for (var i = start; i <= end; i++) {
      String n = i.toString();
      for (var j = 1; j <= n.length ~/ 2; j++) {
        if (n.length % j != 0) {
          continue;
        }

        String repeated = n.substring(0, j) * (n.length ~/ j);
        if (n == repeated) {
          sum += i;
          break;
        }
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
