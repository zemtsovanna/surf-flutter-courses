import 'package:surf_dart_courses_template/main.dart';
import 'package:surf_dart_courses_template/raw_data.dart';

void main() {
  final result = prepareData(
    data,
    todayDate: DateTime(2022, 12, 23),
    inStockOnly: false,
  );

  // Выводим результат для проверки.
  result.forEach((cat, subs) {
    print('$cat: $subs');
  });
}
