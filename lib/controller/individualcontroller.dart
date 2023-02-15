import '../utils/enums.dart';

calculateUnMarried(double salary) {
  double? tax;
  double? taxPercentage;
  List<double> taxableAmount = [];
  if (salary <= IncomeTaxUnMarried.onePercent.to) {
    taxPercentage = IncomeTaxUnMarried.onePercent.percentage;
    tax = salary * IncomeTaxUnMarried.onePercent.percentage / 100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxUnMarried.onePercent.to &&
      salary <= IncomeTaxUnMarried.tenPercent.to) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.tenPercent.percentage;

    tax = (salary - IncomeTaxUnMarried.onePercent.to) * 10 / 100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxUnMarried.tenPercent.to &&
      salary <= IncomeTaxUnMarried.twentyPercent.to) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    tenPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.twentyPercent.percentage;

    tax = (salary - IncomeTaxUnMarried.tenPercent.to) * 20 / 100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxUnMarried.twentyPercent.to &&
      salary <= IncomeTaxUnMarried.thirtyPercent.to) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    tenPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    twentyPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.thirtyPercent.percentage;

    tax = (salary - IncomeTaxUnMarried.twentyPercent.to) * 30 / 100;
    taxableAmount.add(tax);
  } else if (salary > IncomeTaxUnMarried.thirtySixPercent.slab) {
    onePercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    tenPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    twentyPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);

    thirtyPercent(tax: tax, salary: salary, taxableAmount: taxableAmount);
    taxPercentage = IncomeTaxUnMarried.thirtyPercent.percentage;

    tax = (salary - IncomeTaxUnMarried.thirtyPercent.to) * 36 / 100;
    taxableAmount.add(tax);
  }

  final double result = taxableAmount.fold(0, (sum, element) => sum + element);
  final salaryAfterTax = salary - result;
  return [result, taxPercentage, salaryAfterTax];
}

onePercent({required tax, required salary, required taxableAmount}) {
  tax = IncomeTaxUnMarried.onePercent.to *
      IncomeTaxUnMarried.onePercent.percentage /
      100;
  taxableAmount.add(tax);
}

tenPercent({required tax, required salary, required taxableAmount}) {
  tax = 200000 * IncomeTaxUnMarried.tenPercent.percentage / 100;
  taxableAmount.add(tax);
}

twentyPercent({required tax, required salary, required taxableAmount}) {
  tax = 300000 * IncomeTaxUnMarried.twentyPercent.percentage / 100;
  taxableAmount.add(tax);
}

thirtyPercent({required tax, required salary, required taxableAmount}) {
  tax = 1000000 * IncomeTaxUnMarried.thirtyPercent.percentage / 100;
  taxableAmount.add(tax);
}
