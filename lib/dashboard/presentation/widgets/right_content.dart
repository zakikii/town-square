import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';
import 'goal_card.dart';

/// A widget that displays the right panel content including goal card and promotions.
/// This content appears either in the right column (desktop) or below (mobile/tablet)
class RightContent extends ConsumerWidget {
  const RightContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Goal tracking card
              const GoalCard(),
              const SizedBox(height: 20),

              // Workshop promotion section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: theme.yellow.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Weekly workshops for kids',
                      style: theme.typographyBold.bodyLarge,
                    ),
                    Text(
                      'Sign up for early access to weekly activities for your kids full of learning and fun',
                      style: theme.typographyRegular.bodyExtraSmall,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: theme.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Learn More',
                            style: theme.typographyRegular.bodyExtraSmall,
                          ),
                          const Icon(Icons.navigate_next)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Featured events section with background image
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://picsum.photos/seed/picsum/500/300'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular events near you!',
                        style: theme.typographyBold.bodyMedium.copyWith(
                          color: theme.white,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Check out our latest featured event',
                            style:
                                theme.typographyRegular.bodyExtraSmall.copyWith(
                              color: theme.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: theme.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'See More',
                                style: theme.typographyRegular.bodyExtraSmall,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
