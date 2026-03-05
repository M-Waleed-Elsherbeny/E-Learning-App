import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepo {
  final supabase = Supabase.instance.client;

  Future<Either<String, void>> signOut() async {
    try {
      await supabase.auth.signOut();
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>> getUserName() async {
    try {
      final String userId = supabase.auth.currentUser!.id;
      final res = await supabase
          .from("users")
          .select()
          .eq("id", userId)
          .single();
      return right(res);
    } catch (e) {
      return left(e.toString());
    }
  }
}
