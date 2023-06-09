main() {
  // Получаем список мап до 2010.
  final territoriesBefore2010 =
      mapBefore2010.values.expand((element) => element);
  final machineriesBefore2010 =
      territoriesBefore2010.expand((element) => element.machineries).toList();
  print(machineriesBefore2010);

  // Получаем список мап после 2010.
  final territoriesAfter2010 = mapAfter2010.values.expand((element) => element);
  final machineriesAfter2010 =
      territoriesAfter2010.expand((element) => element.machineries).toList();
  print(machineriesAfter2010);

  // Объединяем списки.
  final allMachineries = machineriesAfter2010 + machineriesBefore2010;

  // Удаляем повторяющуюся технику.
  final notRepeatingMachineries = allMachineries.toSet();

  // Выносим в список возраст техники.
  final ages = notRepeatingMachineries.map((e) {
    final thisYear = DateTime.now().year;
    final releaseDate = e.releaseDate.year;
    final ageOfMachinery = thisYear - releaseDate;
    return ageOfMachinery;
  });
  print(ages);

  // Сортируем [allMachineries]. Выписываем в отдельную переменную.
  final agesToList = ages.toList();
  agesToList.sort();
  print(agesToList);

  // Находим средний возраст всей техники.
  double sum = 0;
  ages.forEach((element) {
    sum = sum += element;
  });
  final averageAge = sum / agesToList.length;
  print(averageAge);

  // Находим средний возраст старшей половины машин.
  final last = agesToList.length;
  final middle = last ~/ 2;

  final olderAgeToList = agesToList.getRange((middle), agesToList.length);
  print(olderAgeToList);
  double olderSum = 0;
  olderAgeToList.forEach((element) {
    olderSum = olderSum += element;
  });
  final averageOlderAge = olderSum / olderAgeToList.length;
  print(averageOlderAge);
}

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};
