import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/auth/data/models/register_request.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/register_cubit/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RegisterCubit>(context);
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
                  const Text(
                    'Register',
                    style: Styles.textStyle24,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Register now to explore our offers',
                    style: Styles.textStyle18,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cubit.nameController,
                    validator: (value) {
                      return cubit.validateName(value!);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('name'),
                      prefixIcon: Icon(Icons.person_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cubit.emailController,
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
                  TextFormField(
                    controller: cubit.phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      return cubit.validatePhone(value!);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('phone'),
                      prefixIcon: Icon(Icons.phone_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: state is RegisterLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              if (cubit.formKey.currentState!.validate()) {
                                await cubit.register(
                                  RegisterRequest(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                    name: cubit.nameController.text,
                                    phone: cubit.phoneController.text,
                                  ),
                                );
                              }
                            },
                            child: const Text('Register'),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          AppRouter.router.pushReplacement(AppRouter.kLoginView);
                        },
                        child: const Text('Already have account? Login'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
