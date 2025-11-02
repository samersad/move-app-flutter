import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:move/utils/app_assets.dart';
import 'package:move/utils/app_color.dart';
import 'package:move/provider/languaged_provider.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppLanguageProvider>(context);
    bool isArabic = langProvider.appLanguage == "ar";

    return Container(
      width: 62,
      height: 32,
      padding:  EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.yellow, width: 2),
        borderRadius: BorderRadius.circular(40),
        color: Colors.transparent,
      ),
      child: FlutterSwitch(
        width: 60,
        height: 30,
        toggleSize: 27,
        value: isArabic,
        padding: 1,
        showOnOff: false,
        activeColor: Colors.transparent,
        inactiveColor: Colors.transparent,

        activeIcon: Image.asset(AppAssets.ar),
        inactiveIcon: Image.asset(AppAssets.en),

        onToggle: (val) {

          langProvider.changeLanguage(val ? "ar" : "en");
        },
      ),
    );
  }
}
