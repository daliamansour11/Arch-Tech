import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import '../../../_auth/presentation/widgets/auth_form.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../bloc/profile_bloc/profile_event.dart';
import '../bloc/profile_bloc/profile_state.dart';
import '../widgets/profile_photo.dart';

class UpdateProfile extends StatelessWidget {
  static const routeName = 'update/';
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return BlocProvider(
      create: (context) => ProfileBloc()..add(GetProfileEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppBar(context, 'updateProfile'),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfilePhotoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              nameController.text = state.name;
              emailController.text = state.email;

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        const SizedBox(height: 32),
                        Center(
                          child: ProfilePhoto(photoUrl: state.profileImage),
                        ),
                        const SizedBox(height: 32),
                        const Center(
                          child: TextManger(
                            'AddPhoto',
                            style: TextStyleManager.bodyLargeGrey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        AuthForm(
                          hintText: 'EnterYourName',
                          title: 'Name',
                          controller: nameController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 32),
                        AuthForm(
                          hintText: 'EnterYourEmail',
                          title: 'Email',
                          controller: emailController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 32, bottom: 16),
                          child: CustomButton(
                            onPressed: () {
                              final newName = nameController.text.trim().isEmpty
                                  ? state.name
                                  : nameController.text.trim();

                              final newEmail =
                                  emailController.text.trim().isEmpty
                                      ? state.email
                                      : emailController.text.trim();

                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      name: newName,
                                      email: newEmail,
                                    ),
                                  );
                            },
                            text: 'UpdateProfile',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
