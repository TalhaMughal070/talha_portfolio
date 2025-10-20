import 'package:flutter/material.dart';
import 'package:talha_portfolio/constants/app_colors.dart';
import 'package:talha_portfolio/responsive/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 50 : 0,
        vertical: isDesktop ? 80 : 0,
      ),
      child: Column(
        children: [
          SizedBox(height: 100),

          const Text(
            'My Skills',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 100),
          Wrap(
            spacing: 30,
            runSpacing: 25,
            children: const [
              SkillBox(
                iconImage: 'assets/icons/flutter.png',
                title: "Flutter & Dart",
                subtitle:
                    "Building beautiful, high-performance cross-platform apps",
              ),
              SkillBox(
                iconImage: 'assets/icons/fire.png',
                title: "Firebase Integration",
                subtitle:
                    "Authentication, Firestore, Storage, and Cloud Functions",
              ),
              SkillBox(
                iconImage: 'assets/icons/state.png',
                title: "Provider & State Management",
                subtitle:
                    "Clean architecture and scalable app-wide state handling",
              ),
              SkillBox(
                iconImage: 'assets/icons/api.png',
                title: "REST APIs",
                subtitle:
                    "Backend connectivity, JSON handling, and integration",
              ),
              SkillBox(
                iconImage: 'assets/icons/ui.png',
                title: "UI/UX Design",
                subtitle:
                    "Crafting modern, user-friendly, and responsive interfaces",
              ),
              SkillBox(
                iconImage: 'assets/icons/test.png',
                title: "Testing & Debugging",
                subtitle:
                    "Delivering stable, optimized, and bug-free applications",
              ),
              SkillBox(
                iconImage: 'assets/icons/data.png',
                title: "Local Databases",
                subtitle: "Hive and SQLite for efficient offline data storage",
              ),
              SkillBox(
                iconImage: 'assets/icons/performance.png',
                title: "App Performance",
                subtitle:
                    "Optimizing speed, memory, and smooth user experiences",
              ),
              SkillBox(
                iconImage: 'assets/icons/git.png',
                title: "Git & GitHub",
                subtitle: "Version control, collaboration, and CI/CD workflow",
              ),
              SkillBox(
                iconImage: 'assets/icons/client.png',
                title: "Client Collaboration",
                subtitle:
                    "Client hunting, clear communication, and on-time delivery",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillBox extends StatelessWidget {
  final String iconImage;
  final String title;
  final String subtitle;

  const SkillBox({
    super.key,
    required this.iconImage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);
    return Container(
      height: 320,

      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top gradient line
          Container(
            height: 5,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.primaryColor2],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Icon
          Image.asset(iconImage, height: 40, width: 40),
          const SizedBox(height: 15),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(height: 10),

          // Subtitle
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.textColor,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 18),

          // Bottom progress bar
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: Color(0xffE9ECEF),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
