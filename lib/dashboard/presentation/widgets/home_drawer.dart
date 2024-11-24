import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme.dart';

/// HomeDrawer widget that displays the navigation menu and user profile.
/// Uses a dark theme with custom styling for menu items.
class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    final drawerWidth = screenWidth > 600 ? 300.0 : screenWidth * 0.8;

    return Container(
      width: drawerWidth,
      color: theme.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          _buildMenuItem(Icons.person_outline, 'Profile'),
          _buildMenuItem(Icons.map_outlined, 'Activities'),
          _buildMenuItem(Icons.star_outline, 'Services'),
          _buildMenuItem(Icons.people_outline, 'Communities'),
          _buildMenuItem(Icons.notifications_outlined, 'Notifications'),
          _buildDivider(),
          _buildMenuItem(Icons.add, 'Create'),
          _buildDivider(),
          _buildMenuItem(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return DrawerHeader(
          decoration: BoxDecoration(color: theme.primarySwatch),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
              const SizedBox(height: 10),
              Text(
                'John Doe',
                style:
                    theme.typographyBold.bodyLarge.copyWith(color: theme.black),
              ),
              Text(
                'john.doe@example.com',
                style: theme.typographyRegular.bodySmall
                    .copyWith(color: theme.black),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return ListTile(
          dense: true,
          horizontalTitleGap: 0,
          leading: Icon(icon, color: theme.white, size: 20),
          title: Text(
            title,
            style:
                theme.typographyRegular.bodyMedium.copyWith(color: theme.white),
          ),
          onTap: () {},
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
