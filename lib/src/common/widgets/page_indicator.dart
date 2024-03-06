import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/ui_constants.dart';
import '../../utils/extensions/extensions.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.pageController,
    required this.count,
  });

  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: ExpandingDotsEffect(
        dotWidth: UiConstants.small,
        dotHeight: UiConstants.small,
        activeDotColor: context.theme.colorScheme.primary,
        dotColor: context.theme.colorScheme.surfaceVariant,
      ),
    );
  }
}
