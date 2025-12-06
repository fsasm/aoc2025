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

  List<List<String>> digits = <List<String>>[];
  String opLine = "";

  // go down every column and capture it in a list
  // This is like the transpose for a matrix but with the right-to-left quirk and
  // that some digits are empty space
  for (int i = 0; i < lines[0].length; i++) {
    List<String> d = <String>[];
    for (final l in lines) {
      if (l.contains("*") || l.contains("+")) {
        opLine = l;
        break;
      }

      if (l[i] == " ") {
        continue;
      }

      d.add(l[i]);
    }

    digits.add(d);
  }

  final ops = opLine
      .split(" ")
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();

  int digitIndex = digits.length - 1;
  for (final op in ops.reversed) {
    int result = (op == "*") ? 1 : 0;
    // use every column until we hit an empty column. The empty column gets skipped
    // after the loop, so that the next operation begins with a valid column.
    while (digitIndex >= 0 && digits[digitIndex].isNotEmpty) {
      int n = digits[digitIndex].map(int.parse).fold(0, (p, v) => 10 * p + v);
      if (op == "*") {
        result *= n;
      } else {
        result += n;
      }
      digitIndex--;
    }
    digitIndex--;
    sum += result;
  }

  print("Part 2: $sum");
}

void main() {
  var f = File("example");
  var lines = f.readAsLinesSync();

  part1(lines);
  part2(lines);
}
