import 'package:estate_iq/presentation/screens/quetions/question4_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Question4Screen extends StatefulWidget {
  const Question4Screen({super.key});

  @override
  State<Question4Screen> createState() => _Question4ScreenState();
}

class _Question4ScreenState extends State<Question4Screen> {
  final TextEditingController _controller = TextEditingController();

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
                                  color: i <= 3
                                      ? const Color(0xFF13C39C)
                                      : Colors.white,
                                  border: Border.all(
                                    color: i <= 3
                                        ? const Color(0xFF13C39C)
                                        : const Color(0xFFBFC6CE),
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: i <= 3
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
                  "Alright, we’re almost there! Now, let’s talk location. Do you already have a city or region in mind, or would you like me to suggest high-growth areas that could maximize your returns?",
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
                    "Location Preference",
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
                    // Input field
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Icon(
                              FontAwesomeIcons.locationDot,
                              color: Color(0xFFBFC6CE),
                              size: 18,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter City or Post Code",
                                hintStyle: TextStyle(
                                  color: Color(0xFFBFC6CE),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                isDense: true,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF232B36),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 6.0),
                            child: Icon(
                              FontAwesomeIcons.wandMagicSparkles,
                              color: Color(0xFF13C39C),
                              size: 20,
                            ),
                          ),
                          Flexible(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Question4ConfirmScreen(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF13C39C),
                                padding: EdgeInsets.zero,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              child: const Text(
                                "Not Sure? Let AI suggest top-performing areas",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
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
