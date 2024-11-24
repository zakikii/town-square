import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../app/theme.dart';
import 'card_label.dart';

class ActivityCard extends ConsumerWidget {
  const ActivityCard({
    super.key,
    required this.time,
    required this.duration,
    required this.title,
    required this.price,
    required this.location,
    required this.availability,
    required this.spots,
  });

  final String time;
  final String duration;
  final String title;
  final String price;
  final String location;
  final bool availability;
  final int spots;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    Color _getTimeColor(String time) {
      // Parse time string (assuming format like "9:00 AM" or "2:00 PM")
      final timeParts = time.split(' ');
      final hourMinute = timeParts[0].split(':');
      final period = timeParts[1].toUpperCase(); // AM or PM
      var hour = int.tryParse(hourMinute[0]) ?? 0;

      // Convert to 24-hour format for easier comparison
      if (period == 'PM' && hour < 12) {
        hour += 12;
      } else if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      if (hour >= 6 && hour <= 12) {
        return theme.green; // Morning (6 AM - 12 PM)
      } else if (hour > 12 && hour <= 18) {
        return theme.yellow; // Afternoon (12:01 PM - 6 PM)
      } else {
        return Colors.orange; // Evening/Night (6:01 PM - 5:59 AM)
      }
    }

    Color _getDurationColor(String duration) {
      // Convert duration string to number
      final durationValue = int.tryParse(duration) ?? 0;

      if (durationValue <= 30) {
        return theme.green; // Short duration
      } else if (durationValue <= 60) {
        return theme.yellow; // Medium duration
      } else {
        return Colors.orange; // Long duration
      }
    }

    final timeColor = _getTimeColor(time);
    final durationColor = _getDurationColor(duration);

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: theme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$time ',
                style: theme.typographyBold.heading14!.copyWith(
                  color: timeColor,
                ),
              ),
              Text(
                '($duration min)',
                style: theme.typographyBold.heading12!.copyWith(
                  color: durationColor,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.typographyBold.heading18,
              ),
              Text(
                '$price€',
                style: theme.typographyBold.heading18,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: theme.darkGrey,
                size: 20,
              ),
              Text(
                location,
                style: theme.typographyRegular.bodySmall
                    .copyWith(color: theme.darkGrey),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CardLabel(
                          icon: Icons.person_outline_rounded,
                          color: theme.darkGrey,
                          text: '$spots spots left',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CardLabel(
                          color: theme.yellow,
                          text: 'medium',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CardLabel(
                          color: theme.green,
                          text: 'childcare',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  QuickAlert.show(
                    confirmBtnTextStyle: theme.typographyBold.bodySmall
                        .copyWith(color: theme.white),
                    context: context,
                    type: availability
                        ? QuickAlertType.success
                        : QuickAlertType.error,
                    text: availability ? 'You are joined!' : 'Its Sold Out :(',
                    confirmBtnColor: availability ? theme.green : theme.black,
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                      color: availability ? theme.black : theme.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    availability ? 'Join' : 'Sold Out',
                    style: theme.typographyBold.bodyMedium.copyWith(
                        color: availability ? theme.white : theme.darkGrey),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
