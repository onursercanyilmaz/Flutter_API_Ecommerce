class User {
  final String authorization;
  final bool success;

  User({
    required this.authorization,
    required this.success,
  });


  User.formJsonMap(Map json)
      : authorization = json['authToken'],
        success = json['success'];
}
