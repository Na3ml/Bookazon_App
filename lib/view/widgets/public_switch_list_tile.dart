import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../resources/style/app_colors.dart';

class PublicSwitchListTile extends StatelessWidget {
  final String title;
  final Icon? icon;
  const PublicSwitchListTile({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: PublicText(
        txt: title,
        color: AppColors.subTitleBlack,
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          onChanged: (value) {},
          value: false,
          activeColor: AppColors.purple,
          // thumbColor: Colors.amber,
          // trackColor: Colors.blue,
        ),
      ),
    );
  }
}