import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:e_learning_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo {
  final supabase = Supabase.instance.client;
  List<CourseModel> courses = [];
  Future<Either<String, List<CourseModel>>> getMyCourses() async {
    try {
      final res = await supabase
          .from("enrollments")
          .select("courses(*)")
          .eq("user_id", userId!);
      courses.clear();
      for (var course in res) {
        courses.add(CourseModel.fromJson(course["courses"]));
      }
      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}

/*
[
  {
  courses: {
  id: a8f7805d-4684-4612-bd65-ba1b2308089a, 
  desc: 
        Welcome to the best and most industry-oriented hands-on course on Google Flutter and Dart by Coding Liquids where you’ll start from scratch and go step by step to become an industry-standard Flutter developer.
        
        Covering all the fundamental concepts for Flutter development, this is the most comprehensive production-grade Flutter course available online.
        
        We built this course over a year, perfecting the curriculum together with the industry standards to teach you Flutter from scratch and make you into a skilled Flutter developer with a strong portfolio of beautiful Flutter apps.
        
        Here you’ll learn to use Flutter, Dart, and Firebase to build beautiful, high-performance production-grade apps for Android, iOS, and the web.
        
        By the end of this course, you will be able to master topics like Layouts, animations, responsive handling, Streams, Future, Riverpod, Firebase, design patterns, and much more to develop apps that meet industry standards and get Google Flutter developer jobs.
        
        Major companies such as BMW, Ali Baba, eBay, Tencent, Toyota, Google, and many more are using Flutter for developing their apps. The demand is high but the supply of developers is low, so this creates the perfect opportunity for you to learn about this trending topic which is Flutter!
        
        Having compiled over 2000 Flutter job descriptions, we are fully aware of the qualifications needed to become a skilled and well-paid Google Flutter developer. We created this flutter course for anyone who wants to develop and release high-performance production-grade apps for Android, iOS, and the web all at once. What distinguishes this flutter course from others is its industry standards. Your flutter app may not be collaboration-friendly or may consume excessive power with the OS shutting the app down, making the app useless. However, similar disasters can be avoided with the right industry standards., 
        image: https://prod-provider-images.s3.amazonaws.com/program_images/6AHrw3LAU7/flutter.png, 
        price: 250, 
        title: Flutter Course, 
        created_at: 2026-03-01T09:21:25.93758+00:00
    }
    }
  ]
 */
