import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/theme.dart';
import '../../data/providers/activity_filter.dart';
import 'activity_card.dart';
import 'category_list.dart';
import 'small_button.dart';

class ActivityList extends ConsumerWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredActivities = ref.watch(filteredActivitiesProvider);
    final theme = ref.watch(themeProvider);

    // error empty handling with animation
    if (filteredActivities.isEmpty) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Column(
          key: const ValueKey('empty-state'),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: 1.0,
              child: SvgPicture.asset(
                'assets/icons/empty.svg',
                width: 100,
                color: theme.black,
              ),
            ),
            const SizedBox(height: 15),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: 1.0,
              child: Text(
                'Activity datas not found',
                style: theme.typographyRegular.bodySmall,
              ),
            ),
            const SizedBox(height: 10),
            SmallButton(
              title: 'back to all',
              ontap: () =>
                  ref.read(selectedCategoryProvider.notifier).state = 1,
            )
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 30,
            bottom: 0,
            child: CustomPaint(
              size: const Size(1, double.infinity),
              painter: DottedLinePainter(
                color: theme.darkGrey.withOpacity(0.5),
              ),
            ),
          ),
          Column(
            children: [
              // Animated header
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: 1.0,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 500),
                              tween: Tween(begin: 0.0, end: 1.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: theme.darkGrey.withOpacity(0.5),
                                        width: 2,
                                      ),
                                      color: theme.colorIndicator,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Text(
                              'Today / ',
                              style: theme.typographyBold.bodyMedium,
                            ),
                            Text(
                              'tuesday',
                              style: theme.typographyBold.bodySmall
                                  .copyWith(color: theme.darkGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Animated list
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.05, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: ListView.separated(
                  key: ValueKey(filteredActivities.length),
                  padding: const EdgeInsets.only(top: 15),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredActivities.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final activity = filteredActivities[index];
                    final isLastItem = index == filteredActivities.length - 1;

                    return AnimatedBuilder(
                      animation: TweenSequence<double>([
                        TweenSequenceItem(
                          tween: Tween(begin: 0.0, end: 1.0),
                          weight: 1,
                        ),
                      ]).animate(CurvedAnimation(
                        parent: ModalRoute.of(context)!.animation!,
                        curve: Interval(
                          index * 0.1,
                          (index + 1) * 0.1,
                          curve: Curves.easeOut,
                        ),
                      )),
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: TweenSequence<double>([
                            TweenSequenceItem(
                              tween: Tween(begin: 0.0, end: 1.0),
                              weight: 1,
                            ),
                          ]).animate(CurvedAnimation(
                            parent: ModalRoute.of(context)!.animation!,
                            curve: Interval(
                              index * 0.1,
                              (index + 1) * 0.1,
                              curve: Curves.easeOut,
                            ),
                          )),
                          child: child,
                        );
                      },
                      child: isLastItem
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Hero(
                                    tag: 'activity-${activity.title}',
                                    child: ActivityCard(
                                      time: activity.time,
                                      duration: activity.duration,
                                      title: activity.title,
                                      price: activity.price,
                                      location: activity.location,
                                      availability: activity.available,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: const EdgeInsets.only(left: 0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                              theme.darkGrey.withOpacity(0.5),
                                          width: 2,
                                        ),
                                        color: theme.colorIndicator,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Hero(
                                tag: 'activity-${activity.title}',
                                child: ActivityCard(
                                  time: activity.time,
                                  duration: activity.duration,
                                  title: activity.title,
                                  price: activity.price,
                                  location: activity.location,
                                  availability: activity.available,
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 3;
    const dashSpace = 3;
    double startY = 0;
    final maxY = size.height;

    while (startY < maxY) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) => false;
}
