import 'package:flutter/material.dart';
import 'package:talha_portfolio/constants/app_colors.dart';
import 'package:talha_portfolio/responsive/responsive.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    return Column(
      children: [
        const Text(
          'About Me',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: isMobile ? 0 : 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Wrap(
            spacing: 150,
            runSpacing: 50,
            children: [
              // 🖼️ Profile Image Container
              Column(
                children: [
                  const SizedBox(height: 120),
                  Container(
                    width: isMobile ? 350 : 400,
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.primaryColor2,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 170,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/images/talhaPro.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 🧍 About Text Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    """Hello! I'm a 
Flutter Developer""",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '''I specialize in building beautiful, 
high-performance mobile and web 
applications using Flutter. 
With expertise in Provider, Firebase,
and UI/UX design, I create smooth, 
responsive, and user-friendly 
experiences across iOS, Android, and Web. 
I’m passionate about clean design,
performance, and continuous learning. 
My goal is to craft digital experiences 
that blend creativity with functionality 
and leave a lasting impression. 

– Muhammad Talha''',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textColor,
                      letterSpacing: 1.0,
                      height: 2,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
