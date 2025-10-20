import 'package:flutter/material.dart';
import 'package:talha_portfolio/constants/app_colors.dart';
import 'package:talha_portfolio/responsive/responsive.dart';
import 'package:talha_portfolio/views/my_portfolio/components/about_me_section.dart';
import 'package:talha_portfolio/views/my_portfolio/components/contact_footer_section.dart';
import 'package:talha_portfolio/views/my_portfolio/components/get_in_touch section.dart';
import 'package:talha_portfolio/views/my_portfolio/components/project_featured_section.dart';
import 'package:talha_portfolio/views/my_portfolio/components/skill_section.dart';
import 'package:talha_portfolio/widgets/custom_buttom.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
  final getInTouchKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: isDesktop ? 20 : 0,
          children: [
            _navItem('Home', () => scrollToSection(homeKey), isMobile),
            _navItem('About', () => scrollToSection(aboutKey), isMobile),
            _navItem('Skills', () => scrollToSection(skillsKey), isMobile),
            _navItem('Projects', () => scrollToSection(projectsKey), isMobile),
            _navItem('Contact', () => scrollToSection(contactKey), isMobile),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              key: homeKey,
              width: double.infinity,
              height: isMobile ? 430 : MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.primaryColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: isMobile ? 30 : 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Flutter Developer | iOS | Android | Web | Firebase | Provider | Stripe | Firestore",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(.8),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    backgroundColor: Colors.white,
                    height: isMobile ? 45 : 50,
                    width: 150,
                    textColor: Colors.black,
                    text: 'Get In Touch',
                    onTap: () => scrollToSection(getInTouchKey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(key: aboutKey, child: const AboutMeSection()),
            const SizedBox(height: 100),
            Container(key: skillsKey, child: const SkillsSection()),
            const SizedBox(height: 100),
            Container(
              key: projectsKey,
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 50),
              child: const ProjectFeaturedSection(),
            ),
            Container(key: getInTouchKey, child: GetInTouchSection()),
            Container(key: contactKey, child: ContactFooterSection()),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap, bool isMobile) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
        child: Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
