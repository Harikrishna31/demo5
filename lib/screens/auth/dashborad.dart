import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deelzon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DeelzonProfilePage(),
    );
  }
}

class DeelzonProfilePage extends StatefulWidget {
  const DeelzonProfilePage({super.key});

  @override
  State<DeelzonProfilePage> createState() => _DeelzonProfilePageState();
}

class _DeelzonProfilePageState extends State<DeelzonProfilePage> {
  String selectedPage = 'My Profile';

  void selectPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Navigation
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'DEELZON',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildNavItem('HOME'),
                      _buildNavItem('ABOUT'),
                      _buildNavItem('BOOK NOW'),
                      _buildNavItem('EXPLORE'),
                      _buildNavItem('SUPPORT'),
                      _buildNavItem('CONTACT'),
                      const SizedBox(width: 20),
                      _buildNavItem('LOGIN / REG'),
                      _buildNavItem('CART'),
                    ],
                  ),
                ],
              ),
            ),

            // Content Area
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Sidebar
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DASHBOARD',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildSidebarItem('My Profile'),
                      _buildSidebarItem('My Orders'),
                      _buildSidebarItem('My Payments'),
                      _buildSidebarItem('Customer Care'),
                      const Divider(),
                      _buildSidebarItem('Log Out'),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: _buildSelectedContent(),
                  ),
                ),
              ],
            ),

            // Advertising Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Colors.grey.shade400,
              alignment: Alignment.center,
              child: const Text(
                'ADVERTISING BANNER',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Related Offers
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RELATED OFFERS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        const Text('CLICK HERE TO JOIN OUR CHANNELS'),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon('F'),
                            _buildSocialIcon('T'),
                            _buildSocialIcon('IN'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'If you join our channels then you will get offer notifications directly',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.grey.shade300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'COPYRIGHT | TERMS AND CONDITIONS | PRIVACY POLICY',
                    style: TextStyle(fontSize: 10),
                  ),
                  const Text(
                    'COMPLAINTS | SUPPORT',
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  Widget _buildSidebarItem(String title) {
    bool isSelected = selectedPage == title;
    return GestureDetector(
      onTap: () => selectPage(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
    String label, {
    bool isPassword = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment:
            maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            child: TextFormField(
              obscureText: isPassword,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 100,
            child: Text('Account Status', style: TextStyle(fontSize: 14)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Text(
              'Active',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }

  Widget _buildSelectedContent() {
    switch (selectedPage) {
      case 'My Profile':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MY PROFILE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  _buildFormField('Full Name'),
                  _buildFormField('Username'),
                  _buildFormField('Mobile'),
                  _buildFormField('Email ID'),
                  _buildFormField('Full Address', maxLines: 3),
                  _buildFormField('Password', isPassword: true),
                  _buildStatusField(),
                ],
              ),
            ),
          ],
        );
      case 'My Orders':
        return _buildOrdersPage();
      case 'My Payments':
        return const Text('MY PAYMENTS PAGE CONTENT');
      case 'Customer Care':
        return const Text('CUSTOMER CARE PAGE CONTENT');
      case 'Log Out':
        return const Text('LOGOUT ACTION TRIGGERED');
      default:
        return const Text('PAGE NOT FOUND');
    }
  }

  Widget _buildOrdersPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MY ORDERS',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade300,
                child: const Text(
                  'ORDER DETAILS',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              _buildOrderRow('001', 'Health Checkup', '08-04-25', 'CLAIMED'),
              _buildOrderRow('002', 'Blood Checkup', '08-04-25', 'OPEN'),
              _buildOrderRow('003', 'Urine Check Up', '08-04-25', 'CLAIMED'),
              _buildOrderRow('004', 'ECG', '08-04-25', 'OPEN'),
              // Empty space to match your design
              Container(height: 200, color: Colors.grey.shade200),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderRow(String id, String service, String date, String status) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              id,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(flex: 2, child: Text(service)),
          SizedBox(width: 100, child: Text(date)),
          SizedBox(
            width: 100,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              color: status == 'CLAIMED' ? Colors.grey : Colors.black,
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
