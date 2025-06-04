import 'package:flutter/material.dart';

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF232B36)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Inquiries',
          style: TextStyle(
            color: Color(0xFF232B36),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt, color: Color(0xFF20C997)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search inquiries',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFBFC6CE),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          InquiryList(),
        ],
      ),
    );
  }
}

class InquiryList extends StatelessWidget {
  InquiryList({super.key});

  final List<Map<String, dynamic>> items = [
    {
      "image": "assets/images/example_stock.png",
      "title": "Luxury Apartment",
      "subtitle": "Downtown, Seattle",
      "status": InquiryStatus.active,
      "date": "Jan 15, 2025",
    },
    {
      "image": "assets/images/example_stock.png",
      "title": "Family House",
      "subtitle": "Bellevue, WA",
      "status": InquiryStatus.pending,
      "date": "Jan 12, 2025",
    },
    {
      "image": "assets/images/example_stock.png",
      "title": "Modern Condo",
      "subtitle": "Capitol Hill, Seattle",
      "status": InquiryStatus.closed,
      "date": "Jan 8, 2025",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (i) {
        final item = items[i];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: InquiryCard(
            image: item["image"],
            title: item["title"],
            subtitle: item["subtitle"],
            status: item["status"],
            date: item["date"],
          ),
        );
      }),
    );
  }
}

enum InquiryStatus { active, pending, closed }

class InquiryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final InquiryStatus status;
  final String date;

  const InquiryCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.date,
  });

  Color get statusColor {
    switch (status) {
      case InquiryStatus.active:
        return const Color(0xFF20C997);
      case InquiryStatus.pending:
        return const Color(0xFFF5A623);
      case InquiryStatus.closed:
        return const Color(0xFFBFC6CE);
    }
  }

  String get statusText {
    switch (status) {
      case InquiryStatus.active:
        return "Active";
      case InquiryStatus.pending:
        return "Pending";
      case InquiryStatus.closed:
        return "Closed";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isClosed = status == InquiryStatus.closed;
    return Opacity(
      opacity: isClosed ? 0.6 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF232B36),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Color(0xFF8A97A8),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, color: statusColor, size: 10),
                            const SizedBox(width: 6),
                            Text(
                              statusText,
                              style: TextStyle(
                                color: statusColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  status == InquiryStatus.closed
                      ? Icon(Icons.more_vert, color: Color(0xFFBFC6CE))
                      : PopupMenuButton<int>(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Color(0xFFBFC6CE),
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(value: 1, child: Text('Test1')),
                            const PopupMenuItem(value: 2, child: Text('Test2')),
                          ],
                          onSelected: (value) {
                            // Handle menu selection if needed
                          },
                        ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Inquiry Date",
                    style: TextStyle(color: Color(0xFF8A97A8), fontSize: 13),
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFF8A97A8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
