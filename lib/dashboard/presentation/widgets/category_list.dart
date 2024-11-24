import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';
import '../../data/models/category.dart';

final selectedCategoryProvider = StateProvider<int>((ref) => 1);

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final selectedIndex = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isActive = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                ref.read(selectedCategoryProvider.notifier).state = index;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? theme.black : theme.white,
                  borderRadius: BorderRadius.circular(10),
                  border: isActive
                      ? null
                      : Border.all(color: theme.darkGrey.withOpacity(0.3)),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: theme.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 400),
                      style: TextStyle(
                        color: isActive ? theme.white : theme.black,
                      ),
                      child: Icon(
                        category.icon,
                        size: 20,
                        color: isActive ? theme.white : theme.black,
                      ),
                    ),
                    if (category.name != '') ...[
                      const SizedBox(width: 8),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: theme.typographyRegular.bodySmall.copyWith(
                          color: isActive ? theme.white : theme.black,
                        ),
                        child: Text(category.name),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
