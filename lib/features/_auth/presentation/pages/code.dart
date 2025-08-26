import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/features/_auth/bloc/verification_code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OTPVerification extends StatelessWidget {
  static const routeName = 'code/';
  final bool isForgetPassword;
  const OTPVerification({super.key, required this.isForgetPassword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, 'VerifyCode'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            BlocBuilder<VerificationCodeBloc, VerificationCodeState>(
              builder: (context, state) {
                return state.maybeMap(
                  timerTick: (state) {
                    final minutes = (state.secondsRemaining ~/ 60)
                        .toString()
                        .padLeft(2, '0');
                    final seconds = (state.secondsRemaining % 60)
                        .toString()
                        .padLeft(2, '0');
                    return TextManger(
                      '$minutes:$seconds',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: ColorManger.grey,
                      ),
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            const SizedBox(height: 32),
            Pinput(
              length: 6,
              onCompleted: (pin) {
                context
                    .read<VerificationCodeBloc>()
                    .add(VerificationCodeEvent.verifyCode(pin));
              },
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              closeKeyboardWhenCompleted: true,
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 32, bottom: 16),
              child: BlocBuilder<VerificationCodeBloc, VerificationCodeState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      final isTimerZero = state.maybeMap(
                        timerTick: (state) => state.secondsRemaining == 0,
                        orElse: () => true,
                      );
                      if (isTimerZero) {
                        context
                            .read<VerificationCodeBloc>()
                            .add(const VerificationCodeEvent.getCode());
                      }
                    },
                    text: 'ReSend',
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            BlocListener<VerificationCodeBloc, VerificationCodeState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: () => context.loadingDialog,
                  resendSuccess: () => context.pop(),
                  error: (message) {
                    context.pop();
                    return context.errorDialog(message);
                  },
                  success: () {
                    context.pop();
                    if (isForgetPassword) {
                      context.pushReplacementNamed(RouteNames.newPassword);
                    } else {
                        final bool isTourist = SessionData.isTourist ?? false;
                          final String route = isTourist
                              ? RouteNames.touristHome
                              : RouteNames.recarcherHomeScreen;
                      context.pushReplacementNamed(route);
                    }
                  },
                );
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
