import 'package:bungasari_app/styles/text_style.dart';
import 'package:flutter/cupertino.dart';

class ListProfile extends StatelessWidget {
  final String title;
  final String name;
  const ListProfile({
    super.key,
    required this.title,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.TitlefrFinalData,
        ),
        Text(
          name,
          style: AppTextStyles.DescfrFinalData,
        )
      ],
    );
  }
}