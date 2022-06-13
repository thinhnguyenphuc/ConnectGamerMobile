import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/search/filter/game_filter.dart';
import 'package:connectgamermobile/models/search/filter/user_filter.dart';

class SearchRequest {
  GameFilter gameFilter;
  PaginationRequest pagination;
  UserFilter userFilter;

  SearchRequest(this.gameFilter, this.userFilter, this.pagination);

  Map<String, dynamic> toJson() {
    return {
      "gameFilter": gameFilter.toJson(),
      "userFilter": userFilter.toJson(),
      "pagination": pagination.toJson(),
    };
  }
}