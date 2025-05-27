import 'package:flutter/material.dart';
import '../../../../../../core/utils/resource/color_app.dart';
import '../../../../../../core/utils/resource/text_style.dart';

class ListTitleOrderStatusWidget extends StatelessWidget {
  const ListTitleOrderStatusWidget(
      {super.key,
      required this.decoration,
      required this.icon,
      required this.title,
      required this.select,
      required this.desc});
  final Decoration decoration;
  final IconData icon;
  final String title;
  final String desc;
  final bool select;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 45,
            height: 45,
            alignment: Alignment.center,
            decoration: decoration,
            child: Icon(
              icon,
              color: select ? AppColors.mainOneColor : Colors.white,
            )),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.getRegularStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    " $desc",
                    style: AppTextStyles.getRegularStyle(
                      fontSize: 14,
                      color: AppColors.secondaryTwoColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
