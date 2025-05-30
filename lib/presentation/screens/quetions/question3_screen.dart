import 'package:estate_iq/presentation/screens/quetions/question3_confirm_screen.dart';
import 'package:flutter/material.dart';

class Question3Screen extends StatefulWidget {
  const Question3Screen({super.key});

  @override
  State<Question3Screen> createState() => _Question3ScreenState();
}

class _Question3ScreenState extends State<Question3Screen> {
  int selectedIndex = 0;

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
                                color: i <= 2
                                    ? const Color(0xFF13C39C)
                                    : Colors.white,
                                border: Border.all(
                                  color: i <= 2
                                      ? const Color(0xFF13C39C)
                                      : const Color(0xFFBFC6CE),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: i <= 2
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
                "We’re making great progress! Now, let’s talk about the condition of your ideal property. Are you looking for something move-in-ready, or are you open to taking on a renovation project to boost value?",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF232B36),
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
                  "Property Condition",
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
              child: Row(
                children: [
                  _ConditionOption(
                    text: "Move-in-Ready",
                    selected: selectedIndex == 0,
                    onTap: () => setState(() {selectedIndex = 0;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Question3ConfirmScreen(),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(width: 16),
                  _ConditionOption(
                    text: "Open to\nRenovations",
                    selected: selectedIndex == 1,
                    onTap: () => setState(() {
                      selectedIndex = 1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Question3ConfirmScreen(),
                        ),
                      );
                    }),
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

class _ConditionOption extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _ConditionOption({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: selected
                  ? const Color(0xFF13C39C)
                  : const Color(0xFFE5E7EB),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: const Color(0xFF13C39C).withValues(alpha: .08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selected
                  ? const Color(0xFF13C39C)
                  : const Color(0xFF232B36),
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
