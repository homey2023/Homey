class Realter {
  String name;
  int career;
  List<String> merits;
  int rating;
  List<String> review;

  Realter({
    required this.name,
    required this.career,
    required this.merits,
    required this.rating,
    required this.review,
  });

  factory Realter.fromJson(Map<String, dynamic> json) {
    return Realter(
      name: json['name'],
      career: json['career'],
      merits: List<String>.from(json['merits']),
      rating: json['rating'],
      review: List<String>.from(json['review']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['career'] = career;
    data['merits'] = merits;
    data['rating'] = rating;
    data['review'] = review;
    return data;
  }
}
