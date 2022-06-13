import 'package:connectgamermobile/data/repositories/games/fortnite_repository.dart';
import 'package:connectgamermobile/models/game/fortnite/fortnite_model.dart';
import 'package:connectgamermobile/view_models/common/base_view_model.dart';

class FortniteViewModel extends BaseViewModel {
  FortniteProfile? profile;

  void fetchProfile(String inGameName) async {
    await FortniteRepository()
        .getFullProfile(inGameName)
        .then((value) => profile = value);
    notifyListeners();
  }
}