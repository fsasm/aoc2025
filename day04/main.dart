import "dart:io";

String getCell(List<String> field, int x, int y) {
  if (x < 0 || y < 0) {
    return ".";
  }
  if (x >= field[0].length || y >= field.length) {
    return ".";
  }
  return field[y][x];
}

bool canAccess(List<String> field, int x, int y) {
  int numRolls = 0;
  for (int dy = -1; dy <= 1; dy++) {
    for (int dx = -1; dx <= 1; dx++) {
      if (dx == 0 && dy == 0) {
        continue;
      }
      if (getCell(field, x + dx, y + dy) == "@") {
        numRolls++;
      }
    }
  }

  return numRolls < 4;
}

void part1(List<String> lines) {
  int sum = 0;

  for (int y = 0; y < lines.length; y++) {
    for (int x = 0; x < lines[0].length; x++) {
      if (getCell(lines, x, y) == ".") {
        continue;
      }

      if (canAccess(lines, x, y)) {
        sum++;
      }
    }
  }

  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;

  bool removed = false;
  do {
    removed = false;
    for (int y = 0; y < lines.length; y++) {
      for (int x = 0; x < lines[0].length; x++) {
        if (getCell(lines, x, y) == ".") {
          continue;
        }

        if (canAccess(lines, x, y)) {
          lines[y] = lines[y].replaceRange(x, x + 1, ".");
          sum++;
          removed = true;
        }
      }
    }
  } while (removed);

  print("Part 2: $sum");
}

void main() {
  var f = File("example");
  var lines = f.readAsLinesSync();

  part1(lines);
  part2(lines);
}
