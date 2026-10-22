import 'package:flutter/material.dart';

void main() {
  runApp(const KashmirReelsApp());
}

class KashmirReelsApp extends StatelessWidget {
  const KashmirReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kashmir Reels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const FeedScreen(),    // FYP & Friends Feed
    const SearchScreen(),  // Search Screen (Bottom Left)
    const UploadScreen(),  // Upload Video Screen (Bottom Center)
    const ProfileScreen(), // User Profile & Settings (Bottom Right)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, size: 35, color: Colors.redAccent),
            label: 'Upload',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// 1. FYP Feed Screen with 🍁 Kashmir Reels Branding
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            // Background Video Placeholder / Player
            Container(
              color: Colors.grey[900],
              child: Center(
                child: Text(
                  "🍁 Kashmir Reels Video ${index + 1}\n(Swipe Up/Down for FYP)",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            // Top App Bar Header
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Following", style: TextStyle(color: Colors.grey, fontSize: 16)),
                  SizedBox(width: 20),
                  Text("🍁 Kashmir Reels", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Right Sidebar (Like, Comment, Share, Sound)
            Positioned(
              right: 15,
              bottom: 80,
              child: Column(
                children: const [
                  CircleAvatar(radius: 22, backgroundColor: Colors.red, child: Icon(Icons.person, color: Colors.white)),
                  SizedBox(height: 20),
                  Icon(Icons.favorite, size: 35, color: Colors.white),
                  Text("12.5K", style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: 20),
                  Icon(Icons.comment, size: 35, color: Colors.white),
                  Text("420", style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: 20),
                  Icon(Icons.share, size: 35, color: Colors.white),
                  Text("Share", style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
            // Bottom Video Details & Sound Track
            Positioned(
              bottom: 20,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("@kashmiri_user_01", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Exploring the beauty of valleys! 🍁 #KashmirReels", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.music_note, size: 15, color: Colors.white),
                      SizedBox(width: 5),
                      Text("Original Sound - Kashmir Beats 🍁", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// 2. Search Screen (Bottom Left)
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search accounts, videos, hashtags 🍁',
            border: InputBorder.none,
          ),
        ),
      ),
      body: const Center(child: Text("Trending Hashtags & Discover Page")),
    );
  }
}

// 3. Upload Screen (Bottom Center)
class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload to Kashmir Reels 🍁')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload),
          label: const Text('Select Video from Gallery & Add Sound'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
        ),
      ),
    );
  }
}

// 4. Profile Screen (Bottom Right)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile (Kashmir Reels)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Account Settings page open hogi
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          SizedBox(height: 20),
          CircleAvatar(radius: 40, backgroundColor: Colors.redAccent, child: Text("🍁", style: TextStyle(fontSize: 30))),
          SizedBox(height: 10),
          Text("@kashmir_reels_official", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("120 Following   |   ", style: TextStyle(color: Colors.grey)),
              Text("45.2K Followers   |   ", style: TextStyle(color: Colors.grey)),
              Text("1.2M Likes", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
