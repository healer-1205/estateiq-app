import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;
  String language = 'English';

  void _showLanguageDialog() async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Language'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'English'),
            child: const Text('English'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'Chinese'),
            child: const Text('Chinese'),
          ),
        ],
      ),
    );
    if (selected != null && selected != language) {
      setState(() {
        language = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF232B36)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF232B36),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        foregroundColor: const Color(0xFF232B36),
        surfaceTintColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(
                    'assets/images/example_avatar.png',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'John Anderson',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xFF232B36),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Premium Member',
                        style: TextStyle(
                          color: Color(0xFF8A97A8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Color(0xFFBFC6CE)),
              ],
            ),
          ),
          const _SectionHeader('Account Settings'),
          _SettingTile(
            icon: Icons.notifications,
            iconColor: Colors.green,
            title: 'Notifications',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.lock,
            iconColor: Colors.green,
            title: 'Privacy & Security',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.credit_card,
            iconColor: Colors.green,
            title: 'Payment Methods',
            onTap: () {},
          ),
          const _SectionHeader('AI Preferences'),
          _SettingTile(
            icon: Icons.account_tree_outlined,
            iconColor: Colors.green,
            title: 'Investment Strategy',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.show_chart,
            iconColor: Colors.green,
            title: 'Risk Tolerance',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.tune,
            iconColor: Colors.green,
            title: 'Market Preferences',
            onTap: () {},
          ),
          const _SectionHeader('App Settings'),
          _SettingTile(
            icon: Icons.language,
            iconColor: Colors.green,
            title: 'Language',
            trailing: Text(
              language,
              style: const TextStyle(
                color: Color(0xFF8A97A8),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            onTap: _showLanguageDialog,
          ),
          // SwitchListTile(
          //   value: isDarkMode,
          //   onChanged: (val) {
          //     setState(() {
          //       isDarkMode = val;
          //     });
          //   },
          //   title: Row(
          //     children: [
          //       Icon(Icons.nightlight_round, color: Colors.green),
          //       const SizedBox(width: 16),
          //       const Text(
          //         'Dark Mode',
          //         style: TextStyle(
          //           color: Color(0xFF232B36),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16,
          //         ),
          //       ),
          //     ],
          //   ),
          //   activeColor: Colors.green,
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          // ),
          const _SectionHeader('Support'),
          _SettingTile(
            icon: Icons.help_outline,
            iconColor: Colors.green,
            title: 'Help Center',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.chat_bubble_outline,
            iconColor: Colors.green,
            title: 'Contact Support',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              child: const Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Delete Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0xFFF3F6F9), // <-- 이 줄 삭제
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF8A97A8),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF232B36),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing:
            trailing ??
            const Icon(Icons.chevron_right, color: Color(0xFFBFC6CE)),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        minLeadingWidth: 0,
      ),
    );
  }
}
