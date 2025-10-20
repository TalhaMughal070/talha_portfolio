import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talha_portfolio/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFooterSection extends StatelessWidget {
  const ContactFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Let's Connect",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Feel free to reach out through any platform below — I’m always open to new opportunities and collaborations!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 25,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildSocialButton(
                icon: FontAwesomeIcons.linkedinIn,
                label: "LinkedIn",
                url: "https://www.linkedin.com/in/talha-yameen-130403247",
              ),
              _buildSocialButton(
                icon: FontAwesomeIcons.whatsapp,
                label: "WhatsApp",
                url: "https://wa.me/923012598885",
              ),
              _buildSocialButton(
                icon: FontAwesomeIcons.facebookF,
                label: "Facebook",
                url: "https://www.facebook.com/profile.php?id=61567469485308",
              ),
              _buildSocialButton(
                icon: FontAwesomeIcons.envelope,
                label: "Email",
                url: "mailto:talhamughal5536@gmail.com",
              ),
              _buildSocialButton(
                icon: FontAwesomeIcons.phone,
                label: "Phone",
                url: "tel:+923012598885",
              ),
            ],
          ),
          const SizedBox(height: 60),
          Container(width: double.infinity, height: 1, color: Colors.white12),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: "© 2025 Muhammad Talha — ",
              style: const TextStyle(color: Colors.white60),
              children: [
                TextSpan(
                  text: "Built with Flutter 💙",
                  style: TextStyle(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.primaryColor2,
                        ],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
