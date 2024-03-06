import 'package:flutter/material.dart';

import '../utils/constants/ui_constants.dart';

const textTheme = TextTheme(
  headlineLarge: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 24.0,
    letterSpacing: .25,
    fontVariations: [
      FontVariation.weight(700),
    ],
  ),
  titleLarge: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 20.0,
    letterSpacing: .2,
    fontVariations: [
      FontVariation.weight(700),
    ],
  ),
  titleMedium: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 16.0,
    letterSpacing: .0,
    fontVariations: [
      FontVariation.weight(600),
    ],
  ),
  bodyLarge: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 16.0,
    fontVariations: [
      FontVariation.weight(400),
    ],
  ),
  bodyMedium: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 14.0,
    fontVariations: [
      FontVariation.weight(400),
    ],
  ),
  labelLarge: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 16.0,
    letterSpacing: .15,
    fontVariations: [
      FontVariation.weight(600),
    ],
  ),
  labelMedium: TextStyle(
    fontFamily: UiConstants.fontFamily,
    fontSize: 14.0,
    fontVariations: [
      FontVariation.weight(600),
    ],
  ),
);
