import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/my_courses_videos/data/model/course_videos_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseVideosRepo {
  final sup = Supabase.instance.client;

  Future<Either<String, List<CourseVideosModel>>> getCourseVideos(
    String courseId,
  ) async {
    try {
      final res = await sup.from("videos").select().eq("course_id", courseId);
      List<CourseVideosModel> videos = [];
      for (var video in res) {
        videos.add(CourseVideosModel.fromSupabase(video));
      }
      return Right(videos);
    } catch (e) {
      return const Left("Failed to fetch course videos");
    }
  }
}
