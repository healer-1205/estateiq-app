import 'dart:async';
import 'package:estate_iq/presentation/screens/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < svgData.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  final List<Map<String, String>> svgData = [
    {
      'img': 'assets/images/signup-1.svg',
      'text': 'Data-Powered Decisions',
      'description': 'Real-time trends and predictions to maximize returns',
    },
    {
      'img': 'assets/images/signup-2.svg',
      'text': 'Smart Insights, Smarter Investments',
      'description': 'AI-driven analytics to spot high-potential properties',
    },
    {
      'img': 'assets/images/signup-3.svg',
      'text': 'Invest with Intelligence',
      'description':
          'Smarter, faster, and more profitable property investments',
    },
  ];

  int currentIndex = 0;
  late final PageController _pageController;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF059669),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 300,
                maxHeight: 270,
                minWidth: 300,
                minHeight: 270,
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: svgData.length,
                onPageChanged: onPageChanged,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 180,
                        child: SvgPicture.asset(
                          svgData[index]['img']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        svgData[index]['text']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        svgData[index]['description']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(svgData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 20 : 8,
                  height: currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                // Handle Apple Sign Up
              },
              icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.black),
              label: const Text(
                'Continue with Apple ID',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(320, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                // Handle Email Sign Up
              },
              icon: const FaIcon(
                FontAwesomeIcons.solidEnvelope,
                color: Colors.white,
              ),
              label: const Text(
                '     Continue with Email',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: .16),
                minimumSize: const Size(320, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Button
                TextButton(
                  onPressed: () {
                    // Handle Google Sign Up
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: .16),
                    minimumSize: const Size(150, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                // Facebook Button
                TextButton(
                  onPressed: () {
                    // Handle Facebook Sign Up
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: .16),
                    minimumSize: const Size(150, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign In Screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
