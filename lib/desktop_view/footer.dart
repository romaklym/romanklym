import 'package:flutter/material.dart';
import 'package:klymroman/pages/careers_page.dart';
import 'package:klymroman/pages/privacy_policy_page.dart';
import 'package:klymroman/pages/tos_page.dart';
import 'package:klymroman/resusable_widgets/custom_button.dart';
import 'package:klymroman/theme/app_colors.dart';
import 'package:klymroman/theme/app_sizes.dart';
import 'package:klymroman/theme/app_strings.dart';
import 'package:klymroman/widgets/buy_token_widget.dart';
import 'package:klymroman/resusable_widgets/clock_widget.dart';
import 'package:klymroman/widgets/start_button.dart';

class Footer extends StatelessWidget {
  final VoidCallback onToggleDesktopWindow;
  final VoidCallback onToggleWelcomeWindow;
  final VoidCallback onToggleCountdownWindow;
  final VoidCallback onToggleStickyNote;
  final Map<String, bool> windowVisibility;

  const Footer({
    super.key,
    required this.onToggleDesktopWindow,
    required this.onToggleWelcomeWindow,
    required this.onToggleCountdownWindow,
    required this.onToggleStickyNote,
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const BuyTokenDialog(
                    initialUrl: AppStrings.startButtonLink,
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              CustomButton(
                label: AppStrings.footerDesktopMobile,
                onTap: onToggleDesktopWindow,
                windowKey: 'desktopWindow',
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
                label: AppStrings.footerDesktopCountdown,
                onTap: onToggleCountdownWindow,
                windowKey: 'countdownWindow',
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
                  label: AppStrings.footerDesktopPrivacy,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => const PrivacyPolicyDialog(),
                    );
                  },
                  activeColor: AppColors.footerActiveColor,
                  inactiveColor: AppColors.footerInactiveColor,
                  windowVisibility: windowVisibility,
                ),
                const SizedBox(
                  width: AppSizes.medium,
                ),
                CustomButton(
                  label: AppStrings.footerDesktopTerms,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => const TermsOfUseDialog(),
                    );
                  },
                  activeColor: AppColors.footerActiveColor,
                  inactiveColor: AppColors.footerInactiveColor,
                ),
                const SizedBox(
                  width: AppSizes.medium,
                ),
                CustomButton(
                  label: AppStrings.footerDesktopCareers,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => const CareersDialog(),
                    );
                  },
                  activeColor: AppColors.footerActiveColor,
                  inactiveColor: AppColors.footerInactiveColor,
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
