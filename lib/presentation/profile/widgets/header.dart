import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  final String name;
  final String category;
  const Header({
    super.key,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.bgWhite,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.only(
        top: 17,
        right: 21,
        left: 21,
        bottom: 21,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextStyles.TitlefrFinalData,
          ),
          Text(
            category,
            style: AppTextStyles.DescfrFinalData,
          ),
        ],
      ),
    );
  }
}
