import 'package:flutter/material.dart';
import 'package:space_bombs/theme/app_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_button.dart';
import '../theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.surface,
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
                          'Settings',
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      AppButton(
                        text: 'Share with friends',
                        onPressed: () async {
                          final Uri url = Uri.parse('https://google.com');
                          await launchUrl(url);
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Privacy Policy',
                        onPressed: () async {
                          final Uri url = Uri.parse('https://google.com');
                          await launchUrl(url);
                        },
                      ),
                      SizedBox(height: 10),
                      AppButton(
                        text: 'Terms of use',
                        onPressed: () async {
                          final Uri url = Uri.parse('https://google.com');
                          await launchUrl(url);
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
}
