import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/Di/service_locator.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/adaptive_layout/simple_adaptive_screen.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_attribute_with_text_field.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/cubit/forget_password_cubit.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/cubit/forget_password_state.dart';

class VerifyNumberScreen extends StatefulWidget {
  const VerifyNumberScreen({super.key});
  static const routeName = '/verify-number';

  @override
  State<VerifyNumberScreen> createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => sl<ForgetPasswordCubit>(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            // Show new password in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('New Password Generated'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Your new password is:'),
                    VerticalSpace(height: AppHeight.h10),
                    SelectableText(
                      '${state.response.newPassword}',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VerticalSpace(height: AppHeight.h20),
                    const Text('Please copy it and login.'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.of(context).pop(); // Go back to login
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          } else if (state is ForgetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgetPasswordLoading;

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SimpleAdaptiveScreen(
              maxWidth: 500,
              padding: EdgeInsets.zero,
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
                      Text('Enter Your Email', style: textTheme.displayLarge),
                      VerticalSpace(height: AppHeight.h30),
                      CustomAttributeWithTextField(
                        fullNameController: emailController,
                        attributeName: 'Email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      VerticalSpace(height: AppHeight.h41),
                      PrimaryButton(
                        label: isLoading ? 'Loading...' : AppTextStrings.submit,
                        onPressed: isLoading
                            ? () {}
                            : () {
                                final email = emailController.text;

                                if (email.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please enter your email'),
                                      backgroundColor: Colors.orange,
                                    ),
                                  );
                                  return;
                                }

                                context
                                    .read<ForgetPasswordCubit>()
                                    .forgetPassword(email: email);
                              },
                        height: AppHeight.h52,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
