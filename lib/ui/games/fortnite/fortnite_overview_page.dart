import 'package:connectgamermobile/custom_classes/games/fortnite_super_class.dart';
import 'package:flutter/material.dart';

import '../../../custom_classes/mixins/base_widget_mixins.dart';

class FortniteOverViewPage extends StatefulWidget {
  const FortniteOverViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FortniteOverviewPageState();
}

class _FortniteOverviewPageState extends State<FortniteOverViewPage>
    with StateVariablesMixin, FortniteSuperClass {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    super.buildSuperClass(context);

    titleAttrDuoList = [
      l10n.top3,
      l10n.top5,
      l10n.top6,
      l10n.top10,
      l10n.top12,
      l10n.top25,
      l10n.score,
      l10n.scorePerMin,
      l10n.scorePerMatch,
      l10n.totalWin,
      l10n.kill,
      l10n.killPerMin,
      l10n.killPerMatch,
      l10n.deaths,
      l10n.kd,
      l10n.matches,
      l10n.averageWinRate,
      l10n.minutesPlayed,
      l10n.playersOutlived,
      l10n.lastModified
    ];

    return profile != null
        ? Column(
            children: [
              const SizedBox(height: 20),
              Text(
                l10n.detailsInfo,
                style: FortniteSuperClass.largeStyle,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(
                            3.0, // Move to right 10  horizontally
                            3.0, // Move to bottom 10 Vertically
                          ),
                          color: theme.brightness == Brightness.light
                              ? Colors.white
                              : Colors.black,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: titleAttrDuoList.length,
                      itemBuilder: (context, index) {
                        String value =
                            getAttribute(profile!.stats.overall, index);
                        return Visibility(
                            visible: value != "-1",
                            child: CustomCardView(
                              theme: theme,
                              title: titleAttrDuoList[index],
                              detail: value,
                              imageSrc: iconAsset[index],
                            ));
                      },
                    )),
              ),
            ],
          )
        : const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
  }
}
