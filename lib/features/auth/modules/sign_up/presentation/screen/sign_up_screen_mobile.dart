import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/adaptive_layout/simple_adaptive_screen.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_attribute_with_text_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_cubit.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_state.dart';

class SignUpScreenMobile extends StatefulWidget {
  const SignUpScreenMobile({super.key});

  @override
  State<SignUpScreenMobile> createState() => _SignUpScreenMobileState();
}

class _SignUpScreenMobileState extends State<SignUpScreenMobile> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController phoneNumberController =
      TextEditingController(); // Added controller
  String _fullPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    // Removed Scaffold
    return SimpleAdaptiveScreen(
      maxWidth: 500,
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w42,
              vertical: AppHeight.h47,
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
                VerticalSpace(height: AppHeight.h62),
                Text(
                  AppTextStrings.fruitMarket,
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.primaryGreen,
                    fontSize: AppSizes.sp42,
                  ),
                ),
                VerticalSpace(height: AppHeight.h21),
                Text(
                  AppTextStrings.signUpToWikala,
                  style: textTheme.displayLarge,
                ),
                VerticalSpace(height: AppHeight.h30),
                CustomAttributeWithTextField(
                  fullNameController: fullNameController,
                  attributeName: AppTextStrings.fullName,
                  hintText: AppTextStrings.firstAndLastName,
                ),
                VerticalSpace(height: AppHeight.h20),
                CustomAttributeWithTextField(
                  fullNameController: emailController,
                  attributeName: 'Email', // Use AppTextStrings if available
                  hintText: 'Enter your email',
                ),
                VerticalSpace(height: AppHeight.h33),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: AppTextStrings.phoneNumberWithWhatsapp,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: AppSizes.sp14,
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
                VerticalSpace(height: AppHeight.h7),
                CustomPhoneNumber(
                  controller: phoneNumberController,
                  onChanged: (phone) {
                    _fullPhoneNumber = phone.completeNumber;
                  },
                ),

                CustomAttributeWithTextField(
                  fullNameController: passwordController,
                  attributeName: AppTextStrings.password,
                  hintText: AppTextStrings.password,
                ),
                VerticalSpace(height: AppHeight.h20),
                CustomAttributeWithTextField(
                  fullNameController: cPasswordController,
                  attributeName: 'Confirm Password', // Use AppTextStrings
                  hintText: 'Confirm your password',
                ),
                VerticalSpace(height: AppHeight.h41),
                BlocBuilder<RegisterCubit, RegisterState>(
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
                      height: AppHeight.h52,
                      width: double.infinity,
                    );
                  },
                ),
                VerticalSpace(height: AppHeight.h41),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppTextStrings.alreadyHaveAnAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: AppTextStrings.signIn,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.darkBlue,
                                decoration: TextDecoration.underline,
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
