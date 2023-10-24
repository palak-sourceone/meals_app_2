import 'package:flutter/material.dart';
import 'package:meals_app_2/data/dummy_data.dart';

class CategoryNotifier extends ValueNotifier<String> {
  CategoryNotifier(String value) : super(value);

  onCategorySelect(String categoryId) {
    value = categoryId;
    return dummyMeals
        .where(
          (element) => element.categories.contains(categoryId),
        )
        .toList();
  }
}
