import 'package:flutter/material.dart';

class RoiAnalysisScreen extends StatefulWidget {
  const RoiAnalysisScreen({super.key});

  @override
  State<RoiAnalysisScreen> createState() => _RoiAnalysisScreenState();
}

class _RoiAnalysisScreenState extends State<RoiAnalysisScreen> {
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
      resizeToAvoidBottomInset:
          true, // Allow body to resize when keyboard appears
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "ROI Analysis",
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
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFF8A97A8),
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "25 Maple Road, London",
                                    style: TextStyle(
                                      color: Color(0xFF8A97A8),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "£750,000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF20C997),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ROI Breakdown Card
                  _IconSectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Based on current market analysis,\nhere's the ROI breakdown for this property:",
                          style: TextStyle(
                            color: Color(0xFF232B36),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _RoiRow(
                                label: "Potential Annual Rental Income",
                                value: "£36,000",
                                valueColor: Color(0xFF20C997),
                              ),
                              SizedBox(height: 8),
                              _RoiRow(
                                label: "Expected Yield",
                                value: "4.8%",
                                valueColor: Color(0xFF20C997),
                              ),
                              SizedBox(height: 8),
                              _RoiRow(
                                label: "5-Year Capital Growth",
                                value: "15.2%",
                                valueColor: Color(0xFF20C997),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Market Insights Card
                  _IconSectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Market insights for Manchester:",
                          style: TextStyle(
                            color: Color(0xFF232B36),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              // Example bar chart (static)
                              SizedBox(
                                height: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _Bar(height: 30),
                                    _Bar(height: 45),
                                    _Bar(height: 60),
                                    _Bar(height: 65),
                                    _Bar(height: 65),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Property Value Growth (5 Years)",
                                style: TextStyle(
                                  color: Color(0xFF8A97A8),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Additional Considerations Card
                  _IconSectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Additional considerations:",
                          style: TextStyle(
                            color: Color(0xFF232B36),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _BulletText(
                                text: "Strong rental demand in L1 postcode",
                                checked: true,
                              ),
                              _BulletText(
                                text: "New transport links increasing value",
                              ),
                              _BulletText(
                                text:
                                    "Potential for further capital appreciation",
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                  backgroundImage: AssetImage(
                                    'assets/images/agent.png',
                                  ),
                                  radius: 16,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoiRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _RoiRow({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF8A97A8), fontSize: 13),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  const _Bar({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF20C997),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;
  final bool checked;

  const _BulletText({required this.text, this.checked = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checked
              ? const Icon(Icons.check, color: Color(0xFF20C997), size: 18)
              : const Text(
                  "•",
                  style: TextStyle(color: Color(0xFF20C997), fontSize: 18),
                ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF232B36), fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
