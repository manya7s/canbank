import 'package:flutter/material.dart';
import 'transfer_type_page.dart';
import 'transaction_history_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final Color primaryBlue = Color(0xFF3B5EDF);
  final Color lightBg = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: primaryBlue,
              child: Text('U', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 8),
            Text("Dear Customer", style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black)
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: Colors.black)
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
            icon: Icon(Icons.power_settings_new, color: Colors.black),
            tooltip: 'Logout',
          ),
        ],

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _portfolioCard(),
            SizedBox(height: 16),
            _sectionTitle("Quick Actions"),
            _iconGrid([
              {'label': 'Send Money', 'icon': Icons.send, 'action': () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TransferTypePage()));
              }},
              {'label': 'Account Summary', 'icon': Icons.account_balance, 'action': () {}},
              {'label': 'Pay Bills', 'icon': Icons.receipt, 'action': () {}},
              {'label': 'Fixed Deposit', 'icon': Icons.savings, 'action': () {}},
              {'label': 'Cash', 'icon': Icons.attach_money, 'action': () {}},
              {'label': 'Recharge', 'icon': Icons.phone_android, 'action': () {}},
              {'label': 'Statements', 'icon': Icons.insert_drive_file, 'action': () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TransactionHistoryPage()));
              }},
              {'label': 'Accounts', 'icon': Icons.account_box, 'action': () {}},
            ]),
            SizedBox(height: 16),
            _promoBanner("Medical Expenses", "Get covered up to 25%", Icons.health_and_safety, Colors.orange),
            SizedBox(height: 16),
            _sectionTitle("Pay & Transfer"),
            _iconRow([
              {'label': 'Send Money', 'icon': Icons.send},
              {'label': 'Direct Pay', 'icon': Icons.qr_code_scanner},
              {'label': 'ePassbook', 'icon': Icons.book},
              {'label': 'My Beneficiary', 'icon': Icons.group},
            ]),
            _iconRow([
              {'label': 'Card-less', 'icon': Icons.credit_card_off},
              {'label': 'Donation', 'icon': Icons.volunteer_activism},
              {'label': 'History', 'icon': Icons.history},
              {'label': 'Manage', 'icon': Icons.settings},
            ]),
            SizedBox(height: 16),
            _sectionTitle("Accounts & Services"),
            _iconRow([
              {'label': 'Account Summary', 'icon': Icons.account_balance},
              {'label': 'Mobile Banking', 'icon': Icons.phone_android},
              {'label': 'Statement', 'icon': Icons.description},
              {'label': 'Settings', 'icon': Icons.settings},
            ]),
            _iconRow([
              {'label': 'Debit Card', 'icon': Icons.credit_card},
              {'label': 'Security', 'icon': Icons.security},
              {'label': 'Passbook', 'icon': Icons.menu_book},
              {'label': 'Calculator', 'icon': Icons.calculate},
            ]),
            SizedBox(height: 16),
            _sectionTitle("Deposits"),
            _iconRow([
              {'label': 'FD Calculator', 'icon': Icons.calculate},
              {'label': 'Deposit History', 'icon': Icons.list_alt},
              {'label': 'Manage Deposits', 'icon': Icons.folder},
              {'label': 'Certificates', 'icon': Icons.verified},
            ]),
            SizedBox(height: 24),
            _promoBanner("Credit Card", "Get your Pre-Approved Credit Card Now!", Icons.credit_card, primaryBlue),
            SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Bill Pay'),
          BottomNavigationBarItem(icon: Icon(Icons.mobile_friendly), label: 'Canara Digital'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'ATM'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );

  Widget _portfolioCard() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF3B5EDF), Color(0xFF4C84EF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Portfolio", style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text("Show", style: TextStyle(color: Color(0xFF3B5EDF))),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text("ai", style: TextStyle(color: Color(0xFF3B5EDF))),
        ),
      ],
    ),
  );

  Widget _promoBanner(String title, String subtitle, IconData icon, Color color) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, size: 40, color: color),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(subtitle),
          ],
        ),
      ],
    ),
  );

  Widget _iconGrid(List<Map<String, dynamic>> items) => GridView.count(
    crossAxisCount: 4,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: items.map((item) {
      return InkWell(
        onTap: item['action'],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(item['icon'], color: Color(0xFF3B5EDF)),
            ),
            SizedBox(height: 4),
            Text(item['label'], textAlign: TextAlign.center),
          ],
        ),
      );
    }).toList(),
  );

  Widget _iconRow(List<Map<String, dynamic>> items) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.map((item) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(item['icon'], color: Color(0xFF3B5EDF)),
            ),
            SizedBox(height: 4),
            Text(item['label'], textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
          ],
        );
      }).toList(),
    ),
  );
}
