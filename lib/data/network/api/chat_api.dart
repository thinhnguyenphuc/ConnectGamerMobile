import 'package:connectgamermobile/models/chat/request/chat_pagination_request.dart';
import 'package:connectgamermobile/models/chat/request/chat_room_edit_request.dart';
import 'package:connectgamermobile/models/chat/request/create_chat_message_request.dart';
import 'package:connectgamermobile/models/chat/request/create_chat_room_request.dart';
import 'package:connectgamermobile/models/chat/request/room_users_edit_request.dart';
import 'package:connectgamermobile/models/chat/response/room_users_edit_response.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/api.dart';
import 'package:http/http.dart';

class ChatApi {
  ChatApi._();

  static Future<Response> loadAllChatRoom(PaginationRequest request, [String name = ""]) {
    return ApiUtils.get(
      path: "api/Chat/room/get",
      queryParams: {
        "Page": request.page.toString(),
        "ItemPerPage": request.itemPerPage.toString(),
        "Name": name,
        "Nmess": "1",
      },
      token: Strings.testToken,
    );
  }

  static Future<Response> addChatRoom(CreateChatRoomRequest request) {
    return ApiUtils.post(
      path: "api/Chat/room",
      body: request.toJson(),
      token: Strings.testToken,
    );
  }

  static Future<Response> loadMessages(
      String roomId, ChatPaginationRequest request) {
    return ApiUtils.post(
      path: "/api/Chat/room/$roomId/messages/get",
      body: request.toJson(),
      token: Strings.testToken,
    );
  }

  static Future<Response> sendMessage(CreateChatMessageRequest request) {
    return ApiUtils.post(
      path: "/api/Chat/room/send/messages/text",
      body: request.toJson(),
      token: Strings.testToken,
    );
  }

  static Future<Response> editRoomName(ChatRoomEditRequest request) {
    return ApiUtils.post(
      path: "/api/Chat/room/${request.roomId}/edit/name",
      body: {"name": request.roomName},
      token: Strings.testToken,
    );
  }

  static Future<Response> addUserToChatRoom(String roomId, RoomUsersEditRequest request) {
    return ApiUtils.post(
      path: "/api/Chat/room/$roomId/user/add",
      body: request.toJson(),
      token: Strings.testToken,
    );
  }

  static Future<Response> removeUserFromChatRoom(String roomId, RoomUsersEditRequest request) {
    return ApiUtils.post(
      path: "/api/Chat/room/$roomId/user/remove",
      body: request.toJson(),
      token: Strings.testToken,
    );
  }
}
