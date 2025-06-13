import 'package:estate_iq/presentation/screens/quetions/question1_screen.dart';
import 'package:flutter/material.dart';

class QuestionWaitingScreen extends StatefulWidget {
  const QuestionWaitingScreen({super.key});

  @override
  State<QuestionWaitingScreen> createState() => _QuestionWaitingScreenState();
}

class _QuestionWaitingScreenState extends State<QuestionWaitingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _dotController;
  late Animation<double> _dotAnimation;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    _dotAnimation = CurvedAnimation(
      parent: _dotController,
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Question1Screen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            // Gray circle with agent image
            Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/agent.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            // Animated dots
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AnimatedBuilder(
                  animation: _dotAnimation,
                  builder: (context, child) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(3, (i) {
                        double t = (_dotController.value * 3 - i).clamp(
                          0.0,
                          1.0,
                        );
                        double scale =
                            0.7 + 0.6 * Curves.easeInOut.transform(t);
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 10 * scale,
                          height: 10 * scale,
                          decoration: BoxDecoration(
                            color: const Color(0xFF13C39C),
                            shape: BoxShape.circle,
                            boxShadow: [
                              if (scale > 1.1)
                                BoxShadow(
                                  color: const Color(
                                    0xFF13C39C,
                                  ).withValues(alpha: .2),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }
}
