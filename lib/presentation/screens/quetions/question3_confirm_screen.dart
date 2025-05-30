import 'package:estate_iq/presentation/screens/quetions/question4_screen.dart';
import 'package:flutter/material.dart';

class Question3ConfirmScreen extends StatelessWidget {
  const Question3ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            // Agent image in gray circle
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/agent.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Got it! A hassle-free, move-in-ready property means you can start earning or living it right away. I'll look for properties that are ready to go.",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF232B36),
                  height: 1.35,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Continue
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Question4Screen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF13C39C), Color(0xFF7CFDE3)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
