import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme.dart';

class SmallButton extends ConsumerWidget {
  const SmallButton({
    super.key,
    required this.title,
    this.ontap,
  });

  final String title;
  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: theme.black, borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: theme.typographyRegular.bodyExtraSmall
              .copyWith(color: theme.white),
        ),
      ),
    );
  }
}
