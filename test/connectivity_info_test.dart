import 'package:connectivity_info/connectivity_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'connectivity_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late ConnectivityInfo connectivityInfo;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    connectivityInfo = ConnectivityInfo();
  });

  group('isConnected', () {
    test('should forward the call to InternetConnectionChecker.hasConnection',
        () async {
      // Arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      // Act
      final result = await connectivityInfo.isConnected;

      // Assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, await tHasConnectionFuture);
    });
  });
}
