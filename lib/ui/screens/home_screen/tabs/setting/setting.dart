import 'package:app3/providers/settings_provider.dart';
import 'package:app3/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SettingTAb extends StatefulWidget {
  static String routeName = 'setting';

  const SettingTAb({super.key});

  @override
  State<SettingTAb> createState() => _SettingTAbState();
}

class _SettingTAbState extends State<SettingTAb> {
  bool arSwitch = false;
  bool darkMode = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.bodyLarge),
          buildSettingRow('العربية', arSwitch, (newValue) {
            arSwitch = newValue;
            if (arSwitch) {
              provider.setCurrentLocale("ar");
            } else {
              provider.setCurrentLocale("en");
            }
          }),
          buildSettingRow(AppLocalizations.of(context)!.darkMode, darkMode,
              (newValue) {
            darkMode = newValue;
            if (darkMode) {
              provider.setCurrentMode(ThemeMode.dark);
            } else {
              provider.setCurrentMode(ThemeMode.light);
            }
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
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const Spacer(),
        Switch(
            value: switchValue,
            onChanged: onChanged,
            activeColor: AppColors.primary),
      ],
    );
  }
}
