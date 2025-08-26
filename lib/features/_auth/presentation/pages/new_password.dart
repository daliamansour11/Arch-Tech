import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/features/_auth/bloc/forget_password_bloc.dart';
import 'package:archtech/features/_auth/presentation/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPassword extends StatelessWidget {
  static const routeName = 'newPassword/';
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, 'newPassword'),
      body: Form(
        key: context.read<ForgetPasswordBloc>().formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Image.asset(
                ImagesConstantsAsset.assetsImagesNewPassword,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AuthForm(
              hintText: 'EnterYourPassword',
              title: 'Password',
              controller: context.read<ForgetPasswordBloc>().passwordController,
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            AuthForm(
              hintText: 'NewPassword',
              title: 'ConfirmPassword',
              controller:
                  context.read<ForgetPasswordBloc>().confirmPasswordController,
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 32, bottom: 16),
              child: CustomButton(
                onPressed: () {
                  if (context
                          .read<ForgetPasswordBloc>()
                          .formKey
                          .currentState
                          ?.validate() ??
                      false) {
                    context
                        .read<ForgetPasswordBloc>()
                        .add(const ForgetPasswordEvent.resetPassword());
                  }
                },
                text: 'ChangePassword',
              ),
            ),
            BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: () => context.loadingDialog,
                  error: (message) {
                    context.pop();
                    return context.errorDialog(message);
                  },
                  restPasswordSuccess: () {
                    final bool isTourist = SessionData.isTourist ?? false;
                    final String route = isTourist
                        ? RouteNames.touristHome
                        : RouteNames.recarcherHomeScreen;
                    context.pop();
                    context.pushNamedAndRemoveUntil(
                      route,
                    );
                  },
                );
              },
              child: const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
