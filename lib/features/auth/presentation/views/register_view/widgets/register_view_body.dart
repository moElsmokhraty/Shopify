import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/auth/data/models/register_models/register_request.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/register_cubit/register_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_nav_to_signup_login.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AppRouter.router.pushReplacement(AppRouter.kHomeView);
        } else if (state is RegisterFailure) {}
      },
      builder: (context, state) {
        return Center(
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: Styles.textStyle24
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Register now to explore our offers',
                    style: Styles.textStyle18.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomAuthTextField(
                      controller: cubit.nameController,
                      validator: (value) {
                        return cubit.validateName(value!);
                      },
                      label: 'Full Name',
                      iconData: Icons.person_outlined),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAuthTextField(
                      controller: cubit.emailController,
                      validator: (value) {
                        return cubit.validateEmail(value!);
                      },
                      label: "Email",
                      iconData: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAuthTextField(
                    controller: cubit.passwordController,
                    validator: (value) => cubit.validatePassword(value),
                    label: "PassWord",
                    iconData: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: cubit.isObscure,
                    passIconData: cubit.suffix,
                    changeIconsFun: () => cubit.changePasswordVisibility(),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAuthTextField(
                    controller: cubit.confirmPasswordController,
                    validator: (value) => cubit.validatePassword(value),
                    label: "Confirm PassWord",
                    iconData: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: cubit.isObscureConfirm,
                    passIconData: cubit.suffixConfirm,
                    changeIconsFun: () =>
                        cubit.changeConfirmPasswordVisibility(),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAuthTextField(
                      controller: cubit.phoneController,
                      validator: (value) => cubit.validatePhone(value),
                      label: "Phone Number",
                      iconData: Icons.phone,
                      textInputType: TextInputType.phone),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomAuthButton(
                      state: state,
                      onTap: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          await cubit.register(RegisterRequest(
                            email: cubit.emailController.text,
                            password: cubit.passwordController.text,
                            name: cubit.nameController.text,
                            phone: cubit.phoneController.text,
                          ));
                        }
                      },
                      text: "Register"),
                  const SizedBox(
                    height: 25,
                  ),
                  NavToSignupLogin(
                    onTap: () {
                      AppRouter.router.pushReplacement(AppRouter.kLoginView);
                    },
                    firstText: 'Already have account?',
                    secondText: ' Log in here',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
