// lib/widgets/atm_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // [cite: 208]

class AtmCard extends StatelessWidget { // [cite: 209]
  final String bankName; // [cite: 210]
  final String cardNumber; // [cite: 211]
  final double balance; // [cite: 212]
  final List<Color> gradientColors; // [cite: 213]
  final String? backgroundImagePath; // Tambahan untuk gambar kustom

  const AtmCard({ // [cite: 214]
    super.key, // [cite: 215]
    required this.bankName, // [cite: 216]
    required this.cardNumber, // [cite: 217]
    required this.balance, // [cite: 218]
    this.gradientColors = const [Color(0xFF00BFFF), Color(0xFF1E90FF)], // [cite: 219]
    this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) { // [cite: 222]
    // format uang dengan titik (contoh: 2.500.000) [cite: 223]
    final formattedBalance = NumberFormat('#,###', 'id_ID').format(balance); // [cite: 224]

    Decoration decoration;
    
    if (backgroundImagePath != null) {
      // Menggunakan gambar kustom
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20), // [cite: 236]
        image: DecorationImage(
          image: AssetImage(backgroundImagePath!), 
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15,
            offset: Offset(3, 8),
          ),
        ],
      );
    } else {
      // Menggunakan gradien warna
      decoration = BoxDecoration( // [cite: 230]
        gradient: LinearGradient( // [cite: 231]
          colors: gradientColors, // [cite: 233]
          begin: Alignment.topLeft, // [cite: 234]
          end: Alignment.bottomRight, // [cite: 235]
        ),
        borderRadius: BorderRadius.circular(20), // [cite: 236]
        boxShadow: [ // [cite: 237]
          BoxShadow( // [cite: 238]
            color: gradientColors.last.withOpacity(0.3), // [cite: 239]
            blurRadius: 10, // [cite: 240]
            offset: const Offset(3, 6), // [cite: 241]
          ),
        ],
      );
    }

    return AnimatedContainer( // [cite: 225]
      duration: const Duration(milliseconds: 600), // [cite: 226]
      curve: Curves.easeInOut, // [cite: 227]
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // [cite: 228]
      padding: const EdgeInsets.all(20), // [cite: 229]
      height: 200, 
      decoration: decoration, // Menerapkan dekorasi yang dipilih
      child: Column( // [cite: 245]
        crossAxisAlignment: CrossAxisAlignment.start, // [cite: 248]
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ // [cite: 249]
          // Baris atas: Logo & Bank Name/Chip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bankName, // [cite: 250]
                  style: const TextStyle( // [cite: 251]
                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)), // [cite: 252]
              const Icon(Icons.credit_card, color: Colors.white70), // [cite: 268]
            ],
          ),
          
          // Bagian tengah: Saldo
          const SizedBox(height: 25), // [cite: 253]
          Text('Rp $formattedBalance', // [cite: 254]
              style: const TextStyle( // [cite: 255]
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)), // [cite: 256]
          
          // Bagian bawah: Nomor Kartu
          const SizedBox(height: 15), // [cite: 257]
          Row( // [cite: 258]
            mainAxisAlignment: MainAxisAlignment.start, // Mengubah menjadi start agar sejajar
            children: [ // [cite: 263]
              Text(cardNumber, // [cite: 265]
                  style: const TextStyle(color: Colors.white70, letterSpacing: 2)), // [cite: 267]
            ],
          ),
        ],
      ),
    );
  }
}