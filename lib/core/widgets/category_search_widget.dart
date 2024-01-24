import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';

class CategorySearchWidget extends StatelessWidget {
  const CategorySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        color: MColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: TextField(
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    'assets/icons/svg/search_icon.svg',
                  ),
                ),
                hintText: 'Поиск',
                hintStyle: MTextStyles.grayTextStyle,
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
