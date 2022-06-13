import 'dart:convert';

import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/search/filter/filter_search_request.dart';
import 'package:connectgamermobile/models/search/game_info/apex_minimized_info.dart';
import 'package:connectgamermobile/models/search/user_search_response.dart';
import 'package:connectgamermobile/resources/enums.dart';
import 'package:http/http.dart';

class SearchApi {
  SupportedGame game;

  SearchApi(this.game);

  Response search(SearchRequest request) {
    return Response(
        jsonEncode(
          PagingResponse<UserSearchResponse<ApexMinimizedInfo>>(
            PaginationResponse(request.pagination.page, 10),
            UserSearchResponse.demo()
          ).toJson((object) => object.toJson((value) => value.toJson()))
        ), 200
    );
  }
}