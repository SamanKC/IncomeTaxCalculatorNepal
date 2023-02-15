
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   //Individual Testing
//   group('Individual Testing', () {
//     test('Individual Testing 1',
//         () => expect(calculateUnMarried(1000), [10.0, 1.0, 990.0]));
//     test('Individual Testing 2',
//         () => expect(calculateUnMarried(500000), [5000.0, 1.0, 495000.0]));
//     test('Individual Testing 3',
//         () => expect(calculateUnMarried(715000), [28000.0, 20.0, 687000.0]));
//     test('Individual Testing 4',
//         () => expect(calculateUnMarried(1225000), [152500.0, 30.0, 1072500.0]));
//     test('Individual Testing 5',
//         () => expect(calculateUnMarried(1921000), [361300.0, 30.0, 1559700.0]));
//     test('Individual Testing 6',
//         () => expect(calculateUnMarried(2500000), [565000.0, 30.0, 1935000.0]));
//     test('Individual Testing 7',
//         () => expect(calculateUnMarried(300000), [3000.0, 1.0, 297000.0]));
//     test(
//         'Individual Testing 8',
//         () =>
//             expect(calculateUnMarried(8500000), [2725000.0, 30.0, 5775000.0]));
//     test(
//         'Individual Testing 9',
//         () => expect(
//             calculateUnMarried(97000000), [34585000.0, 30.0, 62415000.0]));
//     test(
//         'Individual Testing 10',
//         () =>
//             expect(calculateUnMarried(4588000), [1316680.0, 30.0, 3271320.0]));
//     test('Individual Testing 11',
//         () => expect(calculateUnMarried(2008500), [388060.0, 30.0, 1620440.0]));
//     test('Individual Testing 12',
//         () => expect(calculateUnMarried(2500000), [565000.0, 30.0, 1935000.0]));
//     test(
//         'Individual Testing 13',
//         () => expect(
//             calculateUnMarried(900000000), [323665000.0, 30.0, 576335000.0]));
//     test('Individual Testing 14',
//         () => expect(calculateUnMarried(500000), [5000.0, 1.0, 495000.0]));
//     test('Individual Testing 15',
//         () => expect(calculateUnMarried(715000), [28000.0, 20.0, 687000.0]));
//     test('Individual Testing 16',
//         () => expect(calculateUnMarried(1225000), [152500.0, 30.0, 1072500.0]));
//     test('Individual Testing 17',
//         () => expect(calculateUnMarried(1921000), [361300.0, 30.0, 1559700.0]));
//     test('Individual Testing 18',
//         () => expect(calculateUnMarried(2500000), [565000.0, 30.0, 1935000.0]));
//     test(
//         'Individual Testing 19',
//         () =>
//             expect(calculateUnMarried(7523000), [2373280.0, 30.0, 5149720.0]));
//     test(
//         'Individual Testing 20',
//         () =>
//             expect(calculateUnMarried(8452200), [2707792.0, 30.0, 5744408.0]));
//   });

// //Couple Testing
//   group('Couple Testing', () {
//     test('Couple Testing 1',
//         () => expect(calculateMarried(1000), [10.0, 1.0, 990.0]));
//     test('Couple Testing 2',
//         () => expect(calculateMarried(500000), [5000.0, 1.0, 495000.0]));
//     test('Couple Testing 3',
//         () => expect(calculateMarried(715000), [17500.0, 10.0, 697500.0]));
//     test('Couple Testing 4',
//         () => expect(calculateMarried(1225000), [123500.0, 30.0, 1101500.0]));
//     test('Couple Testing 5',
//         () => expect(calculateMarried(1921000), [332300.0, 30.0, 1588700.0]));
//     test('Couple Testing 6',
//         () => expect(calculateMarried(2500000), [536000.0, 36.0, 1964000.0]));

//     test('Couple Testing 7',
//         () => expect(calculateMarried(300000), [3000.0, 1.0, 297000.0]));
//     test('Couple Testing 8',
//         () => expect(calculateMarried(8500000), [2696000.0, 36.0, 5804000.0]));
//     test(
//         'Couple Testing 9',
//         () =>
//             expect(calculateMarried(97000000), [34556000.0, 36.0, 62444000.0]));
//     test('Couple Testing 10',
//         () => expect(calculateMarried(4588000), [1287680.0, 36.0, 3300320.0]));
//     test('Couple Testing 11',
//         () => expect(calculateMarried(2008500), [359060.0, 36.0, 1649440.0]));
//     test('Couple Testing 12',
//         () => expect(calculateMarried(2500000), [536000.0, 36.0, 1964000.0]));
//     test(
//         'Couple Testing 13',
//         () => expect(
//             calculateMarried(900000000), [323636000.0, 36.0, 576364000.0]));
//     test('Couple Testing 14',
//         () => expect(calculateMarried(500000), [5000.0, 1.0, 495000.0]));
//     test('Couple Testing 15',
//         () => expect(calculateMarried(715000), [17500.0, 10.0, 697500.0]));
//     test('Couple Testing 16',
//         () => expect(calculateMarried(1225000), [123500.0, 30.0, 1101500.0]));
//     test('Couple Testing 17',
//         () => expect(calculateMarried(1921000), [332300.0, 30.0, 1588700.0]));
//     test('Couple Testing 18',
//         () => expect(calculateMarried(2500000), [536000.0, 36.0, 1964000.0]));
//     test('Couple Testing 19',
//         () => expect(calculateMarried(7523000), [2344280.0, 36.0, 5178720.0]));
//     test('Couple Testing 20',
//         () => expect(calculateMarried(8452200), [2678792.0, 36.0, 5773408.0]));
//   });
// }
