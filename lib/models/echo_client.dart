import 'dart:async';
import 'package:web_socket_channel/io.dart';

class EchoClient {
  IOWebSocketChannel _channel;
  Timer _timer;
  StreamController<String> _controller;

  Stream<String> get stream => _controller.stream;

  bool _isConnected = false;

  void connect() {
    if (_isConnected) {
      return;
    }

    _isConnected = true;

    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    _controller = StreamController.broadcast();

    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      _channel.sink.add(DateTime.now().toString());
    });

    _channel.stream.listen((data){
      _controller.add(data.toString());
    });
  }

  void dispose() {
    _channel.sink.close();
    _timer.cancel();
  }
}
