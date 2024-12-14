import 'dart:math';

class LoanCalculator {
  static double calculateMonthlyPayment(
      double totalAmount, double downPayment, int months, double interestRate) {
    double loanAmount = totalAmount - downPayment;
    double monthlyInterestRate = interestRate / 12 / 100;
    
    double numerator = loanAmount * monthlyInterestRate * 
                      pow(1 + monthlyInterestRate, months);
    double denominator = pow(1 + monthlyInterestRate, months) - 1;
    
    return numerator / denominator;
  }
}