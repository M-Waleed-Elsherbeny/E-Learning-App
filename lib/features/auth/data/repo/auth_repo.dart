import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  Future<Either<String, void>> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      await supabaseClient.auth.signUp(email: email, password: password);
      await saveUser(email: email, name: name);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(null);
    } on AuthException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> saveUser({
    required String email,
    required String name,
  }) async {
    try {
      await supabaseClient.from('users').insert({
        'id': supabaseClient.auth.currentUser!.id,
        'name': name,
        'email': email,
      });
      return right(null);
    } on AuthException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      return right(null);
    } on AuthException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
