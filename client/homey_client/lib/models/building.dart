class Building {
  final String? name;
  final List? imageList;
  final double? safeLevel;

  Building({this.name, this.imageList, this.safeLevel});

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      name: json['name'],
      imageList: json['imageList'],
      safeLevel: json['safeLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['imageList'] = imageList;
    data['safeLevel'] = safeLevel;
    return data;
  }
}
