import 'package:estate_iq/presentation/screens/risk_analysis_screen.dart';
import 'package:estate_iq/presentation/screens/roi_analysis_screen.dart';
import 'package:flutter/material.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Property Details",
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
            icon: const Icon(Icons.favorite_border, color: Color(0xFF232B36)),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
            onPressed: () {},
            child: const Text(
              "Invest Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image with indicator
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/example_property.png',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .08),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Text(
                      "1/4",
                      style: TextStyle(
                        color: Color(0xFF232B36),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Price, address, risk
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Add this line
                    children: [
                      const Text(
                        "£1,250,000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xFF232B36),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RiskAnalysisScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6F5E6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Low Risk",
                            style: TextStyle(
                              color: Color(0xFF20C997),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "123 Luxury Lane, Beverly Hills, CA",
                    style: TextStyle(color: Color(0xFF8A97A8), fontSize: 14),
                  ),
                ],
              ),
            ),
            // ROI, Term, Min Invest
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _InfoCard(
                    icon: Icons.trending_up,
                    label: "ROI",
                    value: "12.5%",
                    onTap: () {
                      // Handle ROI tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoiAnalysisScreen(),
                        ),
                      );
                    },
                  ),
                  _InfoCard(
                    icon: Icons.calendar_month,
                    label: "Term",
                    value: "36 mo",
                    onTap: () {
                      // Handle Term tap
                    },
                  ),
                  _InfoCard(
                    icon: Icons.account_balance_wallet,
                    label: "Min Invest",
                    value: "\$50k",
                    onTap: () {
                      // Handle Min Invest tap
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Amenities
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Amenities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF232B36),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 24,
                    runSpacing: 10,
                    children: const [
                      _Amenity(icon: Icons.bed, label: "4 Bedrooms"),
                      _Amenity(icon: Icons.bathtub, label: "3 Bathrooms"),
                      _Amenity(icon: Icons.local_parking, label: "2 Parking"),
                      _Amenity(icon: Icons.square_foot, label: "2,500 sqft"),
                      _Amenity(icon: Icons.pool, label: "Pool"),
                      _Amenity(icon: Icons.fitness_center, label: "Gym"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Calculators
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _CalculatorCard(
                    icon: Icons.receipt_long,
                    label: "Payment\nCalculator",
                  ),
                  _CalculatorCard(
                    icon: Icons.calculate,
                    label: "Affordability\nCalculator",
                  ),
                  _CalculatorCard(
                    icon: Icons.account_balance,
                    label: "Mortgage\nCalculator",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Investment Details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Investment Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF232B36),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(label: "Property Type", value: "Residential"),
                  _DetailRow(label: "Investment Strategy", value: "Value Add"),
                  _DetailRow(label: "Expected Annual Return", value: "12.5%"),
                  _DetailRow(label: "Occupancy Rate", value: "95%"),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF232B36),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Luxurious property in prime location with excellent investment potential. Recently renovated with modern amenities and high-end finishes. Comes equipped with smart home features, energy efficient appliances, and access to exclusive facilities. Ideal for investors seeking stable returns and long-term value. Contact us for the full investment brochure and more details.",
                    style: TextStyle(color: Color(0xFF8A97A8), fontSize: 14),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
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

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap; // Add onTap property

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap, // Add to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F7F9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: const Color(0xFF20C997), size: 24),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(color: Color(0xFF8A97A8), fontSize: 13),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF232B36),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Amenity extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Amenity({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF20C997), size: 18),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF232B36), fontSize: 14),
        ),
      ],
    );
  }
}

class _CalculatorCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CalculatorCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF20C997), size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF232B36),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF8A97A8), fontSize: 14),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF232B36),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
