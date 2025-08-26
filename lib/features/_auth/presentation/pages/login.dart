import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/validate_manager.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/_auth/bloc/auth_bloc.dart';
import 'package:archtech/features/_auth/presentation/widgets/auth_form.dart';
import 'package:archtech/features/_auth/presentation/widgets/my_check_box.dart';
import 'package:archtech/features/_auth/presentation/widgets/or_divider.dart';
import 'package:archtech/features/_auth/presentation/widgets/social_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  static const routeName = 'login/';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, 'Login'),
      body: Form(
        key: context.read<AuthBloc>().formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsetsDirectional.all(16),
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  AuthForm(
                    hintText: 'EnterYourEmail',
                    title: 'Email',
                    controller: context.read<AuthBloc>().email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        ValidateManager.validateEmail(value, context),
                  ),
                  AuthForm(
                    hintText: 'EnterYourPassword',
                    title: 'Password',
                    controller: context.read<AuthBloc>().password,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCheckBox(
                        hint: 'RememberMe',
                        onConfirm: () {},
                      ),
                      InkWell(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        onTap: () =>
                            context.pushNamed(RouteNames.forgotPassword),
                        child: const TextManger('ForgotPassword',
                            style: TextStyleManager.bodyMediumPrimary),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 32, bottom: 16),
                    child: CustomButton(
                      onPressed: () {
                        if (context
                                .read<AuthBloc>()
                                .formKey
                                .currentState
                                ?.validate() ??
                            false) {
                          context.read<AuthBloc>().add(const AuthEvent.login());
                        }
                      },
                      text: 'Login',
                    ),
                  ),
                  const OrDivider(),
                  const SizedBox(
                    height: 24,
                  ),
                  const SocialList(),
                 
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        error: (message) {
                          context.pop();
                          return context.errorDialog(message);
                        },
                        loading: () => context.loadingDialog,
                        loaded: (user) {
                          final bool isTourist = SessionData.isTourist ?? false;
                          final String route = isTourist
                              ? RouteNames.touristHome
                              : RouteNames.recarcherHomeScreen;
                          context.pop();
                          context.pushNamedAndRemoveUntil(route);
                        },
                      );
                    },
                    child: const SizedBox.shrink(),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(RouteNames.startJourney);
              },
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 32),
                child: Text.rich(TextSpan(
                    text: context.translate('DontHaveAccount'),
                    style: TextStyleManager.bodyMedium,
                    children: [
                      TextSpan(
                          text: context.translate('CreateAccount'),
                          style: TextStyleManager.bodyMediumPrimary)
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
