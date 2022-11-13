import 'package:flutter/material.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/widgets/CustomButton.dart';

class IdAndButton extends StatelessWidget {
  const IdAndButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Личные данные',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 1,
              width: 60,
              color: Colors.white,
            )
          ],
        ),
        CustomButton(
          'Скачать паспорт',
          color: primary,
          textColor: Colors.white,
          width: 200,
        )
      ],
    );
  }
}
