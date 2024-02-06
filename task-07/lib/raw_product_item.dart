class RawProductItem {
  /// Название.
  final String name;

  /// Категория.
  final String categoryName;

  // Подкатегория.
  final String subcategoryName;

  /// Срок годности.
  final DateTime expirationDate;

  /// Количество в наличии.
  final int qty;

 const RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });
}
