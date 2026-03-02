import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Either<String, void>> enrollInCourse(courseId, userId) async {
    try {
      await supabase.from('enrollments').insert({
        'course_id': courseId,
        'user_id': userId,
      });
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> checkEnrollment({
    required courseId,
    required userId,
  }) async {
    try {
      final res = await supabase
          .from("enrollments")
          .select()
          .eq("course_id", courseId)
          .eq("user_id", userId)
          .maybeSingle();
      return right(res != null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
