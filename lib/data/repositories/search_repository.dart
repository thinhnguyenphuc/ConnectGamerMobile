import 'dart:convert';

import 'package:connectgamermobile/data/network/api/search_api.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/search/filter/filter_search_request.dart';
import 'package:connectgamermobile/models/search/game_info/game_minimized_info.dart';
import 'package:connectgamermobile/models/search/user_search_response.dart';
import 'package:connectgamermobile/resources/enums.dart';

class SearchRepository {
  late SearchApi api;
  SupportedGame game;

  SearchRepository(this.game) {
    api = SearchApi(game);
  }

  Future<PagingResponse<UserSearchResponse>> search(SearchRequest request) async {
    await Future.delayed(const Duration(seconds: 3));

    var response = api.search(request);

    return PagingResponse.fromJson(jsonDecode(response.body)
        ,(json) => UserSearchResponse.fromJson(json as Map<String, dynamic>, (jsonT) => GameMinimizedInfo.fromJson(jsonT, game)))
      ..code = response.statusCode;
  }
}