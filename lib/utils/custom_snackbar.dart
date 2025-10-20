import 'package:alert_banner/types/enums.dart';
import 'package:alert_banner/widgets/alert.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:talha_portfolio/responsive/responsive.dart';

showSnackbar(bool isError, String text, BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  final double maxWidth = Responsive.isDesktop(context)
      ? 300
      : screenWidth * 0.9;

  return showAlertBanner(
    context,
    () => debugPrint("Snackbar tapped"),
    Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: maxWidth,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.grey.shade800),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Row(
              children: [
                Icon(
                  isError
                      ? FluentIcons.error_circle_24_filled
                      : FluentIcons.checkmark_circle_24_filled,
                  color: isError ? Colors.redAccent : Colors.green,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ).asGlass(),
        ),
      ),
    ),
    alertBannerLocation: AlertBannerLocation.top,
  );
}
