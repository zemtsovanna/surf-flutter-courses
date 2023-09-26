void main() {
  final dog = Gamer(
    name: 'Dog',
    gamesList: [
      Game(date: DateTime(2020), place: 1),
      Game(date: DateTime(2021), place: 1),
      Game(date: DateTime(2022), place: 4),
    ],
    technique: Technique.hyperTapping,
  );

  final chrisTang =
      Commentator(name: 'Chris Tang', favoritePhrase: 'Boom Tetris For [Name]');

  print(dog.aboutMe());
  print(chrisTang.aboutMe());
}

/// Максимально общая сущность.
abstract class Man {
  /// Имя.
  final String name;

  /// Конструктор.
  Man({
    required this.name,
  });
}

/// Разновидность: геймер.
class Gamer extends Man {
  /// Игры.
  final List<Game> gamesList;

  /// Техника.
  final Technique technique;

  /// Конструктор.
  Gamer({
    required super.name,
    required this.gamesList,
    required this.technique,
  });

  /// Метод вывода информации.
  String aboutMe() {
    return 'My name is $name. '
        'I played ${gamesList.length} games for now. '
        'My favorite technique is $technique. ';
  }
}

/// Информация об игре.
class Game {
  /// Год.
  final DateTime date;

  /// Занятое место.
  final int place;

  Game({
    required this.date,
    required this.place,
  });
}

/// Техники.
enum Technique {
  regular,
  hyperTapping,
  rolling;

  @override
  String toString() {
    switch (this) {
      case Technique.regular:
        return 'regular';
      case Technique.hyperTapping:
        return 'hyper tapping';
      case Technique.rolling:
        return 'rolling';
    }
  }
}

/// Разновидность: комментатор.
class Commentator extends Man {
  /// Стиль.
  final String favoritePhrase;

  /// Конструктор.
  Commentator({
    required super.name,
    required this.favoritePhrase,
  });

  /// Метод вывода информации.
  String aboutMe() {
    return 'My name is $name. '
        'I like to say $favoritePhrase. ';
  }
}
