import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:townsquare_by_alwanzaki/dashboard/presentation/widgets/right_content.dart';
import '../../../app/theme.dart';
import '../widgets/activity_list.dart';
import '../widgets/category_list.dart';
import '../widgets/dashboard_textfield.dart';
import '../widgets/home_header.dart';
import '../widgets/web_side_nav.dart';

/// Responsive web homepage that adapts to different screen sizes.
/// Shows three columns on desktop, two on tablet, and single column on mobile.
/// Key features:
/// * Navigation sidebar (permanent or drawer)
/// * Main content area with draggable header
/// * Right panel that moves below on smaller screens
class WebHomePage extends ConsumerStatefulWidget {
  const WebHomePage({super.key});

  @override
  ConsumerState<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends ConsumerState<WebHomePage> {
  /// Global key for controlling the Scaffold state and drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Builds the app bar title with branded text styling
  Widget _buildAppBarTitle() {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return RichText(
          text: TextSpan(
            style: theme.typographyBold.heading20,
            children: [
              TextSpan(
                text: 'TWN',
                style: TextStyle(color: theme.white),
              ),
              TextSpan(
                text: 'SQR',
                style: TextStyle(color: theme.primarySwatch),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    // Use LayoutBuilder for responsive design
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints for different screen sizes
        final isSmallScreen = constraints.maxWidth < 768;
        final isMediumScreen = constraints.maxWidth < 1024;

        // Render mobile/tablet layout
        if (isSmallScreen || isMediumScreen) {
          return Scaffold(
            key: _scaffoldKey,
            body: Row(
              children: [
                // Show sidebar on tablet
                if (!isSmallScreen) const WebSideNav(),
                // Main content
                Expanded(
                  child: DraggableHome(
                    actions: const [
                      Icon(Icons.notifications_outlined),
                      SizedBox(width: 16),
                    ],
                    curvedBodyRadius: 0,
                    headerExpandedHeight: 0.25,
                    backgroundColor: theme.white,
                    headerWidget: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).padding.top),
                          HomeHeader(
                            // Open drawer on avatar click for mobile
                            onAvatarTap: isSmallScreen
                                ? () => _scaffoldKey.currentState?.openDrawer()
                                : () {},
                          ),
                          Text(
                            'This Week in Jakarta',
                            style: theme.typographyBold.bodyLarge,
                          ),
                          const SizedBox(height: 25),
                          const DashboardTextfield(),
                        ],
                      ),
                    ),
                    centerTitle: true,
                    appBarColor: theme.black,
                    title: _buildAppBarTitle(),
                    body: [
                      const SizedBox(height: 10),
                      const CategoryList(),
                      const SizedBox(height: 10),
                      const ActivityList(),
                      const SizedBox(height: 20),
                      // Right content moved below for mobile/tablet
                      RightContent(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            // Show drawer navigation for mobile
            drawer: isSmallScreen ? const Drawer(child: WebSideNav()) : null,
          );
        }

        // Render desktop layout (three columns)
        return Scaffold(
          body: Row(
            children: [
              // Left navigation sidebar
              const WebSideNav(),
              // Main content area
              Expanded(
                child: DraggableHome(
                  actions: const [
                    Icon(Icons.notifications_outlined),
                    SizedBox(width: 16),
                  ],
                  curvedBodyRadius: 0,
                  headerExpandedHeight: 0.25,
                  backgroundColor: theme.white,
                  headerWidget: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        HomeHeader(onAvatarTap: () {}),
                        Text(
                          'This Week in Jakarta',
                          style: theme.typographyBold.bodyLarge,
                        ),
                        const SizedBox(height: 25),
                        const DashboardTextfield(),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  appBarColor: theme.black,
                  title: _buildAppBarTitle(),
                  body: const [
                    SizedBox(height: 10),
                    CategoryList(),
                    SizedBox(height: 10),
                    ActivityList(),
                  ],
                ),
              ),
              // Right panel
              Container(
                width: 280,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: theme.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: RightContent(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
