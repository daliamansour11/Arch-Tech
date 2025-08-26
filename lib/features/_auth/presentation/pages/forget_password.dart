import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/features/_auth/bloc/forget_password_bloc.dart';
import 'package:archtech/features/_auth/presentation/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  static const routeName = 'SignUp/';
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, 'ForgotPasswordHeader'),
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
                'assets/images/reset_password.png',
                height: 200,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AuthForm(
              hintText: 'EnterYourEmail',
              title: 'Email',
              controller: context.read<ForgetPasswordBloc>().emailController,
              keyboardType: TextInputType.emailAddress,
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
                        .add(const ForgetPasswordEvent.forgetPassword());
                  }
                },
                text: 'SendCode',
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
                  sendCodeSuccess: () {
                    context.pop();
                    context.pushReplacementNamed(RouteNames.code,
                        arguments: true);
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
