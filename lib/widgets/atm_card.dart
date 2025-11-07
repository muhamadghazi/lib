import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ⬅️ import intl

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final double balance;
  final List<Color> gradientColors;

  const AtmCard({
    super.key,

    required this.bankName,

    required this.cardNumber,

    required this.balance,

    this.gradientColors = const [Color(0xFF00BFFF), Color(0xFF1E90FF)],
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 format uang dengan titik (contoh: 2.500.000)

    final formattedBalance = NumberFormat('#,###', 'id_ID').format(balance);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),

      curve: Curves.easeInOut,

      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,

          begin: Alignment.topLeft,

          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.3),

            blurRadius: 10,

            offset: const Offset(3, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            bankName,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Text(
            'Rp $formattedBalance',

            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                cardNumber,

                style: const TextStyle(color: Colors.white70, letterSpacing: 2),
              ),

              const Icon(Icons.credit_card, color: Colors.white70),
            ],
          ),
        ],
      ),
    );
  }
}
