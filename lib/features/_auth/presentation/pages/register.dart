import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/_constants/validate_manager.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/_auth/bloc/auth_bloc.dart';
import 'package:archtech/features/_auth/presentation/widgets/auth_form.dart';
import 'package:archtech/features/_auth/presentation/widgets/my_check_box.dart';
import 'package:archtech/features/_auth/presentation/widgets/or_divider.dart';
import 'package:archtech/features/_auth/presentation/widgets/social_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  final String role;
  static const routeName = 'register/';
  const Register({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, 'CreateAccount'),
      body: Form(
        key: context.read<AuthBloc>().formKey,
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
              hintText: 'EnterYourName',
              title: 'Name',
              controller: context.read<AuthBloc>().name,
              keyboardType: TextInputType.name,
            ),
            AuthForm(
              hintText: 'EnterYourPassword',
              title: 'Password',
              controller: context.read<AuthBloc>().password,
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            AuthForm(
              hintText: 'EnterYourPassword',
              title: 'ConfirmPassword',
              controller: context.read<AuthBloc>().confirmPassword,
              isPassword: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 8),
            MyCheckBox(
              hint: 'AcceptTermsAndConditions',
              onConfirm: () {},
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 32, bottom: 16),
              child: CustomButton(
                onPressed: () {
                  if (context
                          .read<AuthBloc>()
                          .formKey
                          .currentState
                          ?.validate() ??
                      false) {
                    context.read<AuthBloc>().add(AuthEvent.register(role));
                  }
                },
                text: 'CreateAccount',
              ),
            ),
            const OrDivider(),
            const SizedBox(
              height: 24,
            ),
            SocialList(
              role: role,
            ),
            const SizedBox(
              height: 36,
            ),
            Center(
              child: InkWell(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                onTap: () => context.pop(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 32),
                  child: Text.rich(TextSpan(
                      text: context.translate('AlreadyHaveAnAccount'),
                      style: TextStyleManager.bodyMedium,
                      children: [
                        TextSpan(
                            text: context.translate('Login'),
                            style: TextStyleManager.bodyMediumPrimary)
                      ])),
                ),
              ),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (message) {
                    context.pop();
                    return context.errorDialog(message);
                  },
                  loading: () => context.loadingDialog,
                  registerByGoogle: () {
                    final bool isTourist = SessionData.isTourist ?? false;
                    final String route = isTourist
                        ? RouteNames.touristHome
                        : RouteNames.recarcherHomeScreen;
                    context.pop();
                    context.pushNamedAndRemoveUntil(route);
                  },
                  loaded: (user) {
                    context.pop();
                    SessionData.userModel = user;
                    SessionData.isTourist = role == StringManager.userRole;
                    context.pushReplacementNamed(RouteNames.code,
                        arguments: false);
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
