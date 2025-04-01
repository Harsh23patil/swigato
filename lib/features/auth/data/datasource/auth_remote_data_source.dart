import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swigato/core/error/exceptions.dart';
import 'package:swigato/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginUpWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> loginUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final responce = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (responce.user == null) {
        // throw const ServerException("message");
        throw const ServerException("User is null");
      }
      // return responce.user?;
      return UserModel.fromJson(responce.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final responce = await supabaseClient.auth
          .signUp(email: email, password: password, data: {
        "name": name,
      });
      if (responce.user == null) {
        // throw const ServerException("message");
        throw const ServerException("User is null");
      }
      // return responce.user?;
      return UserModel.fromJson(responce.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
