import 'package:flutter/material.dart';
import 'package:talha_portfolio/constants/app_colors.dart';
import 'package:talha_portfolio/widgets/custom_buttom.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryColor, AppColors.primaryColor2],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Get In Touch",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Have a project in mind or want to collaborate?\nSend me a message below and I’ll get back to you!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.5),
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: 600,
            child: Column(
              children: [
                _buildTextField("Name", TextEditingController()),
                const SizedBox(height: 25),
                _buildTextField("Email", TextEditingController()),
                const SizedBox(height: 25),
                _buildTextField(
                  "Message",
                  TextEditingController(),
                  maxLines: 5,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  height: 55,
                  width: double.infinity,
                  backgroundColor: Colors.white,
                  text: 'Send Message',
                  textColor: AppColors.primaryColor,
                  fontSize: 16,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white60),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white70, width: 1.2),
        ),
      ),
    );
  }
}
