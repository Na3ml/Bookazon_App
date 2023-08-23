import 'package:bookazon/data/data_source/local/app_prefs.dart';
import 'package:bookazon/resources/service_locator/service_locator.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/style/app_colors.dart';

enum Switchers {
  darkMode,
  faceId,
  rememberMe,
  touchId,
}

class PublicSwitchListTile extends StatefulWidget {
  final String title;
  final Switchers swithcer;
  final Icon? icon;
  const PublicSwitchListTile({
    super.key,
    required this.title,
    required this.swithcer,
    this.icon,
  });

  @override
  State<PublicSwitchListTile> createState() => _PublicSwitchListTileState();
}

class _PublicSwitchListTileState extends State<PublicSwitchListTile> {
  bool switcherValue = false;
  final appPrefs = getIt<AppPrefs>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icon,
      title: PublicText(
        txt: widget.title,
        color: AppColors.subTitleBlack,
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          onChanged: (value) {
            setState(() {
              switcherValue = value;
            });
            setSwitches(widget.swithcer, switcherValue);
          },
          value: switcherValue,
          activeColor: AppColors.purple,
        ),
      ),
    );
  }

  // helper methods
  void setSwitches(Switchers switcher, bool value) {
    switch (switcher) {
      case Switchers.rememberMe:
        appPrefs.setUserLoggedIn(value);
        break;
      default:
    }
  }
}
