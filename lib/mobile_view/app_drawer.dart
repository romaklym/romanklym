import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/theme/app_colors.dart';
import 'package:klymroman/theme/app_sizes.dart';
import 'package:klymroman/theme/app_strings.dart';
import 'package:klymroman/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: AppSizes.drawerWidth,
      backgroundColor: AppColors.brightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(
            AppSizes.small,
          ),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.mainBlueColor,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.borderColor,
                  width: AppSizes.styleBorderWidth,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.medium,
              horizontal: AppSizes.extraLarge,
            ),
            child: Center(
              child: const Text(
                AppStrings.menu,
                style: AppTextStyles.appDrawerHeader,
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.medium,
          ),
          // Drawer Items
          _buildCustomDrawerItem(
            svgPath: 'assets/images/dex.svg',
            label: AppStrings.dexScreener,
            onTap: () async {
              Navigator.of(context).pop();
              const url = AppStrings.dexScreenerLink;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              }
            },
            backgroundColor: AppColors.dexScreenerColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
          ),
          _buildCustomDrawerItem(
            svgPath: 'assets/images/dextools.svg',
            label: AppStrings.dexTools,
            onTap: () async {
              Navigator.of(context).pop();
              const url = AppStrings.dexToolsLink;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              }
            },
            backgroundColor: AppColors.dexToolsColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.reddit,
            label: AppStrings.reddit,
            onTap: () async {
              Navigator.of(context).pop();
              const url = AppStrings.redditLink;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              }
            },
            backgroundColor: AppColors.redditColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.twitter,
            label: AppStrings.xTwitter,
            onTap: () async {
              Navigator.of(context).pop();
              const url = AppStrings.xTwitterLink;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              }
            },
            backgroundColor: AppColors.xTwitterColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.telegram,
            label: AppStrings.telegram,
            onTap: () async {
              Navigator.of(context).pop();
              const url = AppStrings.telegramLink;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              }
            },
            backgroundColor: AppColors.telegramColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.discord,
            label: AppStrings.discord,
            backgroundColor: AppColors.discordColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColors.discordColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.small,
                    ),
                    side: const BorderSide(
                      color: AppColors.borderColor,
                      width: AppSizes.styleBorderWidth,
                    ),
                  ),
                  content: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      AppStrings.discordComingSoon,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.appDrawerTextStyle,
                    ),
                  ),
                ),
              );
            },
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.shieldHalved,
            label: AppStrings.footerDesktopPrivacy,
            backgroundColor: AppColors.privacyColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
            onTap: () {},
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.fileShield,
            label: AppStrings.footerDesktopTerms,
            backgroundColor: AppColors.termsColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
            onTap: () {},
          ),
          _buildCustomDrawerItem(
            icon: FontAwesomeIcons.briefcase,
            label: AppStrings.footerDesktopCareers,
            backgroundColor: AppColors.careersColor,
            textColor: AppColors.whiteText,
            borderColor: AppColors.borderColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _buildCustomDrawerItem({
  String? svgPath,
  IconData? icon,
  required String label,
  required VoidCallback onTap,
  Widget? trailing,
  Color backgroundColor = AppColors.mainBlueColor,
  Color borderColor = AppColors.borderColor,
  Color textColor = AppColors.whiteText,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.medium,
        horizontal: AppSizes.extraLarge,
      ),
      padding: const EdgeInsets.all(
        AppSizes.large,
      ),
      decoration: BoxDecoration(
        color: backgroundColor, // Use custom background color
        borderRadius: BorderRadius.circular(
          AppSizes.medium,
        ),
        border: Border.all(
          color: borderColor,
          width: AppSizes.styleBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: borderColor,
            offset: const Offset(
              AppSizes.styleBoxShadowFirst,
              AppSizes.styleBoxShadowSecond,
            ),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (svgPath != null)
                SvgPicture.asset(
                  svgPath,
                  width: AppSizes.iconSvgSize,
                  height: AppSizes.iconSvgSize,
                  colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                )
              else if (icon != null)
                FaIcon(
                  icon,
                  color: textColor,
                  size: AppSizes.iconSvgSize,
                ),
              const SizedBox(
                width: AppSizes.large,
              ),
              Text(
                label,
                style: AppTextStyles.appDrawerTextStyle,
              ),
            ],
          ),
          if (trailing != null) trailing,
        ],
      ),
    ),
  );
}
