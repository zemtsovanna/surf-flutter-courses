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

  /// Это часть первого задания. [Strategy] пока не сущестивует.
  ///
  /// Опишите его.
  final Strategy fakeStrategy = (cardOnDesk, currentHand) {
    /// Ваш код - здесь
    throw UnimplementedError();
  };

  opponent.calculateProbabilities(
    cardOnDesk: ['Nine of diamonds', 'king of hearts'],
    strategy: fakeStrategy,
  );
}

typedef Strategy = double Function(List<String>, List<String>);
