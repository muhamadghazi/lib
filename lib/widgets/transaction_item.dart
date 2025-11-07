import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ⬅️ import intl

class TransactionItem extends StatelessWidget {
  final String title;
  final String date;
  final double amount;
  final bool isExpense;

  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    this.isExpense = true,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 format angka jadi 1.000.000
    final formattedAmount = NumberFormat('#,###', 'id_ID').format(amount);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isExpense ? Colors.redAccent : Colors.green,
          child: Icon(
            isExpense ? Icons.arrow_downward : Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(
          (isExpense ? '-' : '+') + 'Rp $formattedAmount',
          style: TextStyle(
            color: isExpense ? Colors.redAccent : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
