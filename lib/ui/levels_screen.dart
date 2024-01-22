import 'package:flutter/material.dart';
import 'package:space_bombs/data/level_state.dart';
import 'package:space_bombs/ui/game_screen.dart';
import 'package:space_bombs/ui/settings_screen.dart';

import '../theme/app_button.dart';
import '../theme/app_colors.dart';
import '../theme/app_icon_button.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/levels.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 20.0, top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_outlined,
                    iconWidth: 40,
                    iconHeight: 40,
                    iconSize: 20,
                  ),
                  Row(
                    children: [
                      AppIconButton(
                        onPressed: () {
                          //
                        },
                        icon: Icons.volume_down_sharp,
                      ),
                      SizedBox(width: 5),
                      AppIconButton(
                        onPressed: () {
                          _navigateToScreen(context, const SettingsScreen());
                        },
                        icon: Icons.settings,
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          'Levels of difficulty',
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      AppButton(
                        text: 'Easy',
                        onPressed: () {
                          _navigateToScreen(
                            context,
                            const GameScreen(state: LevelState.easy),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Normal',
                        onPressed: () {
                          _navigateToScreen(
                            context,
                            const GameScreen(state: LevelState.normal),
                          );
                        },
                        backgroundColor: AppColors.normal,
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Hard',
                        onPressed: () {
                          _navigateToScreen(
                            context,
                            const GameScreen(state: LevelState.hard),
                          );
                        },
                        backgroundColor: AppColors.hard,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
