import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// ![](https://media-exp1.licdn.com/dms/image/D4D35AQH-p1m1BVVtWg/profile-framedphoto-shrink_400_400/0/1640301830538?e=1664881200&v=beta&t=yuaGq5VISzejtnIi19jOGWbM_G_MFo8xG63tuimXnp0)
class ConnectivityHandler {
  static final _connectivity = Connectivity();

  static final ValueNotifier<bool> _isConnectedValueNotifier =
      ValueNotifier(false);

  static ValueNotifier<bool> get isConnectedValueNotifier {
    assert(
      _monitoring,
      '\n[ConnectivityManager] You have forgot to start monitoring, try to do it by calling  ConnectivityHandler.startMonitoring()',
    );
    return _isConnectedValueNotifier;
  }

  static bool _monitoring = false;

  static void startMonitoring() {
    if (_monitoring) return;

    _monitoring = true;

    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _isConnectedValueNotifier.value = !_isConnectedValueNotifier.value;
      _isConnectedValueNotifier.value =
          connectivityResult != ConnectivityResult.none;
    });
  }
}
