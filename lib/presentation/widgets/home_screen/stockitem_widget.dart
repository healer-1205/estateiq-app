import 'package:flutter/material.dart';

class StockItemWidget extends StatefulWidget {
  const StockItemWidget({super.key});

  @override
  State<StockItemWidget> createState() => _StockItemWidgetState();
}

class _StockItemWidgetState extends State<StockItemWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          // handle card tap
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF232B36).withValues(alpha: .06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Image & tags
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    child: Image.asset(
                      'assets/images/example_stock.png',
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 24,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF9C9C9C,
                            ).withValues(alpha: .54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'APARTMENT',
                            style: TextStyle(
                              color: Color(0xFFE9E6E4),
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF9C9C9C,
                            ).withValues(alpha: .54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Low Risk ROI 3%',
                            style: TextStyle(
                              color: Color(0xFFE9E6E4),
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : const Color(0xFFBFC6CE),
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ],
              ),
              // Info
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Grand Tower',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xFF232B36),
                            ),
                          ),
                        ),
                        Text(
                          '£98,000',
                          style: TextStyle(
                            color: Color(0xFF13C39C),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '25 Maple Drive, London, UK',
                      style: TextStyle(
                        color: Color(0xFF8A97A8),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _IconText(icon: Icons.bed, text: '3'),
                        const SizedBox(width: 10),
                        _IconText(icon: Icons.bathtub, text: '2'),
                        const SizedBox(width: 10),
                        _IconText(icon: Icons.directions_car, text: '2'),
                        const SizedBox(width: 10),
                        _IconText(icon: Icons.square_foot, text: '900 ft²'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'RISK LEVEL : HIGH',
                            style: TextStyle(
                              color: Color(0xFFFF5A5A),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Invest Score',
                          style: TextStyle(
                            color: Color(0xFF8A97A8),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF7E6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFB800),
                                size: 14,
                              ),
                              SizedBox(width: 2),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  color: Color(0xFFFFB800),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

class _IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF8A97A8), size: 15),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF232B36),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
