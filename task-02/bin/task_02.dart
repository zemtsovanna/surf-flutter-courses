void main() {}

enum Species { syrian, djungarian, campbell, roborovski }

class Hamster {
  final Species species;
  final String? name;
  int age;
  final String color;
  bool _isHungry = false;
  static const isAdorable = true;
  final CheekPouch cheekPouch;

  Hamster({
    this.name,
    required this.age,
    required this.color,
    required this.cheekPouch,
    required this.species,
  });

  Hamster.syrian({
    this.name,
    required this.age,
    required this.color,
    required this.cheekPouch,
  }) : species = Species.syrian;

  Hamster.djungarian({
    this.name,
    required this.age,
    required this.color,
    required this.cheekPouch,
  }) : species = Species.djungarian;

  Hamster.campbell({
    this.name,
    required this.age,
    required this.color,
    required this.cheekPouch,
  }) : species = Species.campbell;

  Hamster.roborovski({
    this.name,
    required this.age,
    required this.color,
    required this.cheekPouch,
  }) : species = Species.roborovski;

  void _runOnWheel() {
    print('Хомяк бежит в колесе');
    _isHungry = true;
  }

  void eatOrHoard() {
    if (_isHungry == true) {
      print('Хомяк ест');
      _isHungry = false;
    } else {
      print('Хомяк делает запасы');
    }
  }

  void _drink() {
    print('Хомяк пьет');
  }

  void _sleep() {
    print('Хомяк спит');
  }

  void _bath() {
    print('Хомяк купается в песке');
  }

  void move() {
    print('Хомяк изменил местоположение');
  }
}

class CheekPouch {
  final _foodContainer = [];
  bool get isEmpty => _foodContainer.isEmpty;

  void hoard(dynamic food) {
    _foodContainer.add(food);
    print('В щеки набран корм');
  }
}
