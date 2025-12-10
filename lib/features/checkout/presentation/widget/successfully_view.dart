import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';

class SuccessfullyView extends StatelessWidget {
  const SuccessfullyView({super.key});
  static const String routeName = '/success_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/svg/success.svg", height: 200.h),
            SizedBox(height: 30.h),
            Text(
              "Order Placed Successfully!",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff204F38),
              ),
            ),
            SizedBox(height: 50.h),
            PrimaryButton(
              label: "Back to Home",
              onPressed: () {
                // Navigate to root or home
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
