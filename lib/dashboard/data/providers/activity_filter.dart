import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/activity.dart';
import '../../presentation/widgets/category_list.dart';

final filteredActivitiesProvider = Provider<List<Activity>>((ref) {
  final selectedIndex = ref.watch(selectedCategoryProvider);

  if (selectedIndex <= 1) {
    return activities;
  }

  final categoryMapping = {
    2: 'Sports', // Sports
    3: 'Food', // Food
    4: 'Kids', // Kids
    5: 'Creative' // Creative
  };

  final selectedCategory = categoryMapping[selectedIndex];
  if (selectedCategory == null) return activities;

  return activities
      .where((activity) =>
          activity.category.toLowerCase() == selectedCategory.toLowerCase())
      .toList();
});
