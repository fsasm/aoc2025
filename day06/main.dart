import "dart:io";

void part1(List<String> lines) {
  int sum = 0;

  List<List<int>> numbers = <List<int>>[];

  for (final l in lines) {
    if (l.isEmpty) {
      break;
    }

    if (l.contains("*") || l.contains("+")) {
      final ops = l.split(" ").map((s) => s.trim()).where((s) => s.isNotEmpty);

      for (final (i, o) in ops.indexed) {
        int result = (o == "*") ? 1 : 0;
        for (final n in numbers) {
          if (o == "*") {
            result *= n[i];
          } else {
            result += n[i];
          }
        }
        sum += result;
      }
    } else {
      numbers.add(
        l
            .split(" ")
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .map(int.parse)
            .toList(),
      );
    }
  }

  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;

  print("Part 2: $sum");
}

void main() {
  var f = File("input");
  var lines = f.readAsLinesSync();

  part1(lines);
  part2(lines);
}
