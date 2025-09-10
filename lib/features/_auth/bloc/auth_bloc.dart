import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/features/_auth/model/auth_model.dart';
import 'package:archtech/features/_auth/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiConsumer _apiConsumer;
  final CacheHelper _cacheHelper;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthBloc(
    this._apiConsumer,
    this._cacheHelper,
  ) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.whenOrNull(
        register: (role) async {
          emit(const AuthState.loading());
          try {
            final responses = await _apiConsumer.post(EndPoints.register,
                body: _authModel(role: role).toJson());
            if (responses.isSuccessful) {
              final List<dynamic> data = responses.data['data'];
              final user = UserModel.fromJson(data.first);
              await messaging.subscribeToTopic('global_notifications');
              emit(AuthState.loaded(user));
            }
          } on ApiException catch (error) {
            debugPrint('error: ${error.messageKey}');
            emit(AuthState.error(error.messageKey));
          } catch (error) {
            print(error);
            // Handle any other unexpected errors
            emit(const AuthState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        login: () async {
          emit(const AuthState.loading());
          try {
            final responses = await _apiConsumer.post(EndPoints.login,
                body: _authModel().toJson());
            if (responses.isSuccessful) {
              final user = await getUser(responses);

              emit(AuthState.loaded(user));
            }
          } on ApiException catch (error) {
            debugPrint('error: ${error.messageKey}');
            emit(AuthState.error(error.messageKey));
          } catch (error) {
            print(error);
            emit(const AuthState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        logout: () async {
          emit(const AuthState.loading());
          try {
            await _cacheHelper.removeSecureData(key: StringManager.tokenKey);
            await _cacheHelper.removeData(key: StringManager.userRole);
            SessionData.userModel = null;
            SessionData.isTourist = null;

            emit(const AuthState.singOut());
          } catch (error) {
            debugPrint('error: $error');
            emit(const AuthState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        loginWithGoogle: () async {
          emit(const AuthState.loading());
          try {
            await _googleSignIn.signOut();

            final GoogleSignInAccount? googleUser =
                await _googleSignIn.signIn();
            final GoogleSignInAuthentication? googleAuth =
                await googleUser?.authentication;

            // Create a new credential
            if (googleAuth == null) return null;
            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );

            // Once signed in, get the UserCredential
            final userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            final String accessToken = userCredential.credential!.accessToken!;
            if (googleUser != null) {
              final responses = await _apiConsumer
                  .post(EndPoints.loginWithGoogle, body: {
                'email': googleUser.email,
                'type': 'google',
                'token': accessToken
              });

              if (responses.isSuccessful) {
                final user = await getUser(responses);
                emit(AuthState.loaded(user));
              } else {
                emit(AuthState.error(responses.errorMessage));
              }
            }
          } on ApiException catch (error) {
            debugPrint('error: ${error.messageKey}');
            emit(AuthState.error(error.messageKey));
          } catch (error) {
            debugPrint('error: $error');
            emit(const AuthState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        registerWithGoogle: (role) async {
          emit(const AuthState.loading());
          try {
            await _googleSignIn.signOut();

            final GoogleSignInAccount? googleUser =
                await _googleSignIn.signIn();
            final GoogleSignInAuthentication? googleAuth =
                await googleUser?.authentication;

            // Create a new credential
            if (googleAuth == null) return null;
            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );

            // Once signed in, get the UserCredential
            final userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            final String accessToken = userCredential.credential!.accessToken!;
            if (googleUser != null) {
              print('msh null ya 3la');
              final responses =
                  await _apiConsumer.post(EndPoints.registerWithGoogle, body: {
                'email': googleUser.email,
                'name': googleUser.displayName,
                'role': role,
                'type': 'google',
                'token': accessToken
              });

              if (responses.isSuccessful) {
                await messaging.subscribeToTopic('global_notifications');
                await getUser(responses);
                emit(const AuthState.registerByGoogle());
              } else {
                emit(AuthState.error(responses.errorMessage));
              }
            }
          } on ApiException catch (error) {
            emit(AuthState.error(error.messageKey));
          } catch (error) {
            debugPrint('error: $error');
            emit(const AuthState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        deleteAccount: () async {
          emit(const AuthState.loading());
          try {
            final response = await _apiConsumer.delete(EndPoints.deleteAccount,
                formDataIsEnabled: false);
            if (response.isSuccessful) {
              await _cacheHelper.removeSecureData(key: StringManager.tokenKey);
              await _cacheHelper.removeData(key: StringManager.userRole);
              SessionData.userModel = null;
            } else {
              emit(AuthState.error(response.errorMessage));
            }

            emit(const AuthState.singOut());
          } on ApiException catch (error) {
            debugPrint('error: $error');
            emit(const AuthState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        // loginWithApple: () async {
        //   emit(const AuthState.loading());
        //   try {
        //     final credential = await SignInWithApple.getAppleIDCredential(
        //       scopes: [
        //         AppleIDAuthorizationScopes.email,
        //         AppleIDAuthorizationScopes.fullName,
        //       ],
        //     );
        //
        //     final responses = await _apiConsumer.post(EndPoints.loginWithGoogle,
        //         body: {'token': credential.identityToken, 'type': 'apple'});
        //
        //     if (responses.isSuccessful) {
        //       final user = await getUser(responses);
        //       emit(AuthState.loaded(user));
        //     } else {
        //       emit(AuthState.error(responses.errorMessage));
        //     }
        //   } on ApiException catch (error) {
        //     debugPrint('error: ${error.messageKey}');
        //     emit(AuthState.error(error.messageKey));
        //   } catch (error) {
        //     debugPrint('error: $error');
        //     emit(const AuthState.error(
        //         'An unexpected error occurred. Please try again.'));
        //   }
        // },
        // registerWithApple: (role) async {
        //   emit(const AuthState.loading());
        //   try {
        //     final credential = await SignInWithApple.getAppleIDCredential(
        //       scopes: [
        //         AppleIDAuthorizationScopes.email,
        //         AppleIDAuthorizationScopes.fullName,
        //       ],
        //     );
        //
        //     final responses = await _apiConsumer
        //         .post(EndPoints.registerWithGoogle, body: {
        //       'token': credential.identityToken,
        //       'role': role,
        //       'type': 'apple'
        //     });
        //
        //     if (responses.isSuccessful) {
        //       await messaging.subscribeToTopic('global_notifications');
        //       await getUser(responses);
        //       emit(const AuthState.registerByGoogle());
        //     } else {
        //       emit(AuthState.error(responses.errorMessage));
        //     }
        //   } on ApiException catch (error) {
        //     emit(AuthState.error(error.messageKey));
        //   } catch (error) {
        //     debugPrint('error: $error');
        //     emit(const AuthState.error(
        //         'An unexpected error occurred. Please try again.'));
        //   }
        // },
      );
    });
  }

  AuthModel _authModel({String? role}) => AuthModel(
      email: email.text,
      password: password.text,
      name: name.text,
      role: role,
      confirmPassword: confirmPassword.text);

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    name.dispose();
    confirmPassword.dispose();
    return super.close();
  }

  Future<UserModel> getUser(ApiResponse responses) async {
    final List<dynamic> data = responses.data['data'];
    final user = UserModel.fromJson(data.first);
    SessionData.userModel = user;
    await _cacheHelper.saveSecureData(
      key: StringManager.tokenKey,
      value: user.token,
    );
    final bool isTourist = user.role == StringManager.userRole;
    SessionData.isTourist = isTourist;
    await _cacheHelper.saveData(
      key: StringManager.userRole,
      value: isTourist,
    );
    return user;
  }
}
