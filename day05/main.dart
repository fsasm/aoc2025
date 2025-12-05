import "dart:io";
import "dart:math";

class Range {
  final int start;
  final int end;

  Range(this.start, this.end);
  bool contains(int i) {
    return this.start <= i && i <= this.end;
  }

  bool canMerge(Range other) {
    return contains(other.start) ||
        contains(other.end) ||
        other.contains(this.start) ||
        other.contains(this.end);
  }

  Range merge(Range other) {
    return Range(min(this.start, other.start), max(this.end, other.end));
  }

  int length() {
    return this.end - this.start + 1;
  }

  String toString() {
    return "($start - $end)";
  }
}

void part1(List<String> lines) {
  int sum = 0;

  List<Range> ranges = <Range>[];

  bool rangeParsing = true;
  for (final l in lines) {
    if (l.isEmpty) {
      rangeParsing = false;
      continue;
    }

    if (rangeParsing) {
      final parts = l.split("-");
      ranges.add(Range(int.parse(parts[0]), int.parse(parts[1])));
    } else {
      int id = int.parse(l);
      for (final r in ranges) {
        if (r.contains(id)) {
          sum++;
          break;
        }
      }
    }
  }

  print("Part 1: $sum");
}

void part2(List<String> lines) {
  int sum = 0;

  List<Range> ranges = <Range>[];

  for (final l in lines) {
    if (l.isEmpty) {
      break;
    }

    final parts = l.split("-");
    ranges.add(Range(int.parse(parts[0]), int.parse(parts[1])));
  }

  // Merge ranges that overlap. Do this until nothing changes.
  // FIXME: Pretty shure there is a better data structure for this. Maybe a
  // partition tree of ranges
  bool changed = false;
  do {
    changed = false;
    List<Range> newRanges = <Range>[];

    for (final r in ranges) {
      bool merged = false;

      for (int i = 0; i < newRanges.length; i++) {
        if (newRanges[i].canMerge(r)) {
          newRanges[i] = newRanges[i].merge(r);
          merged = true;
          break;
        }
      }

      changed |= merged;

      if (!merged) {
        newRanges.add(r);
      }
    }

    ranges = newRanges;
  } while (changed);

  for (final r in ranges) {
    sum += r.length();
  }

  print("Part 2: $sum");
}

void main() {
  var f = File("input");
  var lines = f.readAsLinesSync();

  part1(lines);
  part2(lines);
}
