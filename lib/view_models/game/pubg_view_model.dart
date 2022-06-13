import 'package:connectgamermobile/data/repositories/games/pubg_repository.dart';
import '../../models/game/pubg/pubg_profile.dart';
import '../common/base_view_model.dart';

class PUBGViewModel extends BaseViewModel {
  PUBGProfile? profile;

  void fetchProfile(String inGameName) async {
    await PUBGRepository()
        .getFullProfile(inGameName)
        .then((value) => profile = value);
    notifyListeners();
  }
}