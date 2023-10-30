import 'package:flutter/material.dart';
import 'package:meals_app_2/models/meals.dart';
import 'package:meals_app_2/screens/meals_screen.dart';
import 'package:meals_app_2/streamController/fav_stream.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Meal>>(
        stream: contro.counterStream,
        initialData: contro.favoriteMeals,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Meal>> snapshot,
        ) {
          if (snapshot.hasData) {
            return MealsScreen(
              meals: contro.favoriteMeals,
            );
          } else {
            return Text(
              'Empty data',
              style: Theme.of(context).textTheme.headline4,
            );
          }
        },
      ),
    );
  }
}
