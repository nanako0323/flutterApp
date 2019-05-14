import 'dart:async';
import 'package:web_socket_channel/io.dart';

class EchoClient {
  IOWebSocketChannel _channel;
  Timer _timer;

  Stream<dynamic> get stream => _channel.stream;

  void connect() {
    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      _channel.sink.add(DateTime.now().toString());
    });
  }

  void dispose() {
    _channel.sink.close();
    _timer.cancel();
  }
}
