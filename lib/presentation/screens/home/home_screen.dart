import 'package:estate_iq/presentation/screens/home/high_roi_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left menu icon button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF075742),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xFFF3F4F6),
                          child: IconButton(
                            icon: const Icon(
                              Icons.grid_view_rounded,
                              color: Color(0xFF8C8C8C),
                            ),
                            onPressed: () {
                              // open menu drawer
                              Scaffold.of(context).openDrawer();
                            },
                            tooltip: 'Menu',
                          ),
                        ),
                      ),
                    ),
                    // Center logo + text
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'EstateIQ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // Right notification icon button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF075742),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xFFF3F4F6),
                          child: IconButton(
                            icon: const Icon(
                              Icons.notifications_none_rounded,
                              color: Color(0xFF8C8C8C),
                            ),
                            onPressed: () {
                              // notifications
                            },
                            tooltip: 'Notifications',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  tabs: const <Widget>[
                    Tab(
                      child: Text(
                        "High ROI",
                        style: TextStyle(fontSize: 12),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Low-Risk",
                        style: TextStyle(fontSize: 12),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "High Potential",
                        style: TextStyle(fontSize: 12),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Investor Picks",
                        style: TextStyle(fontSize: 12),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xFF059669),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: Color(0xFF059669), width: 3),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8),
                      right: Radius.circular(8),
                    ),
                    insets: EdgeInsets.zero,
                  ),
                ),
              ),
              // Tab views
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    HighRoiScreen(),
                    Center(child: Text("It's rainy here")),
                    Center(child: Text("It's sunny here")),
                    Center(child: Text("It's test here")),
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
