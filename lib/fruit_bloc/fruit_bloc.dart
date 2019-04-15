import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:flutter_sembast_db_tutorial/data/fruit.dart';
import 'package:flutter_sembast_db_tutorial/data/fruit_dao.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  FruitDao _fruitDao = FruitDao();

  @override
  FruitState get initialState => FruitsLoading();

  @override
  Stream<FruitState> mapEventToState(
    FruitEvent event,
  ) async* {
    if (event is LoadFruits) {
      yield FruitsLoading();
      yield* _reloadFruits();
    } else if (event is AddRandomFruit) {
      await _fruitDao.insert(RandomFruitGenerator.getRandomFruit());
      yield* _reloadFruits();
    } else if (event is UpdateWithRandomFruit) {
      final newFruit = RandomFruitGenerator.getRandomFruit();

      newFruit.id = event.updateFruit.id;

      await _fruitDao.update(newFruit);
      yield* _reloadFruits();
    } else if (event is DeleteFruit) {
      await _fruitDao.delete(event.fruit);
      yield* _reloadFruits();
    }
  }

  Stream<FruitState> _reloadFruits() async* {
    final fruits = await _fruitDao.getAllSortedByName();

    yield FruitsLoaded(fruits);
  }
}

class RandomFruitGenerator {
  static final _fruits = [
    Fruit(name: 'Banana', isSweet: true),
    Fruit(name: 'Strawberry', isSweet: true),
    Fruit(name: 'Kiwi', isSweet: false),
    Fruit(name: 'Apple', isSweet: true),
    Fruit(name: 'Pear', isSweet: true),
    Fruit(name: 'Lemon', isSweet: false),
  ];

  static Fruit getRandomFruit() {
    return _fruits[Random().nextInt(_fruits.length)];
  }
}
