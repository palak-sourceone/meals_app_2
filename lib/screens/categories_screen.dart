import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app_2/data/dummy_data.dart';
import 'package:meals_app_2/models/category.dart';
import 'package:meals_app_2/notifier/category_notifier.dart';
import 'package:meals_app_2/screens/meals_screen.dart';
import 'package:meals_app_2/widgets/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late CategoryNotifier categoryNotifier;

  @override
  void dispose() {
    categoryNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    categoryNotifier = CategoryNotifier('');
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = categoryNotifier.onCategorySelect(category.id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryNotifier,
        builder: (context, value, child) {
          return GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              for (final category in availableCategories)
                CategoryCard(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context, category);
                  },
                )
            ],
          );
        });
  }
}
