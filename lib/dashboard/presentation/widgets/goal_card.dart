import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';
import 'small_button.dart';

/// GoalCard widget that displays user's progress towards their goal.
/// Includes a progress indicator and action buttons.
class GoalCard extends ConsumerWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primarySwatch,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're Close To your goal!",
                  style: theme.typographyBold.bodyMedium,
                ),
                Text(
                  'Join more sport activities to collect more points',
                  style: theme.typographyRegular.bodyExtraSmall,
                  softWrap: true,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    SmallButton(title: 'Join now'),
                    SizedBox(width: 15),
                    SmallButton(title: 'My Points')
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          _buildProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: CircularProgressIndicator(
                value: 0.85,
                backgroundColor: theme.white,
                valueColor: AlwaysStoppedAnimation<Color>(theme.colorIndicator),
                strokeWidth: 5,
              ),
            ),
            Text(
              '85',
              style: theme.typographyRegular.headingSmall,
            ),
          ],
        );
      },
    );
  }
}
