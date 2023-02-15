import '../utils/enums.dart';

calculateMarried(double salary) {
  double? tax;
  double? taxPercentage;
  List<double> taxableAmount = [];
  if (salary <= IncomeTaxMarried.onePercent.to) {
    taxPercentage = IncomeTaxUnMarried.onePercent.percentage;
    tax = salary * IncomeTaxMarried.onePercent.percentage / 100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxMarried.onePercent.to &&
      salary <= IncomeTaxMarried.tenPercent.to) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.tenPercent.percentage;
    tax = (salary - IncomeTaxMarried.onePercent.to) *
        IncomeTaxMarried.tenPercent.percentage /
        100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxMarried.tenPercent.to &&
      salary <= IncomeTaxMarried.twentyPercent.to) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    taxPercentage = IncomeTaxUnMarried.twentyPercent.percentage;
    tenPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    tax = (salary - IncomeTaxMarried.tenPercent.to) *
        IncomeTaxMarried.twentyPercent.percentage /
        100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxMarried.twentyPercent.to &&
      salary <= IncomeTaxMarried.thirtyPercent.to) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    tenPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    twentyPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.thirtyPercent.percentage;
    tax = (salary - IncomeTaxMarried.twentyPercent.to) *
        IncomeTaxMarried.thirtyPercent.percentage /
        100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxMarried.thirtySixPercent.slab) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    tenPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    twentyPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    thirtyPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.thirtySixPercent.percentage;
    tax = (salary - IncomeTaxMarried.thirtyPercent.to) *
        IncomeTaxMarried.thirtySixPercent.percentage /
        100;
    taxableAmount.add(tax);
  }

  final double result = taxableAmount.fold(0, (sum, element) => sum + element);
  final salaryAfterTax = salary - result;
  return [result, taxPercentage, salaryAfterTax];
}

onePercent({required tax, required salary, required taxableAmount}) {
  tax = IncomeTaxMarried.onePercent.to *
      IncomeTaxMarried.onePercent.percentage /
      100;
  taxableAmount.add(tax);
}

tenPercent({required tax, required salary, required taxableAmount}) {
  tax = 200000 * IncomeTaxMarried.tenPercent.percentage / 100;
  taxableAmount.add(tax);
}

twentyPercent({required tax, required salary, required taxableAmount}) {
  tax = 300000 * IncomeTaxMarried.twentyPercent.percentage / 100;
  taxableAmount.add(tax);
}

thirtyPercent({required tax, required salary, required taxableAmount}) {
  tax = 900000 * IncomeTaxMarried.thirtyPercent.percentage / 100;
  taxableAmount.add(tax);
}
