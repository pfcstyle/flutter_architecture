
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('Some description', (tester) async {
//     await tester.pumpWidget(
//       const ProviderScope(
//         overrides: [
//           // Same as before
//           exampleProvider.overrideWith((ref) => 'Hello from tests'),
//         ],
//         child: YourWidgetYouWantToTest()
//         ),
//     );

//     final element = tester.element(find.byType(YourWidgetYouWantToTest));
//     final container = ProviderScope.containerOf(element);

//     // TODO interact with your providers
//     expect(
//       container.read(provider),
//       'some value',
//     );
//   });
// }