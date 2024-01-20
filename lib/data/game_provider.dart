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
    numberOfBombs: 1,
    time: Duration(seconds: 60),
  );

  static final AppGame normalLevel = AppGame(
    backgroundColor: AppColors.normal,
    numberOfBombs: 2,
    time: Duration(seconds: 40),
  );

  static final AppGame hardLevel = AppGame(
    backgroundColor: const Color(0xffE7E7E8),
    numberOfBombs: 3,
    time: Duration(seconds: 30),
  );

  final Color backgroundColor;
  final int numberOfBombs;
  final Duration time;

  AppGame({
    required this.backgroundColor,
    required this.numberOfBombs,
    required this.time,
  });
}
