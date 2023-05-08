import 'realter.dart';

class Agency {
  final String name;
  final List<Realter> realters;
  final List<String> merits;
  final int rating;
  final List<String> review;
  final String picture;
  final double safeGrade;

  Agency({
    required this.name,
    required this.realters,
    required this.merits,
    required this.rating,
    required this.review,
    required this.picture,
    required this.safeGrade,
  });
}
