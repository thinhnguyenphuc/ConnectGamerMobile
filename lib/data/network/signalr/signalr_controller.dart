import 'package:connectgamermobile/resources/strings.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/default_reconnect_policy.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SignalRController {
  SignalRController._internal();

  factory SignalRController() {
    return _instance;
  }

  static final SignalRController _instance = SignalRController._internal();

  HubConnection? _hubConnection;
  final Logger _logger = Logger("SignalR - hub");

  Future<void> init() async {
    closeConnection();

    final httpConnectionOptions = HttpConnectionOptions(
      accessTokenFactory: () async {
        return Strings.testToken;
      }
    );

    _hubConnection = HubConnectionBuilder().withUrl(Uri.https(Strings.serverAuthority, "/hubs/chats").toString(), options: httpConnectionOptions).configureLogging(_logger).build();

    await startConnection();
  }

  void closeConnection() {
    _hubConnection?.stop();
  }

  void on(String methodName, void Function(List<Object>?) newMethod) {
    _hubConnection?.on(methodName, newMethod);
  }

  Future<void> startConnection() async {
    await _hubConnection?.start();
  }

  void off(String methodName, void Function(List<Object>?)? newMethod) {
    _hubConnection?.off(methodName, method: newMethod);
  }
}