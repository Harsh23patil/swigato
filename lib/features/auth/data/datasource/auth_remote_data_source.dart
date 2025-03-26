import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swigato/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginUpWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> loginUpWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final responce = await supabaseClient.auth
          .signUp(email: email, password: password, data: {
        "name": name,
      });

      if (responce.user != null) {
        throw const ServerException("message");
      }
      return responce.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
