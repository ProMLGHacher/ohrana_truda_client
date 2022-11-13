import 'package:flutter/material.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

import 'CustomTextField.dart';

class GendersFields extends StatelessWidget {
  const GendersFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Flexible(
              child: CustomTextField(
            hintText: isAdmin ? '3' : 'Кол-во Женщин',
            stroke: true,
          )),
          SizedBox(
            width: 16,
          ),
          Flexible(
              child: CustomTextField(
            hintText: isAdmin ? '6' : 'Кол-во Мужчин',
            stroke: true,
          )),
        ],
      ),
    );
  }
}
