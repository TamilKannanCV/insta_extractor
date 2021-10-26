import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insta_extractor/insta_extractor.dart';

void main() {
  const MethodChannel channel = MethodChannel('insta_extractor');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await InstaExtractor.platformVersion, '42');
  });
}
