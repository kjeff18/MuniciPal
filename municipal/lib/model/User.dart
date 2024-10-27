class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  }); 

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'], 
      lastName: json ['lastName'],
      email: json['email'],
    );
  }
    
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName, 
      'lastName' : lastName,
      'email': email,
    };
  }
}
