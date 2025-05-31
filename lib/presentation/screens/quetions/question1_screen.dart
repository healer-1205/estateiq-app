import 'package:estate_iq/presentation/screens/quetions/question1_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Question1Screen extends StatefulWidget {
  const Question1Screen({super.key});

  @override
  State<Question1Screen> createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  int selectedIndex = 0;

  final List<_GoalOption> options = [
    _GoalOption(
      icon: FontAwesomeIcons.houseChimney,
      title: 'Buy-to-Let',
      subtitle: 'Rental Income',
    ),
    _GoalOption(
      icon: FontAwesomeIcons.arrowTrendUp,
      title: 'Buy-to-Sell',
      subtitle: 'Flipping',
    ),
    _GoalOption(
      icon: FontAwesomeIcons.key,
      title: 'First-Time',
      subtitle: 'Personal Use',
    ),
    _GoalOption(
      icon: FontAwesomeIcons.building,
      title: 'Commercial',
      subtitle: 'Property',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 18),
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
                                color: i == 0
                                    ? const Color(0xFF13C39C)
                                    : Colors.white,
                                border: Border.all(
                                  color: i == 0
                                      ? const Color(0xFF13C39C)
                                      : const Color(0xFFBFC6CE),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: i == 0
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
                            color: i == 0
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
            const Text(
              "what’s your investment goal?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF232B36),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            // Options grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _GoalOptionWidget(
                        option: options[0],
                        selected: selectedIndex == 0,
                        onTap: () => setState(() {
                          selectedIndex = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question1ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 12),
                      _GoalOptionWidget(
                        option: options[1],
                        selected: selectedIndex == 1,
                        onTap: () => setState(() {
                          selectedIndex = 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question1ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _GoalOptionWidget(
                        option: options[2],
                        selected: selectedIndex == 2,
                        onTap: () => setState(() {
                          selectedIndex = 2;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question1ConfirmScreen(),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 12),
                      _GoalOptionWidget(
                        option: options[3],
                        selected: selectedIndex == 3,
                        onTap: () => setState(() {
                          selectedIndex = 3;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question1ConfirmScreen(),
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

class _GoalOption {
  final IconData icon;
  final String title;
  final String subtitle;

  const _GoalOption({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class _GoalOptionWidget extends StatelessWidget {
  final _GoalOption option;
  final bool selected;
  final VoidCallback onTap;

  const _GoalOptionWidget({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                option.icon,
                color: selected
                    ? const Color(0xFF13C39C)
                    : const Color(0xFFBFC6CE),
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                option.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: selected
                      ? const Color(0xFF232B36)
                      : const Color(0xFF232B36),
                ),
              ),
              Text(
                option.subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: selected
                      ? const Color(0xFF13C39C)
                      : const Color(0xFFBFC6CE),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
