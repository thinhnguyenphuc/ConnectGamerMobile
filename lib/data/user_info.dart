import 'package:connectgamermobile/models/user/user_info.dart';
import 'package:connectgamermobile/models/user/user_overview_info.dart';

class UserOverallInfo {
  late UserOverViewInfo _userInfo;
  static final UserOverallInfo _instance = UserOverallInfo._internal();

  factory UserOverallInfo() => _instance;

  void initialize(Map<String, dynamic>userInfoJson){
    _instance._userInfo = UserOverViewInfo.fromJson(userInfoJson);
  }
  UserOverallInfo._internal();

  UserOverViewInfo getUserInfo() => _instance._userInfo;
}

class UserDetailInfo{
  late UserInfo _userInfo;
  static final UserDetailInfo _instance = UserDetailInfo._internal();

  factory UserDetailInfo() => _instance;

  void initialize(Map<String, dynamic>userInfoJson){
    _instance._userInfo = UserInfo.fromJson(userInfoJson);
  }
  UserDetailInfo._internal();

  UserInfo getUserInfo() => _instance._userInfo;
  bool isCurrentUser(String username){
    return _instance._userInfo.userName==username;
  }
}

class Authorization{
  late String _token;
  static final Authorization _inst = Authorization._internal();
  Authorization._internal();

  void initialize(String token){
    _inst._token = token;
  }

  factory Authorization() {
    return _inst;
  }

  String getToken() => _inst._token;
}