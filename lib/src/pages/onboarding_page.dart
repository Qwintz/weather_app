import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/onboarding.dart';
import '../common/widgets/page_indicator.dart';
import '../di.dart';
import '../utils/constants/pages.dart';
import '../utils/extensions/extensions.dart';
import '../utils/helpers/storage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  int _selectedPage = 0;

  final _onboardings = const [
    Onboarding(
      // image: image,
      title: "Discover the weather\nin your city",
      subtitle:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    Onboarding(
      // image: image,
      title: "Discover the weather\nin your city",
      subtitle:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    Onboarding(
      // image: image,
      title: "Discover the weather\nin your city",
      subtitle:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PageIndicator(
          pageController: _pageController,
          count: _onboardings.length,
        ),
        actions: [
          TextButton(
            onPressed: _onComplete,
            child: Text(
              "Skip",
              style: context.theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _onboardings,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onNextPage,
        child: const Icon(Icons.arrow_right_alt_rounded),
      ),
    );
  }

  void _onNextPage() {
    if (_selectedPage < _onboardings.length - 1) {
      _pageController.animateToPage(
        _selectedPage + 1,
        duration: Durations.medium2,
        curve: Curves.easeOut,
      );
    } else {
      _onComplete();
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

  void _onComplete() {
    Di.get<Storage>().saveOnboardingFlag(true);
    context.goNamed(Pages.location);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
