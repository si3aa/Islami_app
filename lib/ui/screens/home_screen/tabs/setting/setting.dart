import 'package:app3/ui/utils/app_colors.dart';
import 'package:app3/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingTAb extends StatefulWidget {
  static String routeName = 'setting';

  const SettingTAb({super.key});

  @override
  State<SettingTAb> createState() => _SettingTAbState();
}

class _SettingTAbState extends State<SettingTAb> {
  bool arSwitch = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Settings', style: AppTheme.settingsTitleTextStyle),
          buildSettingRow('العربية', arSwitch, (newValue) {
            arSwitch = newValue;
            setState(() {});
          }),
          buildSettingRow('Dark Mode', darkMode, (newValue) {
            darkMode = newValue;
            setState(() {});
          }),
        ],
      ),
    );
  }

  Widget buildSettingRow(
      String title, bool switchValue, Function(bool) onChanged) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(title, style: AppTheme.settingsOptionTextStyle),
        const Spacer(),
        Switch(value:switchValue, onChanged: onChanged, activeColor: AppColors.primary),
      ],
    );
  }
}
