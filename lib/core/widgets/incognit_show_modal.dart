import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';

class Incognit {
  static Future<void> showBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => Scaffold(
              backgroundColor: MColors.blueColor,
              body: Container(
                color: MColors.blueColor,
                height: MediaQuery.of(context).size.height / 1.6,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(),
                            SvgPicture.asset(
                              'assets/icons/big_glasses.svg',
                              height: 68,
                              width: 174,
                            ),
                            InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Text(
                                  'x',
                                  style: TextStyle(fontSize: 18, color: MColors.grayTextColor, fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Режим '.toUpperCase(),
                            style: MTextStyles.secondaryBoldTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'инкогнито'.toUpperCase(),
                                style: MTextStyles.secondaryBoldTextStyle.copyWith(fontStyle: FontStyle.italic), // курсивный стиль
                              ),
                              TextSpan(
                                text: ' на 24 часа'.toUpperCase(),
                                style: MTextStyles.secondaryBoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся <Space> незамеченным',
                          style: MTextStyles.secondGrayTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 3.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width / 4.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                  decoration: BoxDecoration(
                                      color: MColors.backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: const Color.fromARGB(71, 141, 141, 141))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '1',
                                            style: MTextStyles.secondaryBoldTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/svg/glasses.svg',
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        '99 ₽',
                                        style: MTextStyles.secondaryBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 3.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width / 4.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                  decoration: BoxDecoration(
                                      color: MColors.backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: const Color.fromARGB(71, 141, 141, 141))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '3',
                                            style: MTextStyles.secondaryBoldTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/svg/glasses.svg',
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        '199 ₽',
                                        style: MTextStyles.secondaryBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 3.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          SvgPicture.asset('assets/icons/svg/hit.svg'),
                                          const Text(
                                            'Хит',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 3.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width / 4.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                  decoration: BoxDecoration(
                                      color: MColors.backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: const Color.fromARGB(71, 141, 141, 141))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '3',
                                            style: MTextStyles.secondaryBoldTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/svg/glasses.svg',
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        '399 ₽',
                                        style: MTextStyles.secondaryBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 3.5,
                                  width: MediaQuery.of(context).size.width / 3.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          SvgPicture.asset('assets/icons/svg/hit.svg'),
                                          const Text(
                                            '-42 %',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: MColors.pinkColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color.fromARGB(71, 141, 141, 141))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Купить',
                                style: MTextStyles.secondaryBoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'условия и положения'.toUpperCase(),
                          style: MTextStyles.secondaryBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
