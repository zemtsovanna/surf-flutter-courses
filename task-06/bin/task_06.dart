main() {
  final products = parseArticles(articles);

  print(
    applyFilter(products, CategoryFilter('хлеб')),
  );

  print(
    applyFilter(products, PriceFilter(50)),
  );

  print(
    applyFilter(products, QuantityFilter(53)),
  );
}

abstract interface class Filter {
  bool apply(ProductModel product);
}

class CategoryFilter extends Filter {
  final String category;

  CategoryFilter(this.category);
  @override
  bool apply(ProductModel product) {
    return product.category != category;
  }
}

class PriceFilter extends Filter {
  final int price;

  PriceFilter(this.price);
  @override
  bool apply(ProductModel product) {
    return product.price > price;
  }
}

class QuantityFilter extends Filter {
  final int quantity;

  QuantityFilter(this.quantity);
  @override
  bool apply(ProductModel product) {
    return product.quantity >= quantity;
  }
}

List<ProductModel> applyFilter(List<ProductModel> products, Filter filter) {
  return [...products]..removeWhere((element) => filter.apply(element));
}

List<ProductModel> parseArticles(String articles) {
  final tempList = articles.split('\n');
  tempList.removeWhere((element) => element == '');

  final result = tempList.map((rawProduct) {
    final fields = rawProduct.split(',');
    return ProductModel(
      id: int.parse(fields[0]),
      category: fields[1],
      name: fields[2],
      price: int.parse(fields[3]),
      quantity: int.parse(fields[4]),
    );
  }).toList();

  return result;
}

/// Модель продукта.
class ProductModel {
  ///  Id.
  final int id;

  ///  Категория.
  final String category;

  ///  Наименование.
  final String name;

  ///  Цена.
  final int price;

  ///  Количество.
  final int quantity;

  @override
  String toString() {
    return '$id $category $name $price рублей $quantity шт';
  }

  ProductModel({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';
