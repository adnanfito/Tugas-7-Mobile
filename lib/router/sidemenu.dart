import 'package:flutter/material.dart';
import 'package:tugas3/router/home_page.dart';
import 'package:tugas3/router/about_page.dart';
import 'package:tugas3/router/login_page.dart';
import 'package:tugas3/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
    });
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.surfaceColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          UserAccountsDrawerHeader(
            accountName: Text(
              username ?? 'User',
              style: AppTheme.headingSmall.copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              'user@example.com',
              style: AppTheme.bodySmall.copyWith(color: Colors.white70),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppTheme.accentColor,
              child: Text(
                (username?.isNotEmpty ?? false)
                    ? username![0].toUpperCase()
                    : 'U',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Menu Items
          _buildDrawerItem(
            icon: Icons.home_outlined,
            title: 'Beranda',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.info_outlined,
            title: 'Tentang',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.settings_outlined,
            title: 'Pengaturan',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: const Divider(),
          ),
          _buildDrawerItem(
            icon: Icons.help_outline,
            title: 'Bantuan',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Keluar',
            textColor: AppTheme.errorColor,
            onTap: () {
              Navigator.pop(context);
              _showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = AppTheme.textPrimary,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: textColor),
        title: Text(
          title,
          style: AppTheme.bodyLarge.copyWith(color: textColor),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        hoverColor: AppTheme.backgroundColor,
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('Keluar', style: AppTheme.headingSmall),
        content: Text(
          'Apakah Anda yakin ingin keluar dari aplikasi?',
          style: AppTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }
}
