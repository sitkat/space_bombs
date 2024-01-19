import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_bombs/theme/app_button.dart';
import 'package:space_bombs/ui/game_screen.dart';
import 'package:space_bombs/ui/settings_screen.dart';

import '../theme/app_colors.dart';
import '../theme/app_icon_button.dart';
import 'levels_screen.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mainWindow.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Space bombs',
                        style: TextStyle(
                          fontSize: 48,
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              color: AppColors.accent,
                              offset: Offset(0, 4),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      AppButton(
                        text: 'Start game',
                        onPressed: () {
                          _navigateToScreen(
                            context,
                            const GameScreen(),
                          );
                        },
                        radius: 16.0,
                      ),
                      SizedBox(height: 5),
                      AppButton(
                        text: 'Levels of difficulty',
                        onPressed: () {
                          _navigateToScreen(
                            context,
                            const LevelsScreen(),
                          );
                        },
                        radius: 16.0,
                      ),
                      SizedBox(height: 5),
                      AppButton(
                        text: 'Exit',
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        radius: 16.0,
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
