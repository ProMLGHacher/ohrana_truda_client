import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ohrana_truda/res/theme/consts.dart';
import 'package:ohrana_truda/res/widgets/BodyContainer.dart';
import 'package:ohrana_truda/res/widgets/CustomAppBar.dart';
import 'package:ohrana_truda/res/widgets/CustomButton.dart';
import 'package:ohrana_truda/res/widgets/CustomTextField.dart';
import 'package:ohrana_truda/res/widgets/dropZone.dart';
import 'package:ohrana_truda/res/widgets/gendersFelds.dart';
import 'package:ohrana_truda/res/widgets/idAndButtonTop.dart';
import 'package:ohrana_truda/res/widgets/shileldAndProgressBar.dart';
import 'package:ohrana_truda/res/widgets/utils.dart';

import 'nav.dart';

bool flag = false;

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBarBackground(),
          BodyBackground(),
          CustomAppBar([]),
          Positioned(
            top: kAppBarHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: BodyContainer(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      IdAndButton(),
                      kDefaultVerticalPadding,
                      Navigation(),
                      kDefaultVerticalPadding,
                      Observer(builder: (_) {
                        var ret = AnimatedCrossFade(
                          crossFadeState: flag
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: Duration(milliseconds: 300),
                          firstChild: flag
                              ? getFromPos(navPosition.value)
                              : getFromPos(previouspos),
                          secondChild: flag
                              ? getFromPos(previouspos)
                              : getFromPos(navPosition.value),
                        );

                        flag = !flag;

                        return ret;
                      }),
                      SizedBox(
                        height: kDefaultPadding * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (isAdmin)
                            CustomButton(
                              'Отклонить',
                              color: Colors.red,
                              textColor: Colors.white,
                              width: 200,
                            ),
                          if (!isAdmin)
                            Observer(
                              builder: (_) => navPosition.value == 1
                                  ? CustomButton(
                                      'Отправить',
                                      color: Color(0xFF5998F5),
                                      textColor: Colors.white,
                                      width: 200,
                                    )
                                  : SizedBox(),
                            ),
                          kDefaultHorizontalPadding,
                          CustomButton(
                            isAdmin ? 'Подтвердить' : 'Сохранить',
                            color: Colors.white,
                            width: 200,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: kDefaultPadding * 3,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget getFromPos(int pos) {
  switch (pos) {
    case 1:
      return First();
    case 2:
      return Second();
    case 3:
      return Third();
    case 4:
      return Four();
    case 5:
      return Five();
    case 6:
      return Six();
    case 7:
      return Seven();
    case 8:
      return Vosem();
    default:
      return First();
  }
}

class First extends StatelessWidget {
  const First({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDemoDataAdmin.length : leftDemoData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? leftDemoDataAdmin[index]
                              : leftDemoData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
              DropZone(context),
              ShieldAndProgressBar(),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDemoDataAdmin.length : rightDemoData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDemoDataAdmin[index]
                              : rightDemoData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
              GendersFields(),
              const SizedBox(
                height: kDefaultPadding,
              ),
              CustomTextField(
                stroke: true,
                hintText: isAdmin
                    ? '''Организационно правовые формы юридического лица
Примерами организационно-правовых форм являются – Акционерное общество (АО), Общество с ограниченной ответственностью (ООО), Учреждение.
Согласно ГК РФ возможны следующие организационно-правовые формы собственности:
хозяйственные товарищества;
хозяйственные общества;
производственные кооперативы;
унитарные предприятия.'''
                    : 'Комментарий',
                readOnly: isAdmin,
                height: 80 * 7,
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Second extends StatelessWidget {
  Second({
    Key? key,
  }) : super(key: key);

  var leftData = [
    'Специальная оценка проведена',
    '% рабочих мест, охваченных СОУТ',
    'Количество рабочих мест с условиями труда',
    '% работников, занятых на работах с опасными условиями труда'
  ];

  var rightData = [
    'Дата внесения отчета СОУТ и номер отчета во ФГИС СОУТ',
    'Всего рабочих мест в организации',
    'Количество рабочих мест, на которых проведена СОУТ',
  ];

  var leftDataAdmin = ['Да', '54%', '12', '0'];

  var rightDataAdmin = [
    '21.34.54 239846238',
    '9',
    '9',
  ];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Third extends StatelessWidget {
  Third({
    Key? key,
  }) : super(key: key);

  var leftData = [
    'Проведена оценка профессиональных рисков в области охраны труда',
  ];

  var rightData = [
    'Дата проведения последней оценки профессиональных рисков',
  ];

  var leftDataAdmin = [
    'Да',
  ];

  var rightDataAdmin = [
    '32.12.54',
  ];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Four extends StatelessWidget {
  Four({
    Key? key,
  }) : super(key: key);

  var leftData = [
    'Численность работников, получающих средства индивидуальной защиты',
    'Численность работников, получающих обезвреживающие средства',
    '% работников, прошедших периодические медицинские осмотры'
  ];

  var rightData = [
    'Средний % обеспеченности работников СИЗ',
    'Количество работников, подлежащих обязательным  медицинским осмотрам'
  ];

  var leftDataAdmin = ['5', '2', '100%'];

  var rightDataAdmin = ['80%', '1'];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Five extends StatelessWidget {
  Five({
    Key? key,
  }) : super(key: key);

  var leftData = [];

  var rightData = [];

  var leftDataAdmin = [];

  var rightDataAdmin = [];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Six extends StatelessWidget {
  Six({
    Key? key,
  }) : super(key: key);

  var leftData = [
    '''Наличие нормативного
акта, регламентирующего систему
управления охраной труда''',
    '''Наличие комитета (комиссии) по
охране труда''',
    '''Наличие кабинета (уголка) охраны
труда ''',
    '''Наличие плана мероприятий по
улучшению и оздоровлению условий
труда''',
    '''Наличие корпоративной программы
сохранения здоровья работников'''
  ];

  var rightData = [
    '''Наличие уполномоченных
(доверенных) лиц по охране
труда''',
    '''Наличие соглашения по охране труда в
организации''',
    '''Наличие помещения для оказания
медицинской помощи''',
    '''Объем финансирования плана
мероприятий по
 улучшению и оздоровлению условий
труда (тыс. руб.)'''
  ];

  var leftDataAdmin = ['''Да''', '''Да''', '''Да ''', '''Да''', '''Да'''];

  var rightDataAdmin = ['''да''', '''да''', '''Да''', '''600 000 рублей'''];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Seven extends StatelessWidget {
  Seven({
    Key? key,
  }) : super(key: key);

  var leftData = [
    '''Количество работников, которые
должны проходить обучение по охране
труда ''',
    '''% фактически прошедших такое
обучение''',
  ];

  var rightData = [
    '''Своевременное проведение
инструктажей по охране труда'''
  ];

  var leftDataAdmin = [
    '''9 ''',
    '''78%''',
  ];

  var rightDataAdmin = ['''да'''];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class Vosem extends StatelessWidget {
  Vosem({
    Key? key,
  }) : super(key: key);

  var leftData = [
    '''Наличие профсоюзной организации ''',
    '''Изменения в колдоговор''',
  ];

  var rightData = ['''Наличие коллективного договора'''];

  var leftDataAdmin = [
    '''Да''',
    '''Да''',
  ];

  var rightDataAdmin = ['''Да'''];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? leftDataAdmin.length : leftData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText:
                              isAdmin ? leftDataAdmin[index] : leftData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    isAdmin ? rightDataAdmin.length : rightData.length,
                    (index) => CustomTextField(
                          stroke: true,
                          hintText: isAdmin
                              ? rightDataAdmin[index]
                              : rightData[index],
                          bottomMargin: 8,
                          readOnly: isAdmin,
                        )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
