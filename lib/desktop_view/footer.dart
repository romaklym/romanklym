import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/resusable_widgets/custom_button.dart';
import 'package:klymroman/theme/app_colors.dart';
import 'package:klymroman/theme/app_sizes.dart';
import 'package:klymroman/theme/app_strings.dart';
import 'package:klymroman/resusable_widgets/clock_widget.dart';
import 'package:klymroman/widgets/start_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final VoidCallback onToggleWelcomeWindow;
  final VoidCallback onToggleUbisoft;
  final VoidCallback onToggleVokiGames;
  final VoidCallback onToggleLionbridge;
  final VoidCallback onToggleStickyNote;
  final VoidCallback onToggleLocation;
  final Map<String, bool> windowVisibility;

  const Footer({
    super.key,
    required this.onToggleWelcomeWindow,
    required this.onToggleUbisoft,
    required this.onToggleVokiGames,
    required this.onToggleLionbridge,
    required this.onToggleStickyNote,
    required this.onToggleLocation,
    required this.windowVisibility,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.medium,
        vertical: AppSizes.medium,
      ),
      decoration: const BoxDecoration(
        color: AppColors.footerColor,
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: AppSizes.styleDividerWidth,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.medium,
            ),
            child: StartButton(
              onTap: () {},
            ),
          ),
          Row(
            children: [
              CustomButton(
                svgPath: 'assets/images/ubisoft.svg',
                iconSize: 18.0,
                onTap: onToggleUbisoft,
                windowKey: 'ubisoft',
                windowVisibility: windowVisibility,
                activeColor: AppColors.footerActiveColor,
                inactiveColor: AppColors.footerInactiveColor,
              ),
              const SizedBox(
                width: AppSizes.medium,
              ),
              CustomButton(
                svgPath: 'assets/images/playrix.svg',
                iconSize: 18.0,
                onTap: onToggleVokiGames,
                windowKey: 'vokiGames',
                windowVisibility: windowVisibility,
                activeColor: AppColors.footerActiveColor,
                inactiveColor: AppColors.footerInactiveColor,
              ),
              const SizedBox(
                width: AppSizes.medium,
              ),
              CustomButton(
                svgPath: 'assets/images/lionbridge.svg',
                iconSize: 14.0,
                onTap: onToggleLionbridge,
                windowKey: 'lionbridge',
                windowVisibility: windowVisibility,
                activeColor: AppColors.footerActiveColor,
                inactiveColor: AppColors.footerInactiveColor,
              ),
              const SizedBox(
                width: AppSizes.medium,
              ),
              CustomButton(
                label: AppStrings.footerDesktopWelcome,
                onTap: onToggleWelcomeWindow,
                windowKey: 'welcomeWindow',
                windowVisibility: windowVisibility,
                activeColor: AppColors.footerActiveColor,
                inactiveColor: AppColors.footerInactiveColor,
              ),
              const SizedBox(
                width: AppSizes.medium,
              ),
              CustomButton(
                label: AppStrings.footerDesktopSticky,
                onTap: onToggleStickyNote,
                windowKey: 'stickyNote',
                windowVisibility: windowVisibility,
                activeColor: AppColors.footerActiveColor,
                inactiveColor: AppColors.footerStickyInactiveColor,
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.medium,
            ),
            child: Row(
              children: [
                CustomButton(
                  icon: FontAwesomeIcons.linkedin,
                  label: "LinkedIn",
                  onTap: () async {
                    const url = 'https://www.linkedin.com/in/klymroman/';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  activeColor: AppColors.footerActiveColor,
                  inactiveColor: AppColors.footerInactiveColor,
                  windowVisibility: windowVisibility,
                ),
                const SizedBox(
                  width: AppSizes.medium,
                ),
                CustomButton(
                  icon: FontAwesomeIcons.github,
                  label: "GitHub",
                  onTap: () async {
                    const url = 'https://github.com/romaklym';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  activeColor: AppColors.footerActiveColor,
                  inactiveColor: AppColors.footerInactiveColor,
                  windowVisibility: windowVisibility,
                ),
                const SizedBox(
                  width: AppSizes.medium,
                ),
                CustomButton(
                  icon: FontAwesomeIcons.locationDot,
                  iconSize: 18.0,
                  label: "Location",
                  onTap: onToggleLocation,
                  windowKey: 'location',
                  windowVisibility: windowVisibility,
                  activeColor: AppColors.footerActiveColor,
                  inactiveColor: const Color(0xFF7BBBA0),
                ),
                const SizedBox(
                  width: AppSizes.medium,
                ),
                const ClockWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
