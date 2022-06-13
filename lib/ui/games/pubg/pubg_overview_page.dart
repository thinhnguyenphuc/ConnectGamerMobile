import 'package:connectgamermobile/custom_classes/games/pubg_super_class.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/games.dart';
import 'package:flutter/material.dart';

class PUBGOverViewPage extends StatefulWidget {
  const PUBGOverViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PUBGOverViewPageState();
}

class _PUBGOverViewPageState extends State<PUBGOverViewPage>
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
    return Container(
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
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <
                      Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(
                                  3.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                                color:
                                theme.brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 15,
                                  child: ClipOval(
                                      child: Icon(Icons
                                          .account_balance_outlined))),
                              Container(
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(l10n.rankedOverView,
                                        style: PUBGSuperClass.largeStyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text("${l10n.bestRankPoint}: ",
                                      style: theme.textTheme.bodyLarge),
                                  Text(profile!.bestRankPoint.toString(),
                                      style: theme.textTheme.bodyLarge),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: theme.cardTheme.color,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: theme.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <
                      Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(
                                  3.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                                color:
                                theme.brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 15,
                                  child: ClipOval(
                                      child: Icon(Icons.details))),
                              Container(
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(l10n.detailsInfo,
                                        style: PUBGSuperClass.largeStyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 550,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: Strings.attrPUBGDuoList.length,
                              itemBuilder: (context, index) {
                                return Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: theme.brightness == Brightness.light ? Colors.white : Colors.black,
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
                                          color: Colors.grey.withOpacity(0.6),
                                          spreadRadius: 2,
                                          blurRadius: 1,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.only(left: 10, right:5, top:5, bottom: 5),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 15,
                                          child: ClipOval(
                                            child: Image.asset(
                                                iconPUBGData[index]),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text("${titleAttrDuoList[index]}: ",
                                            style:
                                            theme.textTheme.bodyLarge),
                                        const Spacer(),
                                        Text(
                                            GameUtils.getSumOfDuoAttribute(
                                                Strings.attrPUBGDuoList[index],
                                                duoList),
                                            style:
                                            theme.textTheme.bodyLarge,),
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
                  ])),
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
    );
  }
}
