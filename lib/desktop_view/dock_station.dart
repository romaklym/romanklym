import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klymroman/home_page.dart';
import 'package:klymroman/theme/app_colors.dart';
import 'package:klymroman/theme/app_sizes.dart';
import 'package:klymroman/theme/app_strings.dart';

class DockStation extends StatefulWidget {
  final double width;
  final double height;
  final double svgWidth;
  final double svgHeight;
  final double fontSize;
  final double iconSize;
  final double paddingVer;

  const DockStation({
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
  State<DockStation> createState() => _DockStationState();
}

class _DockStationState extends State<DockStation> {
  // void _openDialog(Widget dialog) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => dialog,
  //   );
  // }

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
                    builder: (_) => const HomePage(),
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
                borderColor: AppColors.dockBorderColor,
                onTap: () {},
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
                borderColor: AppColors.dockBorderColor,
                onTap: () {},
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
                iconColor:
                    AppColors.dockRoadmapColor, // Vibrant peach for roadmap
                textColor: AppColors.dockTextColor,
                borderColor: AppColors.dockBorderColor,
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
  double iconSize = AppSizes.dockItemIconSize,
  double fontSize = AppSizes.dockItemFontSize,
  double paddingHor = AppSizes.dockItemPaddingHorizontal,
  double paddingVer = AppSizes.dockItemPaddingVertical,
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
          borderRadius:
              BorderRadius.circular(AppSizes.styleRoundedEdgesCircular),
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
