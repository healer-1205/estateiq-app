import 'package:flutter/material.dart';

class InvestmentAnalysisScreen extends StatelessWidget {
  const InvestmentAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Investment Analysis",
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
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Color(0xFF232B36)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/example_property.png',
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF20C997),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "£110,000",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Grand Tower",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF20C997),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "25 Maple Road, London",
                    style: TextStyle(color: Color(0xFF8A97A8), fontSize: 13),
                  ),
                ],
              ),
            ),
            // Assistant Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFF20C997),
                    radius: 16,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 179, 233, 215),
                      radius: 18,
                      child: Image.asset(
                        'assets/images/agent.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "KeyIQ Assistant",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF232B36),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Investment Specialist",
                        style: TextStyle(
                          color: Color(0xFF8A97A8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Assistant Message
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 8, 20, 8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F7EF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Let's break down the minimum investment needed for this property. Here's the estimate:",
                  style: TextStyle(color: Color(0xFF232B36), fontSize: 14),
                ),
              ),
            ),
            // Investment Breakdown Cards
            const _InvestmentBreakdownCard(
              icon: Icons.payments,
              title: "Deposit Amount",
              value: "£85,000",
              subtitle: "20% of property value",
            ),
            const _InvestmentBreakdownCard(
              icon: Icons.receipt_long,
              title: "Stamp Duty & Legal Fees",
              value: "£12,750",
              subtitle: "Including registration and surveys",
            ),
            const _InvestmentBreakdownCard(
              icon: Icons.build,
              title: "Renovation Costs",
              value: "£5,000",
              subtitle: "Basic upgrades and repairs",
            ),
            const _InvestmentBreakdownCard(
              icon: Icons.savings,
              title: "Cash Flow Buffer",
              value: "£7,250",
              subtitle: "3 months emergency fund",
            ),
            // Total Minimum Investment
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.fromLTRB(80, 8, 20, 8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF20C997),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Total Minimum Investment £110,000",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Suggestion
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              padding: const EdgeInsets.fromLTRB(80, 8, 20, 8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F7EF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Ready to explore properties that fit your budget? Let's refine your search!",
                  style: TextStyle(color: Color(0xFF232B36), fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF20C997),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Handle matching properties action
            },
            child: const Text(
              "Matching Properties",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InvestmentBreakdownCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;

  const _InvestmentBreakdownCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.fromLTRB(80, 8, 20, 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFF1F3F6)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFF1F3F6),
              radius: 18,
              child: Icon(icon, color: const Color(0xFF20C997), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF232B36),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF8A97A8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF20C997),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
