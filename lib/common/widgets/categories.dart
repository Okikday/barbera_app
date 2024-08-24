//Categories
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Categories extends StatelessWidget {
  
  Categories({super.key});
  final List list = ["coloring", "haircut", "hairstyle", "makeup", "nails", "shampoo", "shaving", "spa", "eye"];
  final List<Color> colors = const [
    Color(0xFF1BAAA5),
    Color(0xFFFb2020),
    Color(0xFF542221),
    Color(0xFF8580B7),
    Color(0xFFFEC040),
    Color(0xFF3A6987),
    Color(0xFF87B9AC),
    Color(0xFF492C5E),
    Color(0xFFE47D7D)
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    return SizedBox(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.whiteSpaceVertical(24),
            Constants.wrapInPadding(
              left: 14,
               Text(
                "Categories",
                textAlign: TextAlign.start,
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.medium),
              ),
            ),
          Constants.whiteSpaceVertical(12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < list.length; i++)
                    CategoriesBox(
                      text: list[i],
                      color: colors[i],
                    ),
                ],
              ),
            ),
          
        ],
      ),
    );
  }
}

class CategoriesBox extends StatelessWidget {
  final String text;
  final Color? color;

  const CategoriesBox({
    super.key,
    this.text = "coloring",
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Constants.wrapInPadding(
    Column(
      children: [
          Constants.wrapInBox(
            size: 48,
            Constants.wrapInPadding(
                all: 8,
                SvgPicture.asset(
                  "assets/barbera/icons/barbera_$text.svg",
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
            color: color ?? Colors.black,
          ),
        Constants.whiteSpaceVertical(8),
        Text(
          text[0].toUpperCase() + text.substring(1), style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    ),
    all: 12,
  );
  }
}