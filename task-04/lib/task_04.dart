class PokerPlayer {
  /// Список текущих карт в руке у игрока
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double _surenessInWin = 0;

  /// Вычислить шансы на выигрыш
  void calculateProbabilities({
    required List<String> cardOnDesk,
    required Strategy strategy,
  }) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

void main() {
  final opponent = PokerPlayer();

  /// Вычисляет вероятность выигрыши и выводит инсайдерскую информацию в консоль.
  fakeStrategy(cardOnDesk, currentHand) {
    // Выводим в консоль карты оппонента.
    print('opponent hand: $currentHand');

    // Вычисляем вероятность выигрыша оппонента.
    final length = currentHand.length;
    int matchCount = 0;
    currentHand.forEach((element) {
      if (cardOnDesk.contains(element)) matchCount++;
    });
    final surenessInWin = matchCount / length;

    // Выводим в консоль вероятность выигрыша.
    print('surenessInWin: $surenessInWin');

    // Возвращаем результат.
    return surenessInWin;
  }

  opponent.calculateProbabilities(
    cardOnDesk: ['Nine of diamonds', 'king of hearts'],
    strategy: fakeStrategy,
  );
}

/// Псевдоним для функции "Стратегия".
typedef Strategy = double Function(
  List<String> cardOnDesk,
  List<String> currentHand,
);
