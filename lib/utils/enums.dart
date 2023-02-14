enum IncomeTaxUnMarried {
  onePercent(1, 1, 500000),
  tenPercent(10, 5000001, 700000),
  twentyPercent(20, 700001, 1000000),
  thirtyPercent(30, 1000001, 2000000),
  thirtySixPercent(36, 2000001, 1000000000000000000);

  final double slab;
  final double to;
  final double percentage;
  const IncomeTaxUnMarried(this.percentage, this.slab, this.to);
}

enum IncomeTaxMarried {
  onePercent(1, 1, 600000),
  tenPercent(10, 6000001, 800000),
  twentyPercent(20, 800001, 1100000),
  thirtyPercent(30, 1200001, 2000000),
  thirtySixPercent(36, 2000001, 1000000000000000000);

  final double slab;
  final double to;
  final double percentage;
  const IncomeTaxMarried(this.percentage, this.slab, this.to);
}
