import 'package:flutter_football_test/bloc/winner_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WinnerStatusX ', () {
    test('returns correct values for WinnerStatus.isInitial', () {
      const status = WinnerStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for WinnerStatus.isLoading', () {
      const status = WinnerStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
    });

    test('returns correct values for WinnerStatus.isSuccess', () {
      const status = WinnerStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isError, isFalse);
    });

    test('returns correct values for WinnerStatus.isError', () {
      const status = WinnerStatus.error;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isTrue);
    });
  });
}
