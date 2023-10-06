import 'dart:math';

void main(List<String> args) {
  final prng = Random();
  final numbers = List.generate(10000, (_) => prng.nextInt(101));
  var dist = <int, int>{};

  for (final i in numbers) {
    if (!dist.containsKey(i)) {
      dist[i] = 1;
    } else {
      dist[i] = dist[i]! + 1;
    }
  }
  dist.forEach((number, count) {
    print("$number: $count tane");
  });
}
// d: K -> V
// d^(-1): V -> [K]