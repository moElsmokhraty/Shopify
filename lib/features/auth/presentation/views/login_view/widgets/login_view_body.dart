import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/cache_helper.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/auth/data/models/login_models/login_request.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/login_cubit/login_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_nav_to_signup_login.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          CacheHelper.setData(key: kName, value: state.userData.name);
          CacheHelper.setData(key: kEmail, value: state.userData.email);
          CacheHelper.setData(key: kImage, value: state.userData.image);
          await CacheHelper.setData(key: kToken, value: state.userData.token)
              .then((value) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          });
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style:
                      Styles.textStyle24.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Login now to explore our offers',
                  style: Styles.textStyle18.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomAuthTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: cubit.emailController,
                  validator: (value) => cubit.validateEmail(value),
                  label: "Email",
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomAuthTextField(
                  controller: cubit.passwordController,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) => cubit.validatePassword(value),
                  label: "Password",
                  iconData: Icons.lock_outline,
                  isPassword: true,
                  obscureText: cubit.isObscure,
                  changeIconsFun: () => cubit.changePasswordVisibility(),
                  passIconData: cubit.suffix,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomAuthButton(
                    text: "Login",
                    onTap: () async {
                      if (cubit.formKey.currentState!.validate()) {
                        await cubit.login(
                          LoginRequest(
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text),
                        );
                      }
                    },
                    state: state),
                const SizedBox(
                  height: 20,
                ),
                NavToSignupLogin(
                  onTap: () {
                    AppRouter.router.pushReplacement(AppRouter.kRegisterView);
                  },
                  firstText: 'Don\'t have account?',
                  secondText: '  Sign in here',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
