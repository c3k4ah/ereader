//int extension covert integer to roman number

extension IntExtension on int {
  String toRoman() {
    if (this < 1 || this > 3999) {
      throw Exception('Roman numbers are between 1 and 3999');
    }
    final roman = StringBuffer();
    var number = this;
    for (final item in _romanNumerals.entries) {
      while (number >= item.value) {
        roman.write(item.key);
        number -= item.value;
      }
    }
    return roman.toString();
  }
}

const _romanNumerals = {
  'M': 1000,
  'CM': 900,
  'D': 500,
  'CD': 400,
  'C': 100,
  'XC': 90,
  'L': 50,
  'XL': 40,
  'X': 10,
  'IX': 9,
  'V': 5,
  'IV': 4,
  'I': 1,
};
