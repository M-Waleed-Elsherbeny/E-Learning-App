class CourseVideosModel {
  final String id, title, desc, videoUrl;
  CourseVideosModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.videoUrl,
  });

  factory CourseVideosModel.fromSupabase(Map<String, dynamic> json) {
    return CourseVideosModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      desc: json['desc'] ?? "",
      videoUrl: json['video_url'] ?? "",
    );
  }
}