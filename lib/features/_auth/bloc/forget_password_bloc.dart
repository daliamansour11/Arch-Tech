import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/features/_auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';
part 'forget_password_bloc.freezed.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ApiConsumer apiConsumer;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgetPasswordBloc(this.apiConsumer) : super(const _Initial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      await event.whenOrNull(
        resetPassword: () async {
          emit(const ForgetPasswordState.loading());
          try {
            final response =
                await apiConsumer.post(EndPoints.changePassword, body: {
              'new_password': passwordController.text,
              'new_password_confirmation': confirmPasswordController.text
            });
            if (response.isSuccessful) {
              emit(const ForgetPasswordState.restPasswordSuccess());
            }
          } on ApiException catch (error) {
            emit(ForgetPasswordState.error(error.messageKey));
          } catch (error) {
            emit(const ForgetPasswordState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
        forgetPassword: () async {
          emit(const ForgetPasswordState.loading());
          try {
            final response =
                await apiConsumer.post(EndPoints.forgetPassword, body: {
              'email': emailController.text,
            });
            if (response.isSuccessful) {
              SessionData.userModel = UserModel(
                email: emailController.text,
              );
              emit(const ForgetPasswordState.sendCodeSuccess());
            }
          } on ApiException catch (error) {
            emit(ForgetPasswordState.error(error.messageKey));
          } catch (error) {
            emit(const ForgetPasswordState.error(
                'An unexpected error occurred. Please try again.'));
          }
        },
      );
    });
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
