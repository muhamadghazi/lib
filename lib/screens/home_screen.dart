import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/grid_menu_item.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAllBanks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(),

            // KARTU BANK
            _showAllBanks ? _buildAllBanks() : _buildSingleBankAndButton(),

            // TRANSFER & PAYMENTS SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Transfer & Payments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  GridMenuItem(
                    icon: Icons.send,
                    title: 'Transfer',
                    onTap: () {},
                  ),
                  GridMenuItem(
                    icon: Icons.qr_code_scanner,
                    title: 'QRIS',
                    onTap: () {},
                  ),
                  GridMenuItem(
                    icon: Icons.account_balance_wallet,
                    title: 'Top Up',
                    onTap: () {},
                  ),
                  GridMenuItem(
                    icon: Icons.payment,
                    title: 'Bayar Tagihan',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // FINANCIAL SERVICES SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Financial Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  GridMenuItem(
                    icon: Icons.monetization_on,
                    title: 'Investasi',
                    onTap: () {},
                  ),
                  GridMenuItem(
                    icon: Icons.menu_book,
                    title: 'Catatan',
                    onTap: () {},
                  ),
                  GridMenuItem(
                    icon: Icons.history,
                    title: 'History',
                    onTap: () {},
                  ),
                  GridMenuItem(
                    icon: Icons.more_horiz,
                    title: 'Menu Lain',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Recent Transactions (DIPERTAHANKAN SEPERTI SEMULA)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Daftar Transaksi (DIPERTAHANKAN SEPERTI SEMULA)
            const TransactionItem(
              title: 'Pulsa Telkomsel',
              date: '5 Nov 2025',
              amount: 25000,
            ),
            const TransactionItem(
              title: 'Gaji Bulanan',
              date: '1 Nov 2025',
              amount: 5000000,
              isExpense: false,
            ),
            const TransactionItem(
              title: 'Grab Ride',
              date: '4 Nov 2025',
              amount: 23000,
            ),
            const TransactionItem(
              title: 'Listrik PLN',
              date: '3 Nov 2025',
              amount: 185000,
            ),
            const TransactionItem(
              title: 'ShopeePay Top Up',
              date: '2 Nov 2025',
              amount: 150000,
              isExpense: true,
            ),
            const TransactionItem(
              title: 'Bunga Tabungan',
              date: '31 Okt 2025',
              amount: 85000,
              isExpense: false,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Header Section
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                'Muhamad Ghazi Al Ghifari',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[50],
            ),
            child: const Icon(Icons.notifications_outlined, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan satu bank (BCA) dan tombol "Lihat semua bank"
  Widget _buildSingleBankAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtmCard(
          bankName: 'Bank BCA',
          cardNumber: '**** 9012',
          balance: 2500000,
          gradientColors: [Color(0xFF00BFFF), Color(0xFF1E90FF)],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: TextButton(
            onPressed: () {
              setState(() {
                _showAllBanks = true;
              });
            },
            child: const Text(
              'Lihat semua bank',
              style: TextStyle(
                color: Color(0xFF1E90FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget untuk menampilkan semua bank
  Widget _buildAllBanks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtmCard(
          bankName: 'Bank BCA',
          cardNumber: '**** 9012',
          balance: 2500000,
          gradientColors: [Color(0xFF00BFFF), Color(0xFF1E90FF)],
        ),
        const AtmCard(
          bankName: 'Bank Mandiri',
          cardNumber: '**** 5678',
          balance: 4750000,
          gradientColors: [Color(0xFF87CEFA), Color(0xFF4682B4)],
        ),
        const AtmCard(
          bankName: 'Bank BRI',
          cardNumber: '**** 2211',
          balance: 3100000,
          gradientColors: [Color(0xFF40E0D0), Color(0xFF00CED1)],
        ),
        const AtmCard(
          bankName: 'Bank BNI',
          cardNumber: '**** 3344',
          balance: 2900000,
          gradientColors: [Color(0xFFADD8E6), Color(0xFF87CEEB)],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: TextButton(
            onPressed: () {
              setState(() {
                _showAllBanks = false;
              });
            },
            child: const Text(
              'Sembunyikan',
              style: TextStyle(
                color: Color(0xFF1E90FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Bottom Navigation Bar dengan menu: Home, Cards, QRIS, Profile
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', true),
              _buildNavItem(Icons.credit_card, 'Cards', false),
              _buildNavItem(Icons.person_outline, 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.blue : Colors.grey, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
