class SignUpData {
  String firstName = '';
  String lastName = '';
  String street = '';
  String city = '';
  String state = '';
  String zipCode = '';
  String email = '';
  String password = '';

  String get formattedAddress {
    List<String> addressComponents = [
      street,
      city,
      state,
      zipCode,
    ];

    // Filter out empty fields to avoid extra spaces or commas
    return addressComponents
        .where((component) => component.isNotEmpty)
        .join(', ');
  }
}
