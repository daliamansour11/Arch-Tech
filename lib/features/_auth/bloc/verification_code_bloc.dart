import 'dart:async';

import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/features/_auth/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_code_bloc.freezed.dart';
part 'verification_code_event.dart';
part 'verification_code_state.dart';

class VerificationCodeBloc
    extends Bloc<VerificationCodeEvent, VerificationCodeState> {
  final ApiConsumer _apiConsumer;
  final CacheHelper _cacheHelper;
  final bool isForgetPassword;
  Timer? _timer;
  int _secondsRemaining = 120;

  VerificationCodeBloc(this._apiConsumer, this._cacheHelper,
      {required this.isForgetPassword})
      : super(const _Initial()) {
    on<VerificationCodeEvent>((event, emit) async {
      await event.map(
        getCode: (_) async {
          if (!isForgetPassword) {
            emit(const VerificationCodeState.loading());
            try {
              final user = SessionData.userModel;
              final String? email = user?.email;
              final responses = await _apiConsumer
                  .post(EndPoints.resendCode, body: {'email': email});
              if (responses.isSuccessful) {
                emit(const VerificationCodeState.resendSuccess());
                add(const VerificationCodeEvent.resetTimer());
              }
            } on ApiException catch (e) {
              emit(VerificationCodeState.error(e.messageKey));
            }
          }
        },
        verifyCode: (event) async {
          emit(const VerificationCodeState.loading());
          try {
            bool check = false;
            if (isForgetPassword) {
              check = await _verifyCodePassword(
                event.code,
              );
            } else {
              check = await _verbifyCode(
                event.code,
              );
            }

            if (check) {
              emit(const VerificationCodeState.success());
            }
          } on ApiException catch (e) {
            emit(VerificationCodeState.error(e.messageKey));
          }
        },
        startTimer: (_) {
          _secondsRemaining = 120;
          _timer?.cancel();
          _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (_secondsRemaining > 0) {
              _secondsRemaining--;
              add(const VerificationCodeEvent.tickTimer());
            } else {
              _timer?.cancel();
            }
          });
        },
        tickTimer: (_) {
          emit(VerificationCodeState.timerTick(_secondsRemaining));
        },
        resetTimer: (_) {
          _secondsRemaining = 120;
          _timer?.cancel();
          add(const VerificationCodeEvent.startTimer());
        },
      );
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<bool> _verbifyCode(
    String code,
  ) async {
    final user = SessionData.userModel;
    final String? email = user?.email;
    final responses = await _apiConsumer
        .post(EndPoints.verifyCode, body: {'code': code, 'email': email});
    if (responses.isSuccessful) {
      await _cacheHelper.saveSecureData(
          key: StringManager.tokenKey, value: user?.token);
      await _cacheHelper.saveData(
        key: StringManager.userRole,
        value: SessionData.isTourist,
      );
      return true;
    }
    return false;
  }

  Future<bool> _verifyCodePassword(
    String code,
  ) async {
    final user = SessionData.userModel;
    final String? email = user?.email;
    final responses = await _apiConsumer.post(EndPoints.verifyCodePassword,
        body: {'code': code, 'email': email});
    if (responses.isSuccessful) {
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
      return true;
    }
    return false;
  }
}
