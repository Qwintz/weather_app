import 'package:flutter/material.dart';

import '../../utils/constants/ui_constants.dart';
import '../../utils/extensions/extensions.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
    // required this.image,
    required this.title,
    required this.subtitle,
  });

  // final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiConstants.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: SizedBox(
              width: context.media.size.width,
              child: const FlutterLogo(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: UiConstants.medium),
              Text(
                subtitle,
                style: context.theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
