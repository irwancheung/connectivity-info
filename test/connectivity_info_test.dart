import 'package:connectivity_info/connectivity_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'connectivity_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionCheckerPlus>()])
void main() {
  late MockInternetConnectionCheckerPlus mockInternetConnectionCheckerPlus;
  late ConnectivityInfo connectivityInfo;

  setUp(() {
    mockInternetConnectionCheckerPlus = MockInternetConnectionCheckerPlus();
    connectivityInfo = ConnectivityInfo();
  });

  group('isConnected', () {
    test('should forward the call to InternetConnectionChecker.hasConnection',
        () async {
      // Arrange
      when(mockInternetConnectionCheckerPlus.hasConnection)
          .thenAnswer((_) async => true);

      // Act
      final result = await connectivityInfo.isConnected;

      // Assert
      expect(result, true);
    });
  });
}
