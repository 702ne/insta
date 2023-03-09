Map<String, int> romanMap = {
  'I': 1,
  'V': 5,
  'X': 10,
  'L': 50,
  'C': 100,
  'D': 500,
  'M': 1000,
};

int romanToArabic(String romanNumeral) {
  int result = 0;
  int prevValue = 0;
  int currentValue = 0;
  for (int i = romanNumeral.length - 1; i >= 0; i--) {
    currentValue = romanMap[romanNumeral[i]]!;
    if (currentValue < prevValue) {
      result -= currentValue;
    } else {
      result += currentValue;
    }
    prevValue = currentValue;
  }
  return result;
}

void main(List<String> args) {
  print(romanToArabic(args[0])); // Output: 14
}
