import 'package:surf_dart_courses_template/raw_data.dart';
import 'package:surf_dart_courses_template/raw_product_item.dart';

// {
//   'Растительная пища': {
//     'Фрукты': ['Персик', 'Груша'],
//     'Овощи': ['Морковь'],
//     'Крупы': ['Гречка'],
//   },
//   'Молочные продукты': {
//     'Напитки': ['Молоко', 'Кефир'],
//     'Сыры': ['Гауда', 'Маасдам'],
//   },
//   'Мясо': {
//     'Птица': ['Курица'],
//     'Не птица': ['Свинина'],
//   },
// }
Map<String, Map<String, List<String>>> doSomething(List<RawProductItem> data) {
  final categories = data.map((e) => e.categoryName).toSet();

  final result = <String, Map<String, List<String>>>{};

  for (final category in categories) {
    final listByCategory =
        data.where((rawElement) => rawElement.categoryName == category).toList();


    // for (final subcategory in subcategories) {
    //   result.addAll(
    //     {
    //       category: {
    //         subcategory: [],
    //       },
    //     },
    //   );
    // }
  }
  return result;
}
