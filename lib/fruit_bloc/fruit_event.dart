import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_sembast_db_tutorial/data/fruit.dart';

@immutable
abstract class FruitEvent extends Equatable {
  FruitEvent([List props = const []]) : super(props);
}

class LoadFruits extends FruitEvent {}

class AddRandomFruit extends FruitEvent {}

class UpdateWithRandomFruit extends FruitEvent {
  final Fruit updateFruit;

  UpdateWithRandomFruit(this.updateFruit) : super([updateFruit]);
}

class DeleteFruit extends FruitEvent {
  final Fruit fruit;

  DeleteFruit(this.fruit) : super([fruit]);
}
