import 'package:estate_iq/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class QuestionAllSetScreen extends StatefulWidget {
  const QuestionAllSetScreen({super.key});

  @override
  State<QuestionAllSetScreen> createState() => _QuestionAllSetScreenState();
}

class _QuestionAllSetScreenState extends State<QuestionAllSetScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<double> _imageAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _imageAnimation = Tween<double>(begin: 250, end: 0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOutBack),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Start image animation, then fade in text and button
    _imageController.forward().then((_) => _fadeController.forward());
  }

  @override
  void dispose() {
    _imageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Gray circle with animated agent image
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: BoxShape.circle,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _imageAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _imageAnimation.value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/images/agent.png',
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              // Fade-in text and button
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    const Text(
                      "We're all Set!",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF232B36),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: Text(
                        "Perfect! We're all set. Now, I'm ready to match you with top investment opportunities that fit your budget, goals, and financing plan with a button",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF8A97A8),
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 240,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Get Started
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF13C39C), Color(0xFF0CA678)],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Let's Explore",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
