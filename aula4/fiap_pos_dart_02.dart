library math_utils;

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) return 0.0;
  return numbers.reduce((a, b) => a + b) / numbers.length;
}
