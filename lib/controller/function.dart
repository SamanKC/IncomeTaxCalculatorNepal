List<double> taxCalculateIndividual(yearlyIncome) {
  List<double> tax = [];
  if (yearlyIncome <= 500000) {
    tax.add(yearlyIncome * 0.01);
  } else if (yearlyIncome <= 800000) {
    tax.add(500000 * 0.01);
    tax.add((yearlyIncome - 500000) * 0.1);
  } else if (yearlyIncome <= 1100000) {
    tax.add(500000 * 0.01);
    tax.add((800000 - 500000) * 0.1);
    tax.add((yearlyIncome - 800000) * 0.2);
  } else if (yearlyIncome <= 2000000) {
    tax.add(500000 * 0.01);
    tax.add((800000 - 500000) * 0.1);
    tax.add((1100000 - 800000) * 0.2);
    tax.add((yearlyIncome - 1100000) * 0.3);
  } else if (yearlyIncome > 2000000) {
    tax.add(500000 * 0.01);
    tax.add((800000 - 500000) * 0.1);
    tax.add((1100000 - 800000) * 0.2);
    tax.add((2000000 - 1100000) * 0.3);
    tax.add((yearlyIncome - 2000000) * 0.36);
  } else {
    throw Exception("Invalid Input");
  }
  return tax;
}

List<double> taxCalculateCouple(yearlyIncome) {
  List<double> tax = [];
  if (yearlyIncome <= 600000) {
    tax.add(yearlyIncome * 0.01);
  } else if (yearlyIncome <= 800000) {
    tax.add(600000 * 0.01);
    tax.add((yearlyIncome - 600000) * 0.1);
  } else if (yearlyIncome <= 1100000) {
    tax.add(600000 * 0.01);
    tax.add((800000 - 600000) * 0.1);
    tax.add((yearlyIncome - 800000) * 0.2);
  } else if (yearlyIncome <= 2000000) {
    tax.add(600000 * 0.01);
    tax.add((800000 - 600000) * 0.1);
    tax.add((1100000 - 800000) * 0.2);
    tax.add((yearlyIncome - 1100000) * 0.3);
  } else if (yearlyIncome > 2000000) {
    tax.add(600000 * 0.01);
    tax.add((800000 - 500000) * 0.1);
    tax.add((1100000 - 800000) * 0.2);
    tax.add((2000000 - 1100000) * 0.3);
    tax.add((yearlyIncome - 2000000) * 0.36);
  } else {
    throw Exception("Invalid Input");
  }
  return tax;
}
