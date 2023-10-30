import 'dart:async';

import 'package:meals_app_2/models/meals.dart';

enum Event { increment, decrement }

final CounterController contro = CounterController();

class CounterController {
  int counter = 0;
  List<Meal> favoriteMeals = [];
  bool added = false;
  final StreamController<List<Meal>> _counterController =
      StreamController<List<Meal>>.broadcast();

  StreamSink<List<Meal>> get counterSink => _counterController.sink;
  Stream<List<Meal>> get counterStream => _counterController.stream;

  final StreamController<Event> _eventController =
      StreamController<Event>.broadcast();
  StreamSink<Event> get eventSink => _eventController.sink;
  Stream<Event> get eventStream => _eventController.stream;

  toggleMealFavoriteStatus(Event event, Meal meal) {
    _eventController.sink.add(event);
    return handleEvents(event, meal);
  }

  StreamSubscription? listener;
  bool handleEvents(Event event, Meal meal) {
    listener = eventStream.listen(
      (Event event) {
        switch (event) {
          case Event.increment:
            final mealIsFavorite = favoriteMeals.contains(meal);
            if (mealIsFavorite) {
              favoriteMeals =
                  favoriteMeals.where((m) => m.id != meal.id).toList();
              print("data: $favoriteMeals");
              added = false;
            } else {
              favoriteMeals = [...favoriteMeals, meal];
              print("data111: $favoriteMeals");
              added = true;
            }

            break;
          default:
        }
        counterSink.add(favoriteMeals);
      },
    );
    return added;
  }

  // dispose the listner to eliminate memory leak
  dispose() {
    listener?.cancel();
    _counterController.close();
    _eventController.close();
  }
}
