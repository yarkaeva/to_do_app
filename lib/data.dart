import 'dart:math';

class Data {
  List<String> data = [
    'Пресс качат',
    'Бегит',
    'Турник',
    'Анжуманя',
    'Гантели',
  ];

  String getRandomElement() {
    final random = Random();
    var i = random.nextInt(data.length);
    return data[i];
  }
}
