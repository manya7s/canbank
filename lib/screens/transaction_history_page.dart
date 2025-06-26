import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {"title": "Salary Credit", "amount": "+₹85,000", "date": "2024-01-15", "type": "credit"},
    {"title": "UPI Payment to Swiggy", "amount": "-₹245", "date": "2024-01-14", "type": "debit"},
    {"title": "ATM Withdrawal", "amount": "-₹5,000", "date": "2024-01-14", "type": "debit"},
    {"title": "Amazon refund", "amount": "+₹500", "date": "2024-01-15", "type": "credit"},
    {"title": "Uber ride", "amount": "-₹245", "date": "2024-01-14", "type": "debit"},
    {"title": "Petrol", "amount": "-₹400", "date": "2024-01-14", "type": "debit"},
    {"title": "Surat Trip", "amount": "+₹1500", "date": "2024-01-15", "type": "credit"},
    {"title": "Rewards", "amount": "+₹150", "date": "2024-01-15", "type": "credit"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction History",
          style: TextStyle(
            color: Colors.white, // Title text color
          ),
        ),
        backgroundColor: Color(0xFF3B5EDF),
        iconTheme: IconThemeData(
          color: Colors.white, // Back arrow color
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildStatCard("₹45,625", "Total Credits", Colors.green),
              _buildStatCard("₹6,743", "Total Debits", Colors.red),
              _buildStatCard("24", "Transactions", Colors.blue),
              _buildStatCard("₹1,25,430", "Current Balance", Colors.purple),
            ],
          ),
          SizedBox(height: 16),
          Text("Recent Transactions", style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 10),
          ...transactions.map((txn) => ListTile(
            leading: Icon(
              txn["type"] == "credit" ? Icons.arrow_downward : Icons.arrow_upward,
              color: txn["type"] == "credit" ? Colors.green : Colors.red,
            ),
            title: Text(txn["title"]!),
            subtitle: Text(txn["date"]!),
            trailing: Text(txn["amount"]!, style: TextStyle(fontWeight: FontWeight.bold)),
          )),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color color) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          Text(label, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
