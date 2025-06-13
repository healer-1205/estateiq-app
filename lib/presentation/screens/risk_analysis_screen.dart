import 'package:flutter/material.dart';

class RiskAnalysisScreen extends StatefulWidget {
  const RiskAnalysisScreen({super.key});

  @override
  State<RiskAnalysisScreen> createState() => _RiskAnalysisScreenState();
}

class _RiskAnalysisScreenState extends State<RiskAnalysisScreen> {
  final TextEditingController _chatController = TextEditingController();
  final List<String> _messages = [];

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _chatController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(text);
        _chatController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Risk Analysis",
          style: TextStyle(
            color: Color(0xFF232B36),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF232B36)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Color(0xFF232B36)),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'item1', child: Text('item1')),
              const PopupMenuItem(value: 'item2', child: Text('item2')),
            ],
            onSelected: (value) {
              // Handle dropdown selection
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Grand Tower Card
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/example_property.png',
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Grand Tower",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color(0xFF20C997),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "25 Maple Road, Lodnon",
                                style: TextStyle(
                                  color: Color(0xFF8A97A8),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "£425,000",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF20C997),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const Text(
                        //   "£425,000",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 16,
                        //     color: Color(0xFF20C997),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // Agent message
                  _IconSectionCard(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Let's assess the risks for this property. Here's what I found:",
                        style: TextStyle(
                          color: Color(0xFF232B36),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  // Risk Cards
                  _RiskCard(
                    icon: Icons.show_chart,
                    title: "Market Fluctuation",
                    content:
                        "Historical price volatility: ±5.2%\nProjected value in 2026: £446,250",
                  ),
                  _RiskCard(
                    icon: Icons.timelapse,
                    title: "Vacancy Risk",
                    content:
                        "Average vacancy period: 12 days\nLocal demand score: High",
                  ),
                  _RiskCard(
                    icon: Icons.handyman,
                    title: "Maintenance Costs",
                    content: "Annual estimate: £2,400\nBuilding age: 5 years",
                  ),
                  _RiskCard(
                    icon: Icons.currency_pound,
                    title: "Rental Yield",
                    content: "Current yield: 4.8%\nArea average: 4.2%",
                  ),
                  // Overall Risk Score
                  _IconSectionCard(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.verified_user,
                                color: Color(0xFF20C997),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Overall Risk Score: Low",
                                style: TextStyle(
                                  color: Color(0xFF20C997),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Simple progress bar
                          RiskScoreProgressBar(percent: 0.8),
                        ],
                      ),
                    ),
                  ),
                  // Agent suggestion
                  _IconSectionCard(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Want to refine your search with lower-risk options?",
                        style: TextStyle(
                          color: Color(0xFF232B36),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  // Chat messages
                  if (_messages.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(_messages.length, (i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(0xFF20C997),
                                  radius: 16,
                                  child: Image.asset(
                                    'assets/images/agent.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      _messages[i],
                                      style: const TextStyle(
                                        color: Color(0xFF232B36),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Chat Footer
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF20C997),
                  radius: 20,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F7F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _chatController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ask more about this property...",
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color(0xFF20C997),
                  radius: 22,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconSectionCard extends StatelessWidget {
  final Widget child;

  const _IconSectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 32, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 179, 233, 215),
            radius: 18,
            child: Image.asset(
              'assets/images/agent.png',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _RiskCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _RiskCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align to right
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 280),
            decoration: BoxDecoration(
              color: const Color(0xFF20C997),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RiskScoreProgressBar extends StatelessWidget {
  final double percent; // 0.0 ~ 1.0

  const RiskScoreProgressBar({required this.percent, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;
        return Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE5F7EF),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: barWidth * percent,
              height: 6,
              decoration: BoxDecoration(
                color: const Color(0xFF20C997),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}
