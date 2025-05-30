import 'package:estate_iq/presentation/screens/quetions/question5_confirm_screen.dart';
import 'package:flutter/material.dart';

class Question5Screen extends StatefulWidget {
  const Question5Screen({super.key});

  @override
  State<Question5Screen> createState() => _Question5ScreenState();
}

class _Question5ScreenState extends State<Question5Screen> {
  int selectedPurchaseType = 0; // 0: Cash Purchase, 1: Mortgage Required

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
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              // Progress bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(7, (i) {
                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: i <= 4
                                      ? const Color(0xFF13C39C)
                                      : Colors.white,
                                  border: Border.all(
                                    color: i <= 4
                                        ? const Color(0xFF13C39C)
                                        : const Color(0xFFBFC6CE),
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: i <= 4
                                      ? Colors.white
                                      : const Color(0xFFBFC6CE),
                                  size: 18,
                                ),
                              ),
                              if (i < 6)
                                Expanded(
                                  child: Container(
                                    height: 4,
                                    color: const Color(0xFFBFC6CE),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${i + 1}',
                            style: TextStyle(
                              color: i <= 1
                                  ? const Color(0xFF13C39C)
                                  : const Color(0xFFBFC6CE),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 18),
              // Agent image in gray circle
              Center(
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/agent.png',
                      width: 110,
                      height: 110,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "You're doing great! Now, let's talk about how you're planning to finance your investment. Will you be making a cash purchase, or would you like me to explore mortgage options that could work best for you?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1F2937),
                    height: 1.35,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 32.0, bottom: 8),
                  child: Text(
                    "Purchase Type",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    // Cash Purchase Option
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedPurchaseType = 0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question5ConfirmScreen(),
                          ),
                        );
                      }),
                      child: Container(
                        height: 54,
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedPurchaseType == 0
                                ? const Color(0xFF13C39C)
                                : const Color(0xFFE5E7EB),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedPurchaseType == 0
                                      ? const Color(0xFF13C39C)
                                      : const Color(0xFFBFC6CE),
                                  width: 2,
                                ),
                                color: Colors.white,
                              ),
                              child: selectedPurchaseType == 0
                                  ? Center(
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF13C39C),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 14),
                            const Text(
                              "Cash Purchase",
                              style: TextStyle(
                                color: Color(0xFF374151),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Mortgage Required Option
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedPurchaseType = 1;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question5ConfirmScreen(),
                          ),
                        );
                      }),
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedPurchaseType == 1
                                ? const Color(0xFF13C39C)
                                : const Color(0xFFE5E7EB),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedPurchaseType == 1
                                      ? const Color(0xFF13C39C)
                                      : const Color(0xFFBFC6CE),
                                  width: 2,
                                ),
                                color: Colors.white,
                              ),
                              child: selectedPurchaseType == 1
                                  ? Center(
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF13C39C),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 14),
                            const Text(
                              "Mortgage Required",
                              style: TextStyle(
                                color: Color(0xFF374151),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
