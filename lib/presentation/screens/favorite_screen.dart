import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Map<String, dynamic>> _favoriteProperties = [
    {
      'forSale': true,
      'price': 850000,
      'title': 'Modern Villa in Beverly Hills',
      'beds': 4,
      'baths': 3,
      'area': 2400,
      'imageUrl': 'assets/images/example_property.png',
      'isFavorite': true,
    },
    {
      'forSale': false,
      'price': 3200,
      'title': 'Luxury Apartment Downtown',
      'beds': 2,
      'baths': 2,
      'area': 1200,
      'imageUrl': 'assets/images/example_property.png',
      'isFavorite': true,
    },
  ];

  void _handleFavoriteToggle(int index) {
    setState(() {
      _favoriteProperties[index]['isFavorite'] = !_favoriteProperties[index]['isFavorite'];
      // If property is unfavorited, remove it from the list after a short delay
      if (!_favoriteProperties[index]['isFavorite']) {
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            _favoriteProperties.removeAt(index);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _favoriteProperties.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _favoriteProperties.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final property = _favoriteProperties[index];
                return PropertyCard(
                  forSale: property['forSale'],
                  price: property['price'],
                  title: property['title'],
                  beds: property['beds'],
                  baths: property['baths'],
                  area: property['area'],
                  imageUrl: property['imageUrl'],
                  initialIsFavorite: property['isFavorite'],
                  onFavoriteToggle: () => _handleFavoriteToggle(index),
                );
              },
            ),
    );
  }
}

class PropertyCard extends StatefulWidget {
  final bool forSale;
  final num price;
  final String title;
  final int beds;
  final int baths;
  final num area;
  final String imageUrl;
  final bool initialIsFavorite;
  final VoidCallback onFavoriteToggle;

  const PropertyCard({
    super.key,
    required this.forSale,
    required this.price,
    required this.title,
    required this.beds,
    required this.baths,
    required this.area,
    required this.imageUrl,
    required this.initialIsFavorite,
    required this.onFavoriteToggle,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialIsFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: widget.forSale ? Colors.green : Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.forSale ? 'For Sale' : 'For Rent',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.green,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.forSale
                      ? '\$${widget.price.toStringAsFixed(0)}'
                      : '\$${widget.price.toStringAsFixed(0)}/mo',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildFeature(Icons.bed, '${widget.beds}'),
                    const SizedBox(width: 24),
                    _buildFeature(Icons.bathtub, '${widget.baths}'),
                    const SizedBox(width: 24),
                    _buildFeature(Icons.square_foot, '${widget.area.toStringAsFixed(0)} sq ft'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.black54,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
