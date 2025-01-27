import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/pages/about_page.dart';
import 'package:klymroman/pages/faq_page.dart';
import 'package:klymroman/pages/game_page.dart';
import 'package:klymroman/pages/how_to_buy.dart';
import 'package:klymroman/pages/roadmap_page.dart';
import 'package:klymroman/pages/tokenomics_page.dart';
import 'package:klymroman/theme/app_colors.dart';
import 'package:klymroman/theme/app_sizes.dart';
import 'package:klymroman/theme/app_strings.dart';

class DockStationMobile extends StatefulWidget {
  final double width;
  final double height;
  final double svgWidth;
  final double svgHeight;
  final double fontSize;
  final double iconSize;
  final double paddingVer;

  const DockStationMobile({
    super.key,
    this.width = AppSizes.dockItemWidth,
    this.height = AppSizes.dockItemHeight,
    this.svgWidth = AppSizes.dockItemSvgWidth,
    this.svgHeight = AppSizes.dockItemSvgHeight,
    this.fontSize = AppSizes.dockItemFontSize,
    this.iconSize = AppSizes.dockItemIconSize,
    this.paddingVer = AppSizes.dockItemPaddingVertical,
  });

  @override
  State<DockStationMobile> createState() => _DockStationMobileState();
}

class _DockStationMobileState extends State<DockStationMobile> {
  void _openDialog(Widget dialog) {
    showDialog(
      context: context,
      builder: (_) => dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDockItem(
                icon: Icons.shopping_cart,
                label: AppStrings.howTo,
                iconColor: AppColors.dockBuyColor,
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => const HowToBuyDialog(
                      widthFactor: AppSizes.dialogMobileWidth,
                      heightFactor: AppSizes.dialogMobileHeight,
                      fontSize: AppSizes.dockMobileFontSize,
                      iconSize: AppSizes.dockMobileIconSize,
                      titleBarHeight: AppSizes.dockMobileTitleBarHeight,
                      padding: AppSizes.dockMobilePadding,
                    ),
                  );
                },
                width: widget.width,
                height: widget.height,
                svgWidth: widget.svgWidth,
                svgHeight: widget.svgHeight,
                fontSize: widget.fontSize,
                iconSize: widget.iconSize,
              ),
              _buildDockItem(
                icon: Icons.gamepad,
                label: AppStrings.games,
                iconColor: AppColors.dockGamesColor,
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor, // Retro brown
                onTap: () => _openDialog(const GameDialog(
                  widthFactor: AppSizes.dialogMobileWidth,
                  heightFactor: AppSizes.dialogMobileHeight,
                  fontSize: AppSizes.dockMobileFontSize,
                  iconSize: AppSizes.dockMobileIconSize,
                  titleBarHeight: AppSizes.dockMobileTitleBarHeight,
                  padding: AppSizes.dockMobilePadding,
                )),
                width: widget.width,
                height: widget.height,
                svgWidth: widget.svgWidth,
                svgHeight: widget.svgHeight,
                fontSize: widget.fontSize,
                iconSize: widget.iconSize,
              ),
              _buildDockItem(
                icon: FontAwesomeIcons.coins,
                label: AppStrings.tokenomics,
                iconColor: AppColors.dockTokenomicsColor,
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor, // Retro brown
                onTap: () => _openDialog(const TokenomicsDialog(
                  widthFactor: AppSizes.dialogMobileWidth,
                  heightFactor: AppSizes.dialogMobileHeight,
                  fontSize: AppSizes.dockMobileFontSize,
                  iconSize: AppSizes.dockMobileIconSize,
                  titleBarHeight: AppSizes.dockMobileTitleBarHeight,
                  padding: AppSizes.dockMobilePadding,
                  paddingTitleBar: AppSizes.dockMobilePadding,
                  spacing: 0.0,
                  runSpacing: 0.0,
                  chartRadius: 60.0,
                  chartCenterSpaceRadius: 30.0,
                )),
                width: widget.width,
                height: widget.height,
                svgWidth: widget.svgWidth,
                svgHeight: widget.svgHeight,
                fontSize: widget.fontSize,
                iconSize: widget.iconSize,
              ),
              _buildDockItem(
                icon: FontAwesomeIcons.route,
                label: AppStrings.roadmap,
                iconColor: AppColors.dockRoadmapColor,
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor,
                onTap: () => _openDialog(const RoadmapDialog(
                  widthFactor: AppSizes.dialogMobileWidth,
                  heightFactor: AppSizes.dialogMobileHeight,
                  padding: AppSizes.dockMobilePadding,
                  fontSize: AppSizes.dockMobileFontSize,
                  iconSize: AppSizes.dockMobileIconSize,
                  titleBarHeight: AppSizes.dockMobileTitleBarHeight,
                  circleAvatarRadius: 20.0,
                  squareStepWidth: 160.0,
                  squareStepHeight: 160.0,
                )),
                width: widget.width,
                height: widget.height,
                svgWidth: widget.svgWidth,
                svgHeight: widget.svgHeight,
                fontSize: widget.fontSize,
                iconSize: widget.iconSize,
              ),
              _buildDockItem(
                icon: FontAwesomeIcons.circleInfo,
                label: AppStrings.about,
                iconColor: AppColors.dockAboutColor,
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor,
                onTap: () => _openDialog(const AboutUsDialog(
                  widthFactor: AppSizes.dialogMobileWidth,
                  heightFactor: AppSizes.dialogMobileHeight,
                  padding: AppSizes.dockItemPaddingHorizontal,
                  fontSize: AppSizes.dockMobileFontSize,
                  iconSize: AppSizes.dockMobileIconSize,
                  titleBarHeight: AppSizes.dockMobileTitleBarHeight,
                  containerWidth: 190,
                  containerHeight: 230,
                )),
                width: widget.width,
                height: widget.height,
                svgWidth: widget.svgWidth,
                svgHeight: widget.svgHeight,
                fontSize: widget.fontSize,
                iconSize: widget.iconSize,
              ),
              _buildDockItem(
                icon: FontAwesomeIcons.clipboardQuestion,
                label: AppStrings.faq,
                iconColor: AppColors.dockFaqColor,
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor,
                onTap: () => _openDialog(const FaqDialog(
                  widthFactor: AppSizes.dialogMobileWidth,
                  heightFactor: AppSizes.dialogMobileHeight,
                  padding: AppSizes.dockMobilePadding,
                  fontSize: AppSizes.dockMobileFontSize,
                  titleBarHeight: AppSizes.dockMobileTitleBarHeight,
                  iconSize: AppSizes.dockMobileIconSize,
                  cardElevation: 5.0,
                  cardBorderRadius: 10.0,
                  expansionTilePadding: 12.0,
                )),
                width: widget.width,
                height: widget.height,
                svgWidth: widget.svgWidth,
                svgHeight: widget.svgHeight,
                fontSize: widget.fontSize,
                iconSize: widget.iconSize,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildDockItem({
  String? svgPath,
  IconData? icon,
  required String label,
  required VoidCallback onTap,
  required Color iconColor,
  required Color borderColor,
  required Color textColor,
  double width = AppSizes.dockItemWidth,
  double height = AppSizes.dockItemHeight,
  double svgWidth = AppSizes.dockItemSvgWidth,
  double svgHeight = AppSizes.dockItemSvgHeight,
  double fontSize = AppSizes.dockItemFontSize,
  double iconSize = AppSizes.dockItemIconSize,
  double paddingVer = AppSizes.dockItemPaddingVertical,
  double paddingHor = AppSizes.dockItemPaddingHorizontal / 2,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: paddingHor,
      vertical: paddingVer,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSizes.small,
          ),
          color: iconColor,
          border: Border.all(
            color: borderColor,
            width: AppSizes.styleBorderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderColor,
              offset: const Offset(
                AppSizes.styleBoxShadowFirst,
                AppSizes.styleBoxShadowSecond,
              ),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgPath != null)
              SvgPicture.asset(
                svgPath,
                width: svgWidth,
                height: svgHeight,
                colorFilter: ColorFilter.mode(
                  textColor,
                  BlendMode.srcIn,
                ),
              )
            else if (icon != null)
              FaIcon(
                icon,
                color: textColor,
                size: iconSize,
              ),
            const SizedBox(
              height: AppSizes.small,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Audiowide",
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
