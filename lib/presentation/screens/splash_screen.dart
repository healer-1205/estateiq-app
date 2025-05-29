import 'package:estate_iq/presentation/screens/auth/signup_screen.dart';
import 'package:estate_iq/presentation/screens/home_screen.dart';
import 'package:estate_iq/presentation/screens/onboarding_screen.dart';
import 'package:estate_iq/presentation/widgets/splash_screen/div_overlay_widget.dart';
import 'package:estate_iq/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart'; // For OnboardingProvider

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

    Future<void> _checkAuthentication() async {
    bool isLoggedIn = await _authService.isLoggedIn();

    await Future.delayed(const Duration(milliseconds: 3000));

    if (!mounted) return;

    if (isLoggedIn) {
      _checkOnboarding();
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
    }
  }

  Future<void> _checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    final showOnboarding = !(prefs.getBool('onboarding_complete') ?? false);

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => OnboardingProvider(showOnboarding, prefs),
          child: Consumer<OnboardingProvider>(
            builder: (context, onboardingProvider, child) {
              if (onboardingProvider.showOnboarding) {
                return OnboardingScreen();
              } else {
                return HomeScreen();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF064E3B),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const DivOverlay(),
            Positioned(
              top: 161,
              left: 24,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(251, 191, 36, 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.chartLine,
                    color: Color(0xFFFBBF24),
                    size: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 211,
              right: 34,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF34D399).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.robot,
                    color: Color(0xFF6EE7B7),
                    size: 16,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 86,
                      height: 86,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'EstateIQ',
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Think Investment. Think Property.',
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    'Think EstateIQ.',
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBBF24),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBBF24),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBBF24),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Secure AI-Powered Analysis',
                    style: TextStyle(
                      color: Color(0xB3D1FAE5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 0,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Version 1.0',
                    style: TextStyle(
                      color: Color(0xB3A7F3D0).withValues(alpha: 0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
