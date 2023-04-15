import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/cache_helper.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/auth/data/models/login_models/login_request.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/login_cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await CacheHelper.setData(key: 'token', value: state.userData.token)
              .then((value) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            CacheHelper.setData(key: 'IsLoggedIn', value: true);
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
                const Text(
                  'Login',
                  style: Styles.textStyle24,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Login now to explore our offers',
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return cubit.validateEmail(value!);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('email'),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: cubit.isObscure,
                  controller: cubit.passwordController,
                  validator: (value) {
                    return cubit.validatePassword(value!);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('password'),
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(cubit.suffix),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: state is LoginLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () async {
                            if (cubit.formKey.currentState!.validate()) {
                              await cubit.login(
                                LoginRequest(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text),
                              );
                            }
                          },
                          child: const Text('Login')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        AppRouter.router
                            .pushReplacement(AppRouter.kRegisterView);
                      },
                      child: const Text('Don\'t have account? Sign In'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
