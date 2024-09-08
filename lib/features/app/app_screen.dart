import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messager/core/utils/m_colors.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryBackgroudColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        showSelectedLabels: false,
        // selectedIconTheme: ,
        backgroundColor: MColors.bottomAppBarColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/0.svg'),
            label: '',
            backgroundColor: MColors.bottomAppBarColor,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/1.svg'),
            icon: SvgPicture.asset('assets/icons/1.svg'),
            label: '',
            backgroundColor: MColors.bottomAppBarColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/2.svg'),
            label: '',
            backgroundColor: MColors.bottomAppBarColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/3.svg'),
            label: '',
            backgroundColor: MColors.bottomAppBarColor,
          )
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Material(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: MColors.secondaryPrimaryColor),
                color: MColors.backgroundColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9))),
            height: MediaQuery.of(context).size.height / 1.4,
            child: Padding(
              padding: const EdgeInsets.only(top: 3, left: 2, right: 2),
              child: child,
            ),
          ),
        )
      ]),
    );
  }
}
