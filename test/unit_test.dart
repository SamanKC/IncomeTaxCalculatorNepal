import '../lib/controller/function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Individual Testing
  group('Individual Testing', () {
    test('Individual Testing 1',
        () => expect(taxCalculateIndividual(1000), [10.0]));
    test('Individual Testing 2',
        () => expect(taxCalculateIndividual(500001), [5000.0, 0.1]));
    test('Individual Testing 3',
        () => expect(taxCalculateIndividual(700001), [5000.0, 20000.0, 0.2]));
    test(
        'Individual Testing 4',
        () => expect(
            taxCalculateIndividual(1000001), [5000.0, 20000.0, 60000.0, 0.3]));
    test(
        'Individual Testing 5',
        () => expect(taxCalculateIndividual(2000001),
            [5000.0, 20000.0, 60000.0, 300000.0, 0.36]));
    test(
        'Individual Testing 6',
        () => expect(taxCalculateIndividual(2500000),
            [5000.0, 20000.0, 60000.0, 300000.0, 180000.0]));
    test('Individual Testing 7',
        () => expect(taxCalculateIndividual(300000), [3000.0]));
    test(
        'Individual Testing 8',
        () => expect(taxCalculateIndividual(8500000),
            [5000.0, 20000.0, 60000.0, 300000.0, 2340000.0]));
    test(
        'Individual Testing 9',
        () => expect(taxCalculateIndividual(97000000),
            [5000.0, 20000.0, 60000.0, 300000.0, 34200000.0]));
    test(
        'Individual Testing 10',
        () => expect(taxCalculateIndividual(4588000),
            [5000.0, 20000.0, 60000.0, 300000.0, 931680.0]));
    test(
        'Individual Testing 11',
        () => expect(taxCalculateIndividual(2008500),
            [5000.0, 20000.0, 60000.0, 300000.0, 3060.0]));
    test(
        'Individual Testing 12',
        () => expect(taxCalculateIndividual(2500000),
            [5000.0, 20000.0, 60000.0, 300000.0, 180000.0]));
    test(
        'Individual Testing 13',
        () => expect(taxCalculateIndividual(900000000),
            [5000.0, 20000.0, 60000.0, 300000.0, 323280000.0]));
    test('Individual Testing 14',
        () => expect(taxCalculateIndividual(500000), [5000.0]));
    test(
        'Individual Testing 15',
        () =>
            expect(taxCalculateIndividual(715000), [5000.0, 20000.0, 3000.0]));
    test(
        'Individual Testing 16',
        () => expect(taxCalculateIndividual(1225000),
            [5000.0, 20000.0, 60000.0, 67500.0]));
    test(
        'Individual Testing 17',
        () => expect(taxCalculateIndividual(1921000),
            [5000.0, 20000.0, 60000.0, 276300.0]));
    test(
        'Individual Testing 18',
        () => expect(taxCalculateIndividual(2500000),
            [5000.0, 20000.0, 60000.0, 300000.0, 180000.0]));
    test(
        'Individual Testing 19',
        () => expect(taxCalculateIndividual(7523000),
            [5000.0, 20000.0, 60000.0, 300000.0, 1988280.0]));
    test(
        'Individual Testing 20',
        () => expect(taxCalculateIndividual(8452200),
            [5000.0, 20000.0, 60000.0, 300000.0, 2322792.0]));
  });

//Couple Testing
  group('Couple Testing', () {
    test('Couple Testing 1', () => expect(taxCalculateCouple(1000), [10.0]));
    test(
        'Couple Testing 2', () => expect(taxCalculateCouple(500000), [5000.0]));
    test('Couple Testing 3',
        () => expect(taxCalculateCouple(715000), [6000.0, 11500.0]));
    test(
        'Couple Testing 4',
        () => expect(
            taxCalculateCouple(1225000), [6000.0, 20000.0, 60000.0, 37500.0]));
    test(
        'Couple Testing 5',
        () => expect(
            taxCalculateCouple(1921000), [6000.0, 20000.0, 60000.0, 246300.0]));
    test(
        'Couple Testing 6',
        () => expect(taxCalculateCouple(2500000),
            [6000.0, 30000.0, 60000.0, 270000.0, 180000.0]));

    test(
        'Couple Testing 7', () => expect(taxCalculateCouple(300000), [3000.0]));
    test(
        'Couple Testing 8',
        () => expect(taxCalculateCouple(8500000),
            [6000.0, 30000.0, 60000.0, 270000.0, 2340000.0]));
    test(
        'Couple Testing 9',
        () => expect(taxCalculateCouple(97000000),
            [6000.0, 30000.0, 60000.0, 270000.0, 34200000.0]));
    test(
        'Couple Testing 10',
        () => expect(taxCalculateCouple(4588000),
            [6000.0, 30000.0, 60000.0, 270000.0, 931680.0]));
    test(
        'Couple Testing 11',
        () => expect(taxCalculateCouple(2008500),
            [6000.0, 30000.0, 60000.0, 270000.0, 3060.0]));
    test(
        'Couple Testing 12',
        () => expect(taxCalculateCouple(2500000),
            [6000.0, 30000.0, 60000.0, 270000.0, 180000.0]));
    test(
        'Couple Testing 13',
        () => expect(taxCalculateCouple(900000000),
            [6000.0, 30000.0, 60000.0, 270000.0, 323280000.0]));
    test('Couple Testing 14',
        () => expect(taxCalculateCouple(500000), [5000.0]));
    test('Couple Testing 15',
        () => expect(taxCalculateCouple(715000), [6000.0, 11500.0]));
    test(
        'Couple Testing 16',
        () => expect(
            taxCalculateCouple(1225000), [6000.0, 20000.0, 60000.0, 37500.0]));
    test(
        'Couple Testing 17',
        () => expect(
            taxCalculateCouple(1921000), [6000.0, 20000.0, 60000.0, 246300.0]));
    test(
        'Couple Testing 18',
        () => expect(taxCalculateCouple(2500000),
            [6000.0, 30000.0, 60000.0, 270000.0, 180000.0]));
    test(
        'Couple Testing 19',
        () => expect(taxCalculateCouple(7523000),
            [6000.0, 30000.0, 60000.0, 270000.0, 1988280.0]));
    test(
        'Couple Testing 20',
        () => expect(taxCalculateCouple(8452200),
            [6000.0, 30000.0, 60000.0, 270000.0, 2322792.0]));
  });
}
