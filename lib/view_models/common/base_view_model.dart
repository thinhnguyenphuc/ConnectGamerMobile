import 'package:connectgamermobile/view_models/common/fetch_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

///Using for view models that need fetching data
abstract class BaseViewModel extends ChangeNotifier {
  FetchState state = FetchState.loading;
  String errorMessage = "";

  String viewModelId = const Uuid().v4();

  void setLoading() {
    state = FetchState.loading;
    notifyListeners();
  }

  void setError() {
    state = FetchState.error;
    notifyListeners();
  }

  void setSuccess() {
    state = FetchState.success;
    notifyListeners();
  }

  void setDoneLoading(bool success) {
    if (success) {
      setSuccess();
    } else {
      setError();
    }
  }
}
