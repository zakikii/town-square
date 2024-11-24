import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';

class CardLabel extends ConsumerWidget {
  const CardLabel({
    super.key,
    this.icon,
    required this.text,
    required this.color,
  });

  final IconData? icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(2)),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(width: 5),
          ],
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style:
                theme.typographyRegular.bodyExtraSmall.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
