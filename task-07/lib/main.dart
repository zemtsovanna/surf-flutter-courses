import 'package:surf_dart_courses_template/raw_product_item.dart';

/// Вывод товаров.
///
/// Где [rawData] - исходный список продуктов,
/// [todayDate] - дата, когда мы проверяем просрочку,
/// [inStockOnly] - не выводить товары, которых нет в наличии.
///
/// Фильтрует товары и выводит их в формате:
/// ```dart
/// {
///   category: {
///     subcategory: [product.name, /*...*/,],
///     /*...*/,
///   },
///   /*...*/
/// }
/// ```
Map<String, Map<String, List<String>>> prepareData(
  List<RawProductItem> rawData, {
  required DateTime todayDate,
  required bool inStockOnly,
}) {
  final result = <String, Map<String, List<String>>>{};
  // Находим список всех доступных категорий.
  final categories = rawData.map((e) => e.categoryName).toSet();
  // Проходимся по каждой категории.
  for (final category in categories) {
    // Для каждой категории создаём пустую запись.
    result[category] = {};
    // Фильтруем продукты из категории.
    final productsByCategory =
        rawData.where((rawElement) => rawElement.categoryName == category);
    // Находим список всех доступных подкатегорий.
    final subcategories =
        productsByCategory.map((e) => e.subcategoryName).toSet();
    // Проходимся по каждой подкатегории.
    for (final subcategory in subcategories) {
      // Фильтруем продукты из текущей подкатегории.
      final productsBySubcategory = productsByCategory.where(
        (product) {
          final inStock = inStockOnly ? product.qty > 0 : true;
          final isExpired = product.expirationDate.millisecondsSinceEpoch <
              todayDate.millisecondsSinceEpoch;
          return product.subcategoryName == subcategory &&
              !isExpired &&
              inStock;
        },
      );
      // Если в подкатегории нет продуктов - пропускаем.
      if (productsBySubcategory.isEmpty) continue;
      // Заполняем ранее созданную запись для категории.
      result[category]![subcategory] =
          productsBySubcategory.map((e) => e.name).toList();
    }
    // Удаляем категории, для которых не нашлось наполнения.
    result.removeWhere((key, value) => value.isEmpty);
  }
  return result;
}
