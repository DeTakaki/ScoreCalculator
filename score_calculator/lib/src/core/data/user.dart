class User {
  const User({
    required this.annualIncome,
    required this.montlyCosts,
  });

  final double annualIncome;
  final double montlyCosts;

  double _annualNetIncome() {
    return annualIncome * 0.8;
  }

  ({String title, String health, double score}) healthStatus() {
    final annualCosts = montlyCosts * 12;
    final annualCostsRate = annualCosts / _annualNetIncome();
    if (annualCostsRate <= 0.25) {
      return (title: 'Congratulations!', health: 'Healthy.', score: 1);
    } else if (annualCostsRate <= 0.75) {
      return (
        title: 'There is room for improvement.',
        health: 'Average.',
        score: 0.66
      );
    } else {
      return (title: 'Caution!', health: 'Unhealthy.', score: 0.33);
    }
  }
}
