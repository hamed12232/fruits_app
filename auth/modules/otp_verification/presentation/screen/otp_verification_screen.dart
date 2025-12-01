import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/adaptive_layout/simple_adaptive_screen.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import '../widget/otp_pin_field.dart';
import '../widget/timer_section.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static const routeName = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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

    try {
      otpController.dispose();
    } catch (e) {
      // Controller already disposed, ignore
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
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
                Text(
                  AppTextStrings.enterReceivedOTP,
                  style: textTheme.displayLarge,
                ),
                VerticalSpace(height: AppHeight.h52),
                OtpPinFields(otpController: otpController),
                VerticalSpace(height: AppHeight.h52),
                PrimaryButton(
                  label: AppTextStrings.confirm,
                  onPressed: () {},
                  height: AppHeight.h52,
                  width: double.infinity,
                ),
                VerticalSpace(height: AppHeight.h41),
                RepaintBoundary(
                  child: TimerSection(
                    start: _start,
                    canResend: _canResend,
                    onResend: _resendOTP,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
