import 'package:estate_iq/presentation/screens/home_screen.dart';
import 'package:estate_iq/presentation/screens/onboarding_screen.dart';
import 'package:estate_iq/presentation/widgets/splash_screen/div_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart'; // For OnboardingProvider

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    final showOnboarding = !(prefs.getBool('onboarding_complete') ?? false);

    // Wait a moment to show splash (optional)
    await Future.delayed(const Duration(milliseconds: 800));

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
    return const Scaffold(
      backgroundColor: Color(0xFF0F6045),
      body: SafeArea(
        child: Stack(
          children: [
            DivOverlay(),
          ],
        ),
      ),
    );
  }
}
