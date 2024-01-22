import 'package:flutter/material.dart';
import 'package:space_bombs/data/level_state.dart';
import 'package:space_bombs/theme/app_colors.dart';

class GameProvider{
  static AppGame getGameState(LevelState state) {
    switch (state) {
      case LevelState.easy:
        return AppGame.easyLevel;
      case LevelState.normal:
        return AppGame.normalLevel;
      case LevelState.hard:
        return AppGame.hardLevel;
    }
  }
}

class AppGame {
  static final AppGame easyLevel = AppGame(
    backgroundColor: AppColors.accent,
    text: 'Easy',
    numberOfBombs: 1,
    time: Duration(seconds: 60),
  );

  static final AppGame normalLevel = AppGame(
    backgroundColor: AppColors.normal,
    text: 'Normal',
    numberOfBombs: 2,
    time: Duration(seconds: 40),
  );

  static final AppGame hardLevel = AppGame(
    backgroundColor: AppColors.hard,
    text: 'Hard',
    numberOfBombs: 3,
    time: Duration(seconds: 30),
  );

  final Color backgroundColor;
  final String text;
  final int numberOfBombs;
  final Duration time;

  AppGame({
    required this.backgroundColor,
    required this.text,
    required this.numberOfBombs,
    required this.time,
  });
}
