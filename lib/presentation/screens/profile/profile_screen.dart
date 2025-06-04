import 'package:estate_iq/presentation/screens/profile/help_support_screen.dart';
import 'package:estate_iq/presentation/screens/profile/setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage(
                          'assets/images/example_avatar.png',
                        ),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Robert Anderson',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xFF232B36),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'robertanderson007@mail.com',
                        style: TextStyle(
                          color: Color(0xFF8A97A8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 2,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFF232B36),
                      ),
                      onPressed: () {},
                      tooltip: 'Edit Profile',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        _ProfileMenuItem(
                          icon: Icons.home_rounded,
                          iconColor: Color(0xFFFFA96B),
                          label: 'My Properties',
                          onTap: () {
                            debugPrint('My Properties tapped');
                          },
                        ),
                        _ProfileMenuItem(
                          icon: Icons.remove_red_eye_outlined,
                          iconColor: Color(0xFF6BEAFF),
                          label: 'My Inquiries',
                          onTap: () {
                            debugPrint('My Inquiries tapped');
                          },
                        ),
                        _ProfileMenuItem(
                          icon: Icons.person_outline,
                          iconColor: Color(0xFF8D8CFF),
                          label: 'My Preferences',
                          onTap: () {
                            debugPrint('My Preferences tapped');
                          },
                        ),
                        _ProfileMenuItem(
                          icon: Icons.settings_outlined,
                          iconColor: Color(0xFFFFB6B6),
                          label: 'Settings',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingScreen(),
                              ),
                            );
                          },
                        ),
                        _ProfileMenuItem(
                          icon: Icons.headset_mic_outlined,
                          iconColor: Color(0xFFB6B6FF),
                          label: 'Help & Support',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HelpSupportScreen(),
                              ),
                            );
                          },
                        ),
                        _ProfileMenuItem(
                          icon: Icons.star_border_rounded,
                          iconColor: Color(0xFFFFD36B),
                          label: 'Rate our app',
                          onTap: () {
                            debugPrint('Rate our app tapped');
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback? onTap;
  final bool showDivider;

  const _ProfileMenuItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundColor: iconColor.withValues(alpha: .12),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF232B36),
            ),
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 0,
          ),
          minLeadingWidth: 0,
        ),
        if (showDivider)
          const Divider(
            height: 0,
            thickness: 1,
            color: Color(0xFFF3F6F9),
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}
