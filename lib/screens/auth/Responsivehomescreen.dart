import 'package:flutter/material.dart';

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({Key? key}) : super(key: key);

  @override
  _ResponsiveHomePageState createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  int _currentBannerIndex = 0;
  final PageController _bannerController = PageController();

  @override
  void initState() {
    super.initState();
    _setupBannerAutoScroll();
  }

  void _setupBannerAutoScroll() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        _currentBannerIndex = (_currentBannerIndex + 1) % 3;
        _bannerController.animateToPage(
          _currentBannerIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _setupBannerAutoScroll();
      }
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
      appBar: _buildAppBar(context),
      drawer: MediaQuery.of(context).size.width < 800 ? _buildDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sliding Banner
            _buildSlidingBanner(),
            
            // Deal of the day
            _buildSectionWithGrid("DEAL OF THE DAY"),
            
            // Health offers
            _buildSectionWithGrid("HEALTH OFFERS"),
            
            // Food offers
            _buildSectionWithGrid("FOOD OFFERS"),
            
            // Advertising Banner
            _buildAdvertisingBanner(),
            
            // Other Packages
            _buildOtherPackages(),
            
            // Social Media Section
            _buildSocialMediaSection(),
            
            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: const Text(
        'DEELZON',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: isSmallScreen 
        ? [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ]
        : [
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
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'DEELZON',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('HOME'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('ABOUT'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('BOOK NOW'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('EXPLORE'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('SUPPORT'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('CONTACT'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('LOGIN/REGISTER'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildSlidingBanner() {
    return Container(
      height: 200,
      color: Colors.grey,
      child: PageView(
        controller: _bannerController,
        onPageChanged: (index) {
          setState(() {
            _currentBannerIndex = index;
          });
        },
        children: List.generate(3, (index) => 
          Container(
            color: Colors.grey,
            child: Center(
              child: Text(
                "SLIDING BANNER ${index + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ),
      ),
    );
  }

  Widget _buildSectionWithGrid(String title) {
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
              int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
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
                },
              );
            },
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 500) return 2;
    if (width < 800) return 3;
    return 4;
  }

  Widget _buildAdvertisingBanner() {
    return Container(
      height: 100,
      color: Colors.grey[300],
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(
        child: Text(
          "ADVERTISING BANNER",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildOtherPackages() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "OTHER PACKAGES",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaSection() {
    return Container(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "To join our channels, then you will get more information timely",
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
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

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.grey[300],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "COPYRIGHT TERMS AND CONDITIONS | PRIVACY POLICY",
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  "COMPLAINTS | SUPPORT",
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "COPYRIGHT TERMS AND CONDITIONS | PRIVACY POLICY",
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  "COMPLAINTS | SUPPORT",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}