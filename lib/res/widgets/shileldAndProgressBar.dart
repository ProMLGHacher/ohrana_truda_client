import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

class ShieldAndProgressBar extends StatelessWidget {
  const ShieldAndProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80 * 5,
      width: 1200,
      child: LayoutBuilder(
          builder: (context, constraints) => Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: kDefaultPadding * 2,
                        left: 4,
                        width: constraints.maxWidth / 2 - kDefaultPadding * 2,
                        height: constraints.maxWidth / 2 - kDefaultPadding * 2,
                        child: CircularProgressIndicator(
                          value: 98 / 100,
                          backgroundColor: Color(0xFF282F5A),
                          strokeWidth: 8,
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                      Positioned(
                          top: kDefaultPadding * 2,
                          left: 0,
                          width: constraints.maxWidth / 2 - kDefaultPadding * 2,
                          height:
                              constraints.maxWidth / 2 - kDefaultPadding * 2,
                          child: Center(
                            child: Text(
                              '98%',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 40),
                            ),
                          )),
                      Positioned(
                          top: kDefaultPadding * 2,
                          right: 0,
                          width: constraints.maxWidth / 2 - kDefaultPadding * 2,
                          height:
                              constraints.maxWidth / 2 - kDefaultPadding * 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/shield.svg',
                                color: Colors.yellow,
                                width: constraints.maxWidth / 3 - 8,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Золотой знак',
                                style: TextStyle(fontSize: 26),
                              ),
                              Text('На проверке'),
                            ],
                          )),
                    ],
                  ),
                ],
              )),
    );
  }
}
