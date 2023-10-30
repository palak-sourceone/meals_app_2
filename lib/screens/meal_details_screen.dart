import 'package:flutter/material.dart';
import 'package:meals_app_2/models/meals.dart';
import 'package:meals_app_2/streamController/fav_stream.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = contro.toggleMealFavoriteStatus(
                    Event.increment, widget.meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded ? "Added to favorite" : "Removed"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(Icons.star_outline)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.meal.imageUrl,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Ingredients",
              style: TextStyle(color: Colors.amber),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final ingredient in widget.meal.ingredients) Text(ingredient),
            const Text(
              "Steps",
              style: TextStyle(color: Colors.amber),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final step in widget.meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
