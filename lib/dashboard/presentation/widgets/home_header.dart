import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';

/// HomeHeader widget that displays the date and notification icons.
/// Contains the avatar button that triggers the drawer.
class HomeHeader extends ConsumerWidget {
  final VoidCallback onAvatarTap;

  const HomeHeader({
    required this.onAvatarTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tues, Nov 12',
          style: theme.typographyRegular.bodyExtraSmall
              .copyWith(color: theme.darkGrey),
        ),
        Row(
          children: [
            const Icon(
              Icons.notifications_outlined,
              size: 25,
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onAvatarTap,
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
            )
          ],
        )
      ],
    );
  }
}
