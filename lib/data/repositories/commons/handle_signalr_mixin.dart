import 'package:connectgamermobile/data/network/signalr/signalr_controller.dart';
import 'package:connectgamermobile/models/commons/signalr.dart';
import 'package:flutter/cupertino.dart';

class HandleSignalRMixin {
  List<SignalRRequest> requests = [];

  void onSignalR(SignalRRequest request) {
    requests.add(request);
    SignalRController().on(request.methodName, request.responseHandler);
  }

  void offSignalR() {
    for (var request in requests) {
      SignalRController().off(request.methodName, request.responseHandler);
    }
  }

  void onSignalRJsonData<T>(String methodName, void Function(T data) handleResponse,
      T Function(Map<String, dynamic> json) fromJson) {
    onSignalR(SignalRRequest(methodName, _createJsonDataHandler<T>(handleResponse, fromJson)));
  }

  Function(List<Object>?) _createJsonDataHandler<T>(void Function(T data) handleResponse,
      T Function(Map<String, dynamic> json) fromJson) {
    return (objects) {
      try {
        handleResponse(fromJson(objects?[0] as Map<String, dynamic>));
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    };
  }
}