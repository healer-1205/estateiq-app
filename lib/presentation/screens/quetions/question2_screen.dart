import 'package:estate_iq/presentation/screens/quetions/question2_confirm_screen.dart';
import 'package:flutter/material.dart';

class Question2Screen extends StatefulWidget {
  const Question2Screen({super.key});

  @override
  State<Question2Screen> createState() => _Question2ScreenState();
}

class _Question2ScreenState extends State<Question2Screen> {
  int selectedIndex = 1;

  final List<String> budgets = ['£100K or less', '£250K', '£500K', '£1M+'];

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
                                color: i <= 1
                                    ? const Color(0xFF13C39C)
                                    : Colors.white,
                                border: Border.all(
                                  color: i <= 1
                                      ? const Color(0xFF13C39C)
                                      : const Color(0xFFBFC6CE),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: i <= 1
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
                "i’m starting to get a sense of your investment style! Now, let’s talk numbers. What’s your maximum budget? Don’t worry — if financing options could help stretch your buying power, I’ll suggest those too.",
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 32.0, bottom: 8),
                child: Text(
                  "Maximum Budget",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8A97A8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _BudgetOption(
                        text: budgets[0],
                        selected: selectedIndex == 0,
                        onTap: () => setState(() {
                          selectedIndex = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question2ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 12),
                      _BudgetOption(
                        text: budgets[1],
                        selected: selectedIndex == 1,
                        onTap: () => setState(() {
                          selectedIndex = 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question2ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _BudgetOption(
                        text: budgets[2],
                        selected: selectedIndex == 2,
                        onTap: () => setState(() {
                          selectedIndex = 2;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question2ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 12),
                      _BudgetOption(
                        text: budgets[3],
                        selected: selectedIndex == 3,
                        onTap: () => setState(() {
                          selectedIndex = 3;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question2ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                    ],
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

class _BudgetOption extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _BudgetOption({
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
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: const Color(0xFF13C39C).withValues(alpha: 0.08),
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
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
