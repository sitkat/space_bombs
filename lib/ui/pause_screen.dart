import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_bombs/ui/levels_screen.dart';
import 'package:space_bombs/ui/main_window.dart';
import 'package:space_bombs/ui/settings_screen.dart';

import '../theme/app_button.dart';
import '../theme/app_colors.dart';
import '../theme/app_icon_button.dart';

class PauseScreen extends StatelessWidget {
  const PauseScreen({super.key, required this.remainingTime});

  final Duration remainingTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, bottom: 20.0, top: 20),
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
                      Expanded(
                        child: Text(
                          'Pause',
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      AppButton(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Restart',
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Levels of difficulty',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LevelsScreen()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'To main',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainWindow()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Exit',
                        onPressed: () {
                          SystemNavigator.pop();
                        },
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
