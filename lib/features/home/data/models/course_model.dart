class CourseModel {
  final String id, title, desc, image;
  final num price;

  CourseModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      desc: json['desc'] ?? "",
      image: json['image'] ?? "",

      price: json['price'].toDouble(),
    );
  }
}