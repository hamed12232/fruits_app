import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/widget/otp_pin_field.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/widget/timer_section.dart';

class OtpVerificationScreenLandscape extends StatefulWidget {
  const OtpVerificationScreenLandscape({super.key});

  @override
  State<OtpVerificationScreenLandscape> createState() =>
      _OtpVerificationScreenLandscapeState();
}

class _OtpVerificationScreenLandscapeState
    extends State<OtpVerificationScreenLandscape> {
  final TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _start = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _canResend = false;
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_start == 0) {
        if (mounted) {
          setState(() {
            _canResend = true;
          });
        }
        timer.cancel();
      } else {
        if (mounted) {
          setState(() {
            _start--;
          });
        }
      }
    });
  }

  void _resendOTP() {
    if (_canResend) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          children: [
          
            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w24,
                    vertical: AppHeight.h20,
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
                      Text(
                        AppTextStrings.enterReceivedOTP,
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: AppSizes.sp20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      VerticalSpace(height: AppHeight.h40),
                      _buildForm(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w32),
      child: Column(
      children: [
        OtpPinFields(otpController: otpController),
        VerticalSpace(height: AppHeight.h20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w64),
          child: PrimaryButton(
          label: AppTextStrings.confirm,
          height: AppHeight.h68,
          onPressed: () {},
            width: double.infinity,
            fontSize: AppSizes.sp12,
          ),
        ),
        VerticalSpace(height: AppHeight.h30),
        RepaintBoundary(
          child: TimerSection(
            start: _start,
            canResend: _canResend,
            onResend: _resendOTP,
          ),
        ),
      ],
    ),
    );
  }
}
