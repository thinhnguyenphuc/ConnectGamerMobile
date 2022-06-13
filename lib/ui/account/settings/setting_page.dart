import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/ui/account/settings/setting_list.dart';
import 'package:connectgamermobile/ui/account/settings/theme_chosing_dialog.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.settings);
      },
      icon: const Icon(Icons.settings),
      splashRadius: 24,
    );
  }

}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingPageState();

}

class _SettingPageState extends State<SettingPage> with StateVariablesMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: GradientBackgroundAppBar(
        data: GradientAppBarData(
          title: Text(l10n.settingsTitle)
        )
      ).build(context),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: _buildBody(context),
        ),
      ),
    );
  }
  
  Widget _buildBody(BuildContext context) {
    return SettingList(
      sections: [
        SettingSection(
          title: l10n.displayTitle,
          tiles: [
            SettingTile(
              icon: const Icon(Icons.format_paint_outlined),
              title: Text(l10n.themesBtnText),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ThemeChoosingDialog();
                  }
                );
              },
            ),
          ],
        ),
        SettingSection(
          title: l10n.securityTitle,
          tiles: [
            SettingTile(
              icon: const Icon(Icons.vpn_key_outlined),
              title: Text(l10n.changePasswordBtnText),
              onPressed: () {},
            ),
          ],
        ),
        SettingSection(
          tiles: [
            SettingTile(
              icon: const Icon(Icons.logout_outlined),
              title: Text(l10n.logOutBtnText),
            ),
          ],
        ),
      ],
    );
  }

}