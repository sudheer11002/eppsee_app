import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'connection.dart';

class NetworkConnectionObserver extends ChangeNotifier {
  late StreamSubscription<List<ConnectivityResult>> subscription;

  Connection connection = Connection.Disconnected;
  bool offline = true;
  NetworkConnectionObserver() {
    subscription =
        Connectivity().onConnectivityChanged.listen(connectivityChanged);
    checkConnectivity();
  }

  void connectivityChanged(List<ConnectivityResult> result) {
    print('connectivityChanged to $result');

    var value = Connection.Disconnected;

    if (result.contains(ConnectivityResult.wifi)) {
      value = Connection.Wifi;
    } else if (result.contains(ConnectivityResult.mobile)) {
      value = Connection.MobileData;
    }

    setConnection(value);
  }

  void setConnection(Connection value) {
    if (value != connection) {
      offline = value != Connection.MobileData && value != Connection.Wifi;
      connection = value;
      notifyListeners();
    }
  }

  Future<void> checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    connectivityChanged(result);
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }
}
