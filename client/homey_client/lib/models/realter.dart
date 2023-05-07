class Realter {
  final String name;
  final int career;
  final String email;
  final String picture;

  Realter({
    required this.name,
    required this.career,
    required this.email,
    required this.picture,
  });

  factory Realter.fromJson(Map<String, dynamic> json) {
    return Realter(
      name: json['name'],
      career: json['career'],
      email: json['email'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['career'] = career;
    data['email'] = email;
    data['picture'] = picture;
    return data;
  }
}
