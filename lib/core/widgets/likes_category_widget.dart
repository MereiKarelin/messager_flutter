import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';

class LikesCategoryWidget extends StatelessWidget {
  const LikesCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: MColors.greenColor,
                        borderRadius: BorderRadius.circular(66),
                      ),
                      child: const Center(
                          child: Icon(
                        CupertinoIcons.heart_fill,
                        color: MColors.purpleColor,
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "44 человека тебя лайкнули",
                          style: MTextStyles.primaryTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
