part of 'my_theme.dart';

class MyTypography {
  const MyTypography({
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.bodyExtraSmall,
    this.heading18,
    this.heading16,
    this.heading12,
    this.heading14,
    this.heading20,
  });

  final TextStyle headingLarge;

  final TextStyle headingMedium;

  final TextStyle headingSmall;

  final TextStyle bodyLarge;

  final TextStyle bodyMedium;

  final TextStyle bodySmall;

  final TextStyle bodyExtraSmall;

  final TextStyle? heading18;

  final TextStyle? heading16;

  final TextStyle? heading12;

  final TextStyle? heading14;

  final TextStyle? heading20;
}
