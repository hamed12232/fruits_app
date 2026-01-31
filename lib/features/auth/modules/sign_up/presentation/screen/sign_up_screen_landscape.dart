import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_cubit.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_state.dart';

class SignUpScreenLandscape extends StatefulWidget {
  const SignUpScreenLandscape({super.key});

  @override
  State<SignUpScreenLandscape> createState() => _SignUpScreenLandscapeState();
}

class _SignUpScreenLandscapeState extends State<SignUpScreenLandscape> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String _fullPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppWidth.w66,
            vertical: AppHeight.h20, // Reduced vertical padding
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              VerticalSpace(height: AppHeight.h20), // Reduced spacing

              Text(
                AppTextStrings.signUpToWikala,
                style: textTheme.displayLarge?.copyWith(
                  fontSize: AppSizes.sp20, // Reduced font size
                ),
              ),
              VerticalSpace(height: AppHeight.h40),

              // Full Name
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: AppTextStrings.fullName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizes.sp10, // Smaller label
                      color: AppColors.titleOfTextField,
                    ),
                    children: [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h10),
              CustomInputField(
                heigh: 45.h, // Reduced height
                controller: fullNameController,
                hintText: AppTextStrings.firstAndLastName,
                fontSize: AppSizes.sp10, // Smaller input font
              ),

              VerticalSpace(height: AppHeight.h30),

              // Email
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: 'Email',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizes.sp10, // Smaller label
                      color: AppColors.titleOfTextField,
                    ),
                    children: [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h10),
              CustomInputField(
                heigh: 45.h, // Reduced height
                controller: emailController,
                hintText: 'Enter your email',
                fontSize: AppSizes.sp10, // Smaller input font
              ),

              VerticalSpace(height: AppHeight.h30),

              // Phone Number
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: AppTextStrings.phoneNumberWithWhatsapp,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizes.sp10, // Smaller label
                      color: AppColors.titleOfTextField,
                    ),
                    children: [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 5.h),
              CustomPhoneNumber(
                controller: phoneNumberController,
                fontSize: AppSizes.sp10, // Smaller input font for phone
                iconSize: AppSizes.sp10,
                onChanged: (phone) {
                  _fullPhoneNumber = phone.completeNumber;
                },
              ),

              VerticalSpace(height: AppHeight.h10),

              // Password
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: AppTextStrings.password,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizes.sp10, // Smaller label
                      color: AppColors.titleOfTextField,
                    ),
                    children: [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h10),
              CustomInputField(
                heigh: 45.h, // Reduced height
                controller: passwordController,
                hintText: AppTextStrings.password,
                isPassword: true,
                fontSize: AppSizes.sp10, // Smaller input font
              ),

              VerticalSpace(height: AppHeight.h10),

              // Confirm Password
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: 'Confirm Password',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizes.sp10, // Smaller label
                      color: AppColors.titleOfTextField,
                    ),
                    children: [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h10),
              CustomInputField(
                heigh: 45.h, // Reduced height
                controller: cPasswordController,
                hintText: 'Confirm your password',
                isPassword: true,
                fontSize: AppSizes.sp10, // Smaller input font
              ),

              VerticalSpace(height: AppHeight.h30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w56),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    final isLoading = state is RegisterLoading;
                    return PrimaryButton(
                      label: isLoading ? 'Loading...' : AppTextStrings.signUp,
                      onPressed: isLoading
                          ? () {}
                          : () {
                              final name = fullNameController.text;
                              final email = emailController.text;
                              final phone = _fullPhoneNumber.isNotEmpty
                                  ? _fullPhoneNumber
                                  : phoneNumberController.text;
                              final password = passwordController.text;
                              final cPassword = cPasswordController.text;

                              if (name.isEmpty ||
                                  email.isEmpty ||
                                  phone.isEmpty ||
                                  password.isEmpty ||
                                  cPassword.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill all fields'),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                return;
                              }

                              if (password != cPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Passwords do not match'),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                return;
                              }

                              context.read<RegisterCubit>().register(
                                name: name,
                                email: email,
                                mobile: phone,
                                password: password,
                                cPassword: cPassword,
                              );
                            },
                      fontSize: AppSizes.sp12,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              VerticalSpace(height: AppHeight.h20),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppTextStrings.alreadyHaveAnAccount,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 10.sp),
                      ),
                      TextSpan(
                        text: AppTextStrings.signIn,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.darkBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 10.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
