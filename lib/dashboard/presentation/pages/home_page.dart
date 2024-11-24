import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';
import '../widgets/activity_list.dart';
import '../widgets/category_list.dart';
import '../widgets/dashboard_textfield.dart';
import '../widgets/home_drawer.dart';
import '../widgets/goal_card.dart';
import '../widgets/home_header.dart';

/// HomePage widget that serves as the main dashboard of the application.
/// Implements a draggable layout with header, search functionality, and activity listings.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleDrawerOpen() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

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

  Widget _buildAppBarAvatar() {
    return GestureDetector(
      onTap: _handleDrawerOpen,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage('https://picsum.photos/200'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const HomeDrawer(),
      body: DraggableHome(
        actions: [_buildAppBarAvatar()],
        curvedBodyRadius: 0,
        headerExpandedHeight: 0.38,
        backgroundColor: theme.white,
        headerWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              HomeHeader(onAvatarTap: _handleDrawerOpen),
              Text(
                'This Week in Jakarta',
                style: theme.typographyBold.bodyLarge,
              ),
              const SizedBox(height: 20),
              const GoalCard(),
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
    );
  }
}
