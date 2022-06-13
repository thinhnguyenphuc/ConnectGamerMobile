import 'package:connectgamermobile/models/search/game_info/game_minimized_info.dart';
import 'package:connectgamermobile/models/user/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

import 'game_info/apex_minimized_info.dart';

part '../generated/search/user_search_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class UserSearchResponse<T extends GameMinimizedInfo> {
  UserInfo userInfo;
  T gameInfo;

  UserSearchResponse(this.userInfo, this.gameInfo);

  factory UserSearchResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$UserSearchResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$UserSearchResponseToJson(this, toJsonT);

  static List<UserSearchResponse<ApexMinimizedInfo>> demo() {
    List<UserSearchResponse<ApexMinimizedInfo>> list = [
      UserSearchResponse(
        UserInfo("1", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("1", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PC"),
      ),
      UserSearchResponse(
        UserInfo("2", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("2", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PS4"),
      ),
      UserSearchResponse(
        UserInfo("3", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("3", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "XBOX"),
      ),
      UserSearchResponse(
        UserInfo("4", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("4", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PC"),
      ),
      UserSearchResponse(
        UserInfo("5", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("5", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PC"),
      ),
      UserSearchResponse(
        UserInfo("6", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("6", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PC"),
      ),
      UserSearchResponse(
        UserInfo("7", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("7", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PC"),
      ),
      UserSearchResponse(
        UserInfo("8", "user test 1", "user1@gmail.com", "https://answers.ea.com/t5/image/serverpage/image-id/59353i769415A78619EBCB?v=v2", "this is bio", "bedgeee"),
        ApexMinimizedInfo("8", "wraith", "avatar", "200", "Diamond", "4", "https://static.wixstatic.com/media/6c8ac2_ed6ceaf77f04411b8980410f7c9c84f9~mv2.png/v1/fit/w_500,h_500,q_90/file.png", "PC"),
      ),
    ];

    return list;
  }
}