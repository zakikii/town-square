import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme.dart';

class WebSideNav extends ConsumerWidget {
  const WebSideNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Container(
      width: 250,
      color: theme.black,
      child: Column(
        children: [
          // Header with user info
          _buildHeader(),

          // Navigation items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildNavItem(Icons.person_outline, 'Profile'),
                _buildNavItem(Icons.map_outlined, 'Activities'),
                _buildNavItem(Icons.star_outline, 'Services'),
                _buildNavItem(Icons.people_outline, 'Communities'),
                _buildNavItem(Icons.notifications_outlined, 'Notifications'),
                _buildDivider(),
                _buildNavItem(Icons.add, 'Create'),
                _buildDivider(),
                _buildNavItem(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: theme.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
              const SizedBox(height: 12),
              Text(
                'John Doe',
                style:
                    theme.typographyBold.bodyLarge.copyWith(color: theme.white),
              ),
              Text(
                'john.doe@example.com',
                style: theme.typographyRegular.bodySmall
                    .copyWith(color: theme.primarySwatch),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, String title) {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return ListTile(
          dense: true,
          horizontalTitleGap: 8,
          leading: Icon(icon, color: theme.white, size: 20),
          title: Text(
            title,
            style:
                theme.typographyRegular.bodyMedium.copyWith(color: theme.white),
          ),
          onTap: () {},
          hoverColor: theme.white.withOpacity(0.1),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return Divider(color: theme.white.withOpacity(0.2));
      },
    );
  }
}
