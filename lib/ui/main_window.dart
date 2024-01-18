import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_bombs/ui/game_screen.dart';

import '../theme/app_colors.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildIconButton(Icons.volume_down_sharp, () {
                // Handle volume down
              }),
              SizedBox(width: 5),
              _buildIconButton(Icons.settings, () {
                _navigateToScreen(context, const GameScreen());
              }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50,right: 100),
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
                      _buildButton('Start game', () {
                        _navigateToScreen(context, const GameScreen());
                      }),
                      SizedBox(height: 5),
                      _buildButton('Levels of difficulty', () {
                        _navigateToScreen(context, const LevelsScreen());
                      }),
                      SizedBox(height: 5),
                      _buildButton('Exit', () {
                        SystemNavigator.pop();
                      }),

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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accent,
            ),
            padding: const EdgeInsets.all(2),
            child: Icon(icon, color: AppColors.white,size: 30,),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 100,right: 100),
        child: Container(
          height: 49,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
