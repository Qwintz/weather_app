import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/settings/cubit/settings_cubit.dart';
import '../utils/constants/enums.dart';
import '../utils/constants/ui_constants.dart';
import '../utils/extensions/extensions.dart';
import '../utils/helpers/ui_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings Page",
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ThemeToggler(),
            LanguageToggler(),
          ],
        ),
      ),
    );
  }
}

class ThemeToggler extends StatelessWidget {
  const ThemeToggler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsCubit, SettingsState, ThemeMode>(
      selector: (state) => state.uiSettings.themeMode,
      builder: (context, themeMode) {
        return ListTile(
          onTap: () => _onPressed(context, themeMode),
          title: Text(
            "Theme mode",
            style: context.theme.textTheme.titleMedium,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                UiUtils.getThemeName(themeMode),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: UiConstants.medium),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        );
      },
    );
  }

  void _onPressed(BuildContext context, ThemeMode themeMode) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeOptions(
          selected: themeMode,
        );
      },
    );
  }
}

class ThemeOptions extends StatelessWidget {
  const ThemeOptions({super.key, required this.selected});

  final ThemeMode selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: UiConstants.extraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.from(
          ThemeMode.values.map((themeMode) {
            return RadioListTile.adaptive(
              value: themeMode,
              groupValue: selected,
              onChanged: (themeMode) => _onChanged(context, themeMode!),
              title: Text(
                UiUtils.getThemeName(themeMode),
                style: context.theme.textTheme.titleMedium,
              ),
            );
          }),
        ),
      ),
    );
  }

  void _onChanged(BuildContext context, ThemeMode themeMode) {
    context
      ..read<SettingsCubit>().changeThemeMode(themeMode)
      ..pop();
  }
}

class LanguageToggler extends StatelessWidget {
  const LanguageToggler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsCubit, SettingsState, Language>(
      selector: (state) => state.uiSettings.language,
      builder: (context, language) {
        return ListTile(
          onTap: () => _onPressed(context, language),
          title: Text(
            "Language",
            style: context.theme.textTheme.titleMedium,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                UiUtils.getLanguageName(language),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: UiConstants.medium),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        );
      },
    );
  }

  void _onPressed(BuildContext context, Language language) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageOptions(
          selected: language,
        );
      },
    );
  }
}

class LanguageOptions extends StatelessWidget {
  const LanguageOptions({super.key, required this.selected});

  final Language selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: UiConstants.extraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.from(
          Language.values.map((language) {
            return RadioListTile.adaptive(
              value: language,
              groupValue: selected,
              onChanged: (themeMode) => _onChanged(context, language),
              title: Text(
                UiUtils.getLanguageName(language),
                style: context.theme.textTheme.titleMedium,
              ),
            );
          }),
        ),
      ),
    );
  }

  void _onChanged(BuildContext context, Language language) {
    context
      ..read<SettingsCubit>().changeLanguage(language)
      ..pop();
  }
}
