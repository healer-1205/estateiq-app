import 'package:estate_iq/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<OnboardingProvider>(context, listen: false)
                .completeOnboarding();
          },
          child: Text('Complete Onboarding'),
        ),
      ),
    );
  }
}