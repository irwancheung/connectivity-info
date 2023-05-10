library connectivity_info;

import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityInfo extends Equatable {
  static final _internetConnectionChecker = InternetConnectionCheckerPlus();

  ConnectivityInfo() {
    _internetConnectionChecker.addresses = [
      AddressCheckOptions(Uri(scheme: 'https', host: 'google.com')),
    ];
  }

  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  List<Object?> get props => [_internetConnectionChecker];
}
