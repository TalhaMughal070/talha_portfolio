import 'package:flutter/material.dart';
import 'package:talha_portfolio/constants/app_colors.dart';

class ProjectFeaturedSection extends StatelessWidget {
  const ProjectFeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        const Text(
          'Featured Projects',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 100),

        Wrap(
          spacing: 40,
          runSpacing: 40,
          alignment: WrapAlignment.center,
          children: const [
            ProjectCard(
              emoji: "💼",
              title: "Portfolio Website",
              description:
                  "A modern and responsive Flutter web portfolio designed to highlight my skills, experience, and projects with smooth animations, gradient themes, and reusable widgets. Includes sections like About Me, Skills, and Contact integrated with form submission.",
              tags: ["Flutter Web", "Responsive", "UI/UX"],
              gradientColors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
            ),
            ProjectCard(
              emoji: "🍔",
              title: "Smart Food Delivery App",
              description:
                  "A full-stack food delivery app featuring user, store, and rider panels. Built with Firebase backend, Cloud Firestore, and Provider state management. Includes real-time order tracking, Google Maps integration, QR-based delivery verification, cart system, and push notifications for updates.",
              tags: [
                "Flutter",
                "Firebase",
                "Provider",
                "Google Maps",
                "QR Code",
              ],
              gradientColors: [Color(0xFFFF512F), Color(0xFFF09819)],
            ),
            ProjectCard(
              emoji: "🎯",
              title: "Affirmation & Rewards App",
              description:
                  "A motivational app providing daily affirmations and rewards based on user streaks. Includes a powerful admin web panel to manage affirmations, images, and streak data using Cloudinary and Firebase Firestore. Designed with Provider and modular MVVM architecture for scalability.",
              tags: [
                "Flutter Web",
                "Provider",
                "Cloudinary",
                "Firestore",
                "MVVM",
              ],
              gradientColors: [Color(0xFF6E72FC), Color(0xFFAD1DEB)],
            ),
            ProjectCard(
              emoji: "💬",
              title: "Real-Time Chat App",
              description:
                  "A feature-rich chat app supporting real-time messaging, image sharing, voice notes, and user presence detection. Developed using Firebase Authentication, Cloud Firestore, and Firebase Storage with clean UI and efficient message synchronization.",
              tags: ["Flutter", "Firebase", "Chat", "Voice Notes"],
              gradientColors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
            ),
            ProjectCard(
              emoji: "🛍️",
              title: "E-Commerce App",
              description:
                  "A complete shopping app built using Flutter and Firebase with Stripe integration for secure payments. Includes product listings, advanced search, cart management, order tracking, and user authentication. Designed for smooth navigation and consistent UI/UX experience.",
              tags: ["Flutter", "Firebase", "Stripe", "Cart System", "Auth"],
              gradientColors: [Color(0xFF02AABD), Color(0xFF00CDAC)],
            ),
          ],
        ),

        const SizedBox(height: 100),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;
  final List<String> tags;
  final List<Color> gradientColors;

  const ProjectCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
    required this.tags,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Text(emoji, style: const TextStyle(fontSize: 45)),
          const Spacer(),
          Container(
            height: 340,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
