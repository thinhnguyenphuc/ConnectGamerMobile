import 'package:connectgamermobile/models/game/apex/apex_profile.dart';

import '../../data/repositories/games/apex_repository.dart';
import '../common/base_view_model.dart';

class ApexViewModel extends BaseViewModel {
  ApexProfile? profile;

  void fetchProfile(String inGameName) async {
    await ApexRepository()
        .getFullProfile(inGameName)
        .then((value) => profile = value);
    notifyListeners();
  }
}
