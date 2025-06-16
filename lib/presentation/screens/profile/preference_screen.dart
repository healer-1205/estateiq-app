import 'package:flutter/material.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  int selectedGoal = 0;
  double priceRange = 500000;
  double roi = 8;
  bool priceDropAlerts = true;
  bool marketTrends = false;
  bool renovationInterest = true;
  bool taxEstimates = false;
  int selectedPurchaseType = 0;
  List<bool> features = [true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Preferences",
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                          'assets/images/example_avatar.png',
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Alex Thompson",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF232B36),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "edit your investment preferences",
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
              ),
            ),
            const SizedBox(height: 8),
            // Investment Goals
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      "Investment Goals",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      children: [
                        _GoalCard(
                          icon: Icons.home,
                          label: "Buy-to-let\nRental Income",
                          selected: selectedGoal == 0,
                          onTap: () => setState(() => selectedGoal = 0),
                        ),
                        _GoalCard(
                          icon: Icons.trending_up,
                          label: "Buy-to-Sell\nFlipping",
                          selected: selectedGoal == 1,
                          onTap: () => setState(() => selectedGoal = 1),
                        ),
                        _GoalCard(
                          icon: Icons.key,
                          label: "First-Time\nPersonal Use",
                          selected: selectedGoal == 2,
                          onTap: () => setState(() => selectedGoal = 2),
                        ),
                        // Add more cards here if needed
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Location Preferences
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      "Location Preferences",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search cities or neighborhoods",
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: Color(0xFFBFC6CE),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFBFC6CE), // Set border color here
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFBFC6CE), // Set border color here
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF20C997), // Optional: focused color
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
            // Property Type
            Container(
              color: Colors.white, // Set background color to white
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      "Property Type",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        _CheckTile(label: "Single-family Home"),
                        _CheckTile(label: "Multi-family"),
                        _CheckTile(label: "Condo/Apartment"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Budget & ROI
            Container(
              color: Colors.white, // Set background color to white
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      "Budget & ROI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Price Range",
                          style: TextStyle(
                            color: Color(0xFF8A97A8),
                            fontSize: 13,
                          ),
                        ),
                        Slider(
                          value: priceRange,
                          min: 100000,
                          max: 1000000,
                          divisions: 9,
                          label: "\$${(priceRange ~/ 1000) * 1000 ~/ 1000}K",
                          activeColor: const Color(0xFF20C997),
                          onChanged: (v) => setState(() => priceRange = v),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "\$100K",
                              style: TextStyle(
                                color: Color(0xFF8A97A8),
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "\$1M+",
                              style: TextStyle(
                                color: Color(0xFF8A97A8),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Expected ROI",
                          style: TextStyle(
                            color: Color(0xFF8A97A8),
                            fontSize: 13,
                          ),
                        ),
                        Slider(
                          value: roi,
                          min: 5,
                          max: 15,
                          divisions: 10,
                          label: "${roi.toStringAsFixed(0)}%",
                          activeColor: const Color(0xFF20C997),
                          onChanged: (v) => setState(() => roi = v),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "5%",
                              style: TextStyle(
                                color: Color(0xFF8A97A8),
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "15%+",
                              style: TextStyle(
                                color: Color(0xFF8A97A8),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF20C997),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Save Preferences",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      "Market Alerts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            "Price Drop Alerts",
                            style: TextStyle(fontSize: 15),
                          ),
                          value: priceDropAlerts,
                          activeColor: const Color(0xFF20C997),
                          onChanged: (v) => setState(() => priceDropAlerts = v),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            "Market Trends",
                            style: TextStyle(fontSize: 15),
                          ),
                          value: marketTrends,
                          activeColor: const Color(0xFF20C997),
                          onChanged: (v) => setState(() => marketTrends = v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Sustainability & Features
            Container(
              color: Colors.white, // Set background color to white
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      "Sustainability & Features",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _FeatureChip(
                          label: "Energy Efficient",
                          selected: features[0],
                          // icon: Icons.energy_savings_leaf,
                          onTap: () =>
                              setState(() => features[0] = !features[0]),
                        ),
                        const SizedBox(width: 10),
                        _FeatureChip(
                          label: "Smart Home",
                          selected: features[1],
                          // icon: Icons.home,
                          onTap: () =>
                              setState(() => features[1] = !features[1]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Purchase Type
            Container(
              color: Colors.white, // Set background color to white
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      "Purchase Type",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile<int>(
                        value: 0,
                        groupValue: selectedPurchaseType,
                        onChanged: (v) =>
                            setState(() => selectedPurchaseType = v!),
                        title: const Text("Cash Purchase"),
                        activeColor: const Color(0xFF20C997),
                      ),
                      RadioListTile<int>(
                        value: 1,
                        groupValue: selectedPurchaseType,
                        onChanged: (v) =>
                            setState(() => selectedPurchaseType = v!),
                        title: const Text("Mortgage Required"),
                        activeColor: const Color(0xFF20C997),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Renovation Interest
            Container(
              color: Colors.white, // Set background color to white
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      "Renovation Interest",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Would you like to see properties where renovations could increase value?",
                                style: TextStyle(
                                  color: Color(0xFF8A97A8),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: renovationInterest,
                          activeColor: const Color(0xFF20C997),
                          onChanged: (v) =>
                              setState(() => renovationInterest = v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Tax Estimates
            Container(
              color: Colors.white, // Set background color to white
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      "Tax Estimates",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF232B36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Do you need tax estimates for rental income or capital gains?",
                                style: TextStyle(
                                  color: Color(0xFF8A97A8),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: taxEstimates,
                          activeColor: const Color(0xFF20C997),
                          onChanged: (v) => setState(() => taxEstimates = v),
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
    );
  }
}

class _GoalCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _GoalCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? const Color(0xFF20C997)
                  : const Color(0xFFE5E7EB),
              width: 2,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: const Color(0x3320C997),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected
                    ? const Color(0xFF20C997)
                    : const Color(0xFFBFC6CE),
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF232B36),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckTile extends StatefulWidget {
  final String label;
  const _CheckTile({required this.label});

  @override
  State<_CheckTile> createState() => _CheckTileState();
}

class _CheckTileState extends State<_CheckTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      onChanged: (v) => setState(() => checked = v!),
      title: Text(widget.label, style: const TextStyle(fontSize: 15)),
      activeColor: const Color(0xFF20C997),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  // final IconData? icon;

  const _FeatureChip({
    required this.label,
    required this.selected,
    required this.onTap,
    // this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      showCheckmark: false,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (icon != null) ...[
          //   Icon(
          //     icon,
          //     size: 18,
          //     color: selected ? Colors.white : const Color(0xFF20C997),
          //   ),
          //   const SizedBox(width: 6),
          // ],
          Text(label),
        ],
      ),
      selected: selected,
      selectedColor: const Color(0xFF20C997),
      backgroundColor: const Color(0xFFF6F7F9),
      labelStyle: TextStyle(
        color: selected ? Colors.white : const Color(0xFF232B36),
        fontWeight: FontWeight.bold,
      ),
      onSelected: (_) => onTap(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: selected ? const Color(0xFF20C997) : const Color(0xFFE5E7EB),
        ),
      ),
      elevation: 0,
    );
  }
}
