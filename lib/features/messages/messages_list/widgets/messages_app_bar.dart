import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messager/core/utils/m_colors.dart';

class MessagesAppBar {
  static PreferredSize getAppBar({required String firstname, required String lastname, required BuildContext context, required int index}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        color: MColors.primaryBackgroudColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.left_chevron,
                            color: MColors.primaryTextColor,
                            size: 15,
                          )),
                      CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/profiles/$index.jpg')),
                    ],
                  ),
                  SvgPicture.asset('assets/icons/svg/other.svg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
