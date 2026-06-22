class ActivityModel {
  final String title;
  final String description;
  final String date;

  ActivityModel({
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
    };
  }
}