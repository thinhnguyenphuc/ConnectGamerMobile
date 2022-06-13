import 'dart:convert';

import 'package:connectgamermobile/data/network/api/user_api.dart';
import 'package:connectgamermobile/data/user_info.dart';

class UserRepository {
  void fetchUserOverallInfo() async {
    await UserApi.fetchUserOverallInfo().then((value) {
      if (value.statusCode == 200) {
        UserOverallInfo().initialize(jsonDecode(value.body));
        fetchUserDetailInfo();
      }
    });
  }

  void fetchUserDetailInfo() async {
    await UserApi.fetchUserDetailInfo(UserOverallInfo().getUserInfo().userName)
        .then((value) {
      if (value.statusCode == 200) {
        UserDetailInfo().initialize(jsonDecode(value.body));
      }
    });
  }
}
