import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinFields extends StatelessWidget {
  const OtpPinFields({
    super.key,
    required this.otpController,
  });

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w31),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        controller: otpController,
        obscureText: true,
        obscuringWidget: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.grey.shade600,
            shape: BoxShape.circle,
          ),
        ),
        animationType: AnimationType.none,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.circle,
          fieldHeight: AppHeight.h48,
          fieldWidth: AppWidth.w48,
          activeColor: AppColors.lightGray,
          inactiveColor: AppColors.darkGray,
          selectedColor: AppColors.primaryGreen,
          inactiveFillColor: AppColors.white,
          activeFillColor: Colors.grey.shade200,
          selectedFillColor: AppColors.white,
          borderWidth: 1,
        ),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (value) {
          // TODO: Auto-submit when OTP is complete
        },
        onChanged: (value) {},
      ),
    );
  }
}
