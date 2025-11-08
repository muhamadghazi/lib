// lib/widgets/transaction_item.dart
import 'package:flutter/material.dart'; // [cite: 316]
import 'package:intl/intl.dart'; // [cite: 317]

class TransactionItem extends StatelessWidget { // [cite: 318]
  final String title; // [cite: 319]
  final String date; // [cite: 320]
  final double amount; // [cite: 321]
  final bool isExpense; // [cite: 322]

  const TransactionItem({ // [cite: 323]
    super.key, // [cite: 324]
    required this.title, // [cite: 325]
    required this.date, // [cite: 326]
    required this.amount, // [cite: 327]
    this.isExpense = true, // [cite: 328]
  });

  @override
  Widget build(BuildContext context) { // [cite: 331]
    // format angka jadi 1.000.000 [cite: 332]
    final formattedAmount = NumberFormat('#,###', 'id_ID').format(amount); // [cite: 333]
    
    return Card( // [cite: 334]
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // [cite: 335]
      elevation: 2, // [cite: 336]
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // [cite: 337]
      child: ListTile( // [cite: 337]
        leading: CircleAvatar( // [cite: 338]
          backgroundColor: isExpense ? Colors.redAccent : Colors.green, // [cite: 339]
          child: Icon( // [cite: 340]
            isExpense ? Icons.arrow_downward : Icons.arrow_upward, // [cite: 341]
            color: Colors.white, // [cite: 342]
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)), // [cite: 345]
        subtitle: Text(date), // [cite: 346]
        trailing: Text( // [cite: 347]
          (isExpense ? '-' : '+') + 'Rp $formattedAmount', // [cite: 349]
          style: TextStyle( // [cite: 350]
            color: isExpense ? Colors.redAccent : Colors.green, // [cite: 352]
            fontWeight: FontWeight.bold, // [cite: 353]
          ),
        ),
      ),
    );
  }
}