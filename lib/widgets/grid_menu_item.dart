// lib/widgets/grid_menu_item.dart
import 'package:flutter/material.dart'; // [cite: 270]

class GridMenuItem extends StatelessWidget { // [cite: 271]
  final IconData icon; // [cite: 272]
  final String title; // [cite: 273]
  final VoidCallback onTap; // [cite: 274]

  const GridMenuItem({ // [cite: 275]
    super.key, // [cite: 276]
    required this.icon, // [cite: 277]
    required this.title, // [cite: 278]
    required this.onTap, // [cite: 279]
  });

  @override
  Widget build(BuildContext context) { // [cite: 282]
    return InkWell( // [cite: 283]
      borderRadius: BorderRadius.circular(16), // [cite: 284]
      onTap: onTap, // [cite: 285]
      child: Container( // [cite: 286]
        margin: const EdgeInsets.all(6), // [cite: 287]
        decoration: BoxDecoration( // [cite: 288]
          color: Colors.white, // [cite: 289]
          borderRadius: BorderRadius.circular(16), // [cite: 290]
          boxShadow: [ // [cite: 291]
            BoxShadow( // [cite: 292]
              color: Colors.black12.withOpacity(0.05), // [cite: 293]
              blurRadius: 8, // [cite: 294]
              offset: const Offset(3, 5), // [cite: 295]
            )
          ],
        ),
        child: Column( // [cite: 299]
          mainAxisAlignment: MainAxisAlignment.center, // [cite: 300]
          children: [ // [cite: 301]
            CircleAvatar( // [cite: 302]
              backgroundColor: Theme.of(context).primaryColor, // Warna ikon dari tema utama
              radius: 28, // [cite: 305]
              child: Icon(icon, color: Colors.white, size: 28), // [cite: 306]
            ),
            const SizedBox(height: 8), // [cite: 307]
            Text(title, // [cite: 308]
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)), // [cite: 312]
          ],
        ),
      ),
    );
  }
}