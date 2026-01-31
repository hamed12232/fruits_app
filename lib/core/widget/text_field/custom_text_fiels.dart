import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double heigh;
  final int? maxLines;
  final double fontSize;
  final TextInputType? keyboardType;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    required this.fontSize,
    this.validator,
    required this.heigh,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigh,
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: isPassword,
        controller: controller,
        validator: validator,

        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTapOutside: (event) => FocusManager.instance.primaryFocus
            ?.unfocus(), //to disapear keyboard when tap outside
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),

          // prefixIcon: isPrefixIconNotExist
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //           left: AppPadding.p16,
          //           right: AppWidth.w8,
          //         ),
          //         child: Icon(
          //           icon,
          //           color: AppColors.grey400,
          //           size: AppSizes.iconSm2,
          //         ),
          //       )
          //     : null,
          // prefixIconConstraints: const BoxConstraints(
          //   minWidth: 0,
          //   minHeight: 0,
          // ),
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        ),
      ),
    );
  }
}
