import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo {
  List<CourseModel> courses = [];
  SupabaseClient get supabase => Supabase.instance.client;

  Future<Either<String, List<CourseModel>>> getCourses() async {
    try {
      final res = await supabase.from("courses").select();
      courses.clear();
      for (var course in res) {
        courses.add(CourseModel.fromJson(course));
      }
      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}
