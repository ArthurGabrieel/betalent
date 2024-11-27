extension StringHelper on String {
  String formatPhoneNumber() {
    if (length != 13) {
      throw const FormatException(
          'O número de telefone deve ter 13 dígitos (código do país + DDD + número).',);
    }

    final countryCode = substring(0, 2);
    final ddd = substring(2, 4);
    final prefix = substring(4, 9);
    final suffix = substring(9);

    return '+$countryCode ($ddd) $prefix-$suffix';
  }
}
