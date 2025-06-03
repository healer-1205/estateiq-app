import 'package:estate_iq/presentation/widgets/home_screen/stockitem_widget.dart';
import 'package:flutter/material.dart';

class HighRoiScreen extends StatefulWidget {
  const HighRoiScreen({super.key});

  @override
  State<HighRoiScreen> createState() => _HighRoiScreenState();
}

class _HighRoiScreenState extends State<HighRoiScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF1B3653),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    debugPrint("View All button pressed");
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Color(0xFF233B57),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Property Card (clickable)
          StockItemWidget(),
          StockItemWidget(),
        ],
      ),
    );
  }
}
