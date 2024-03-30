import 'package:fluttery_dart2/framing.dart';
import 'package:test/test.dart';

void main() {
  test('How To: Generate Random Color', () {
    final randomColor = RandomColor.next();
    assert(randomColor.alpha == 0xFF);
  });
}
