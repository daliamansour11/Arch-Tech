import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/injection.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/features/_auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingOutDialog extends StatelessWidget {
  final bool isDeleteAccount;
  const SingOutDialog({
    super.key,
    this.isDeleteAccount = false,
  });
  Injection get inj => Injection.instance;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        child: BlocProvider(
          create: (context) => AuthBloc(inj.apiConsumer, inj.cacheHelper),
          child: BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              final bool isLoading =
                  state.maybeWhen(loading: () => true, orElse: () => false);
              if (isLoading) {
                return const LoadingInsideDialog();
              }
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isDeleteAccount ? Icons.warning_rounded : Icons.logout,
                      color: isDeleteAccount ? Colors.red : ColorManger.primary,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    TextManger(
                      isDeleteAccount
                          ? 'Delete_Account_Title'
                          : 'Sign_Out_Title',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    TextManger(
                      isDeleteAccount
                          ? 'Delete_Account_Description'
                          : 'Sign_Out_Description',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const TextManger('No'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (isDeleteAccount) {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.deleteAccount());
                            } else {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.logout());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDeleteAccount
                                ? Colors.red
                                : ColorManger.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const TextManger('Yes'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            listener: (BuildContext context, AuthState state) {
              state.whenOrNull(error: (message) {
                context.pop();
                return context.errorDialog(message);
              }, singOut: () {
                context.pop();
                context.pushNamedAndRemoveUntil(RouteNames.login);
              });
            },
          ),
        ));
  }
}

class LoadingInsideDialog extends StatelessWidget {
  const LoadingInsideDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(64),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
