class NoParams {}

class RideProviderParams {
  final String id;

  const RideProviderParams({
    required this.id,
  });
}

class ShiftParams {
  final DateTime start;
  final DateTime end;
  final double km;
  final double fuelPrice;
  final double totalIncomeBlack;
  final double totalIncome;
  final double totalFpa;
  final double totalRides;

  const ShiftParams({
    required this.start,
    required this.end,
    this.km = 0,
    this.fuelPrice = 0,
    this.totalIncomeBlack = 0,
    this.totalIncome = 0,
    this.totalFpa = 0,
    this.totalRides = 0,
  });
}
