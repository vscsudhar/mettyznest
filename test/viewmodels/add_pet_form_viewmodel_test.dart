import 'package:flutter_test/flutter_test.dart';
import 'package:mettyznest/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddPetFormViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
