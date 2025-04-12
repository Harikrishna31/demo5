import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBannerIndex = 0;
  final PageController _bannerController = PageController();

  @override
  void initState() {
    super.initState();
    // Auto-scroll the banner
    Future.delayed(const Duration(seconds: 5), () {
      _autoScrollBanner();
    });
  }

  void _autoScrollBanner() {
    if (!mounted) return;
    
    _currentBannerIndex = (_currentBannerIndex + 1) % 3; // Assuming 3 banners
    _bannerController.animateToPage(
      _currentBannerIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    
    Future.delayed(const Duration(seconds: 5), () {
      _autoScrollBanner();
    });
  }

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'DEELZON',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            _buildNavItem('HOME'),
            _buildNavItem('ABOUT'),
            _buildNavItem('BOOK NOW'),
            _buildNavItem('EXPLORE'),
            _buildNavItem('SUPPORT'),
            _buildNavItem('CONTACT'),
            const SizedBox(width: 20),
            _buildNavItem('LOG/REG'),
            _buildNavItem('CART'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sliding Banner
            Container(
              height: 200,
              color: Colors.grey,
              child: PageView(
                controller: _bannerController,
                onPageChanged: (index) {
                  setState(() {
                    _currentBannerIndex = index;
                  });
                },
                children: [
                  _buildBannerItem("SLIDING BANNER 1"),
                  _buildBannerItem("SLIDING BANNER 2"),
                  _buildBannerItem("SLIDING BANNER 3"),
                ],
              ),
            ),
            
            // Deal of the day
            _buildSection(
              "DEAL OF THE DAY",
              [
                _buildPosterItem(),
                _buildPosterItem(),
                _buildPosterItem(),
                _buildPosterItem(),
              ],
            ),
            
            // Health offers
            _buildSection(
              "HEALTH OFFERS",
              [
                _buildPosterItem(),
                _buildPosterItem(),
                _buildPosterItem(),
                _buildPosterItem(),
              ],
            ),
            
            // Food offers
            _buildSection(
              "FOOD OFFERS",
              [
                _buildPosterItem(),
                _buildPosterItem(),
                _buildPosterItem(),
                _buildPosterItem(),
              ],
            ),
            
            // Advertising Banner
            Container(
              height: 100,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Center(
                child: Text(
                  "ADVERTISING BANNER",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            // Other Packages
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "OTHER PACKAGES",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPackageItem(),
                      _buildPackageItem(),
                      _buildPackageItem(),
                      _buildPackageItem(),
                    ],
                  ),
                ],
              ),
            ),
            
            // Social Media Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const Text(
                    "CLICK HERE TO JOIN OUR CHANNELS:",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.facebook),
                      _buildSocialIcon(Icons.telegram),
                      _buildSocialIcon(Icons.email),
                      _buildSocialIcon(Icons.access_time),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "To join our channels, then you will get more information timely",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "COPYRIGHT TERMS AND CONDITIONS | PRIVACY POLICY",
                    style: TextStyle(fontSize: 10),
                  ),
                  const Text(
                    "COMPLAINTS | SUPPORT",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildBannerItem(String text) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: items,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPosterItem() {
    return Container(
      width: 80,
      height: 100,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "POSTER",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "BOOK NOW",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageItem() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}