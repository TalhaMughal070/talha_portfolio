import 'package:flutter/material.dart';
import 'package:talha_portfolio/constants/app_colors.dart';
import 'package:talha_portfolio/responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onTap;
  final bool isOutlined;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? width;
  final double? height;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onTap,
    this.isOutlined = false,
    this.borderColor = Colors.white,
    this.textColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final filledBg = backgroundColor ?? AppColors.primaryColor;
    final outlinedBg = backgroundColor ?? AppColors.scaffoldBackGround;
    final baseTextColor =
        textColor ??
        (isOutlined ? (borderColor ?? AppColors.primaryColor) : Colors.white);

    final style =
        ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: isOutlined
              ? BorderSide(
                  color: borderColor ?? AppColors.primaryColor,
                  width: .7,
                )
              : BorderSide.none,
          elevation: 0,
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return (disabledBackgroundColor ??
                      (isOutlined ? outlinedBg : filledBg))
                  .withOpacity(0.6);
            }
            return isOutlined ? outlinedBg : filledBg;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return baseTextColor.withOpacity(0.7);
            }
            return baseTextColor;
          }),
        );

    return SizedBox(
      width: width ?? (Responsive.isDesktop(context) ? w * 0.25 : w * 0.85),
      height: height ?? (Responsive.isDesktop(context) ? 37 : 47),
      child: ElevatedButton(
        style: style,
        onPressed: isLoading ? null : onTap,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: fontSize,
                  color: baseTextColor,
                ),
              ),
      ),
    );
  }
}
