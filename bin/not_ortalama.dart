import 'package:not_ortalama/not_ortalama.dart' as not_ortalama;
import 'dart:math';

void main(List<String> arguments) {
  // begin execution time benchmark
  final beginExec = DateTime.now();
  // create a pseudorandom number generator
  final prng = Random();

  // begin generation benchmark
  final beginGen = DateTime.now();
  // generate 10000 random numbers
  final notlar = List.generate(10000, (_) => prng.nextInt(101));
  // end generation benchmark
  final endGen = DateTime.now();

  // begin minimum fold benchmark
  final beginMinFold = DateTime.now();
  // calculate minimum with fold
  final min = notlar.fold(
      notlar[0],
      ((previousValue, element) =>
          previousValue < element ? previousValue : element)); // O(n)
  // end minimum fold benchmark
  final endMinFold = DateTime.now();

  // begin maximum fold benchmark
  final beginMaxFold = DateTime.now();
  // calculate maximum with fold
  final max = notlar.fold(
      notlar[0],
      ((previousValue, element) =>
          previousValue > element ? previousValue : element)); // O(n)
  // end maximum fold benchmark
  final endMaxFold = DateTime.now();

  // begin average fold benchmark
  final beginAvgFold = DateTime.now();
  // calculate average with fold
  final avg =
      notlar.fold(0, ((previousValue, element) => previousValue + element)) /
          notlar.length; // O(n + 1)
  // end average fold benchmark
  final endAvgFold = DateTime.now();

  // begin minimum loop benchmark
  final beginMinLoop = DateTime.now();

  // calculate minimum with for..in loop
  // set initial candidate to the first element in the list
  late var min2 = notlar[0];
  // for each item in the list...
  for (final i in notlar) {
    // ...if the current item is less than the current candidate...
    if (i < min2) {
      // ...this item is the new candidate.
      min2 = i;
    }
  }
  // end minimum loop benchmark
  final endMinLoop = DateTime.now();

  // begin maximum loop benchmark
  final beginMaxLoop = DateTime.now();

  // set initial candidate to the first element in the list
  late var max2 = notlar[0];
  // for each item in the list...
  for (final i in notlar) {
    // ...if the current item is greater than the current candidate...
    if (i > max2) {
      // ...this item is the new candidate.
      max2 = i;
    }
  }
  // end maximum loop benchmark
  final endMaxLoop = DateTime.now();

  // begin average loop benchmark
  final beginAvgLoop = DateTime.now();
  // the base value for sigma is 0
  late var avg2 = 0.0;
  // sum(notlar) = SIGMA(i in notlar, |notlar|, i)
  for (final i in notlar) {
    avg2 += i;
  }
  // mu(notlar) = sum(notlar)/|notlar|
  avg2 /= notlar.length;
  //end average loop benchmark
  final endAvgLoop = DateTime.now();

  // end execution time benchmark
  final endExec = DateTime.now();
  final benchmarks = {
    "Random number generation": "${endGen.difference(beginGen)}",
    "Minimum with fold": "${endMinFold.difference(beginMinFold)}",
    "Maximum with fold": "${endMaxFold.difference(beginMaxFold)}",
    "Average with fold": "${endAvgFold.difference(beginAvgFold)}",
    "Minimum with loop": "${endMinLoop.difference(beginMinLoop)}",
    "Maximum with loop": "${endMaxLoop.difference(beginMaxLoop)}",
    "Average with loop": "${endAvgLoop.difference(beginAvgLoop)}",
    "Total execution time": "${endExec.difference(beginExec)}"
  };

  final checks = {
    "fold average = loop average": avg == avg2,
    "fold minimum = loop minimum": min == min2,
    "fold maximum = loop maximum": max == max2
  };
  print("Notlar: $notlar");

  // notlar.forEach(print);

  print("Minimum: $min");
  print("Maksimum: $max");
  print("Ortalama: $avg");

  print("İstatistikler: $benchmarks");
  print("Kontroller: $checks");
}
