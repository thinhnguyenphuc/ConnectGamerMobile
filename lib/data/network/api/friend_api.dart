import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/api.dart';
import 'package:http/http.dart';

class FriendApi {
  static Future<Response> getFriendList(PaginationRequest paginationRequest, [String name = ""]) async {
    return ApiUtils.get(
      path: "api/User/friend/getList",
      queryParams: {
        ...paginationRequest.toQueryParams(),
        "UserName": name
      },
      token: Strings.testToken,
    );
  }

  static Future<Response> getFriendRequests(PaginationRequest paginationRequest) async {
    return ApiUtils.post(
      path: "api/User/friend/request/get",
      body: paginationRequest.toJson(),
      token: Strings.testToken,
    );
  }

  static Future<Response> acceptFriendRequest(String id) async {
    return ApiUtils.post(
      path: "/api/User/Friend/request/$id/accept",
      token: Strings.testToken,
    );
  }

  static Future<Response> declineFriendRequest(String id) async {
    return ApiUtils.post(
      path: "/api/User/Friend/request/$id/reject",
      token: Strings.testToken,
    );
  }
}