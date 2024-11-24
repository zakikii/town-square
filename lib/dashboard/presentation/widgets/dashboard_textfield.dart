import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';

class DashboardTextfield extends ConsumerWidget {
  const DashboardTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: theme.cardShadow,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: theme.white,
          filled: true,
          isDense: true,
          suffixIcon: Icon(
            Icons.search,
            size: 25,
            color: theme.black,
          ),
          hintText: 'What do you feel like doing?',
          hintStyle: theme.typographyRegular.bodySmall
              .copyWith(color: theme.darkGrey.withOpacity(0.6)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: theme.white, // Warna border sama dengan background
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: theme.primarySwatch, // Warna border sama dengan background
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: theme.white, // Warna border sama dengan background
            ),
          ),
        ),
      ),
    );
  }
}
