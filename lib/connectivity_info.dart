library connectivity_info;

import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityInfo extends Equatable {
  static final _internetConnectionChecker = InternetConnectionChecker();

  ConnectivityInfo() {
    _internetConnectionChecker.addresses = [
      AddressCheckOptions(hostname: 'google.com', port: 80),
    ];
  }

  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  List<Object?> get props => [_internetConnectionChecker];
}
