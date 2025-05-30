import 'package:estate_iq/presentation/screens/quetions/question6_confirm_screen.dart';
import 'package:flutter/material.dart';

class Question6Screen extends StatefulWidget {
  const Question6Screen({super.key});

  @override
  State<Question6Screen> createState() => _Question6ScreenState();
}

class _Question6ScreenState extends State<Question6Screen> {
  bool renovationInterest = false;

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
                                color: i <= 5
                                    ? const Color(0xFF13C39C)
                                    : Colors.white,
                                border: Border.all(
                                  color: i <= 5
                                      ? const Color(0xFF13C39C)
                                      : const Color(0xFFBFC6CE),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: i <= 5
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
                "We’re almost there! One last question — are you interested in properties where renovations could boost the property’s value and maximize your returns? Or would you prefer something that’s already move-in-ready?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF232B36),
                  height: 1.35,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFF13C39C),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF13C39C).withValues(alpha: .03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Renovation Interest",
                            style: TextStyle(
                              color: Color(0xFF232B36),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Would you like to see properties where renovations could increase value?",
                            style: TextStyle(
                              color: Color(0xFF8A97A8),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: renovationInterest,
                      onChanged: (val) {
                        setState(() {
                          renovationInterest = val;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question6ConfirmScreen(),
                            ),
                          );
                        });
                      },
                      activeColor: Color(0xFF13C39C),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
