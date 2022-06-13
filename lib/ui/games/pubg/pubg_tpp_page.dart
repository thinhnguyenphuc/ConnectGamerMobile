import 'package:connectgamermobile/custom_classes/games/pubg_super_class.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_classes/mixins/base_widget_mixins.dart';
import '../../../resources/strings.dart';
import '../../../utils/games.dart';

class PUBGTPPPage extends StatefulWidget {
  const PUBGTPPPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PUBGTPPPageState();
}

class _PUBGTPPPageState extends State<PUBGTPPPage>
    with StateVariablesMixin, PUBGSuperClass {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    super.buildSuperClass(context);
    titleAttrDuoList = [
      l10n.totalWin,
      l10n.totalLose,
      l10n.averageWinRate,
      l10n.averageTop10Rate,
      l10n.totalKill,
      l10n.totalHeadshotKills,
      l10n.averageHeadshotRate,
      l10n.longestKill,
      l10n.totalTop10s
    ];
    return ExpandableNotifier(
        child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            profile != null
                ? Column(
                    children: [
                      Card(
                        color: theme.cardTheme.color,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: theme.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ExpandableNotifier(
                            child: Expandable(
                          collapsed: ExpandableButton(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: Text(l10n.solo,
                                          style: PUBGSuperClass.largeStyle),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Icon(Icons.arrow_drop_down)],
                                )
                              ],
                            ),
                          ),
                          expanded: ExpandableButton(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(l10n.solo,
                                          style: PUBGSuperClass.largeStyle),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 550,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              Strings.attrPUBGDuoList.length,
                                          itemBuilder: (context, index) {
                                            return Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: theme.brightness ==
                                                          Brightness.light
                                                      ? Colors.white
                                                      : Colors.black,
                                                  border: const Border(
                                                    left: BorderSide(
                                                      color: Colors.greenAccent,
                                                      width: 3.0,
                                                    ),
                                                    right: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.6),
                                                      spreadRadius: 2,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 5,
                                                    top: 5,
                                                    bottom: 5),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      radius: 15,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                            iconPUBGData[
                                                                index]),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                        "${titleAttrDuoList[index]}: ",
                                                        style: theme.textTheme
                                                            .bodyLarge),
                                                    const Spacer(),
                                                    Text(
                                                      GameUtils.getDuoAttribute(
                                                          Strings.attrPUBGDuoList[
                                                              index],
                                                          profile!.gameModeStats
                                                              .solo),
                                                      style: theme
                                                          .textTheme.bodyLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                      Card(
                        color: theme.cardTheme.color,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: theme.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ExpandableNotifier(
                            child: Expandable(
                          collapsed: ExpandableButton(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: Text(l10n.squad,
                                          style: PUBGSuperClass.largeStyle),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Icon(Icons.arrow_drop_down)],
                                )
                              ],
                            ),
                          ),
                          expanded: ExpandableButton(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(l10n.squad,
                                          style: PUBGSuperClass.largeStyle),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 550,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              Strings.attrPUBGDuoList.length,
                                          itemBuilder: (context, index) {
                                            return Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: theme.brightness ==
                                                          Brightness.light
                                                      ? Colors.white
                                                      : Colors.black,
                                                  border: const Border(
                                                    left: BorderSide(
                                                      color: Colors.greenAccent,
                                                      width: 3.0,
                                                    ),
                                                    right: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.6),
                                                      spreadRadius: 2,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 5,
                                                    top: 5,
                                                    bottom: 5),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      radius: 15,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                            iconPUBGData[
                                                                index]),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                        "${titleAttrDuoList[index]}: ",
                                                        style: theme.textTheme
                                                            .bodyLarge),
                                                    const Spacer(),
                                                    Text(
                                                      GameUtils.getDuoAttribute(
                                                          Strings.attrPUBGDuoList[
                                                              index],
                                                          profile!.gameModeStats
                                                              .squad),
                                                      style: theme
                                                          .textTheme.bodyLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                  ),
          ],
        ),
      ),
    ));
  }
}
