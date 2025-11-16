import 'package:flutter/material.dart';
import 'package:tugas3/router/sidemenu.dart';
import 'package:tugas3/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? namauser;
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username') ?? 'User';
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(title: const Text('Home'), elevation: 0),
      drawer: const Sidemenu(),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: AppTheme.primaryColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Card
                Card(
                  elevation: 0,
                  color: AppTheme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang,',
                          style: AppTheme.bodyMedium.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          namauser ?? 'Loading...',
                          style: AppTheme.headingMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '👋 Senang bertemu dengan Anda kembali!',
                          style: AppTheme.bodyMedium.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Quick Stats Section
                Text('Statistik Cepat', style: AppTheme.headingSmall),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _buildStatCard('📊', 'Total Tasks', '24'),
                    _buildStatCard('✅', 'Completed', '18'),
                    _buildStatCard('⏳', 'In Progress', '5'),
                    _buildStatCard('⭐', 'Points', '1,240'),
                  ],
                ),
                const SizedBox(height: 24),

                // Menu Section
                Text('Menu Utama', style: AppTheme.headingSmall),
                const SizedBox(height: 12),
                _buildMenuOption(
                  Icons.info_outline,
                  'Tentang Aplikasi',
                  'Pelajari lebih lanjut tentang aplikasi ini',
                  () {},
                ),
                _buildMenuOption(
                  Icons.settings_outlined,
                  'Pengaturan',
                  'Sesuaikan preferensi Anda',
                  () {},
                ),
                _buildMenuOption(
                  Icons.help_outline,
                  'Bantuan',
                  'Dapatkan bantuan dan dukungan',
                  () {},
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String emoji, String label, String value) {
    return Card(
      elevation: 0,
      color: AppTheme.surfaceColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(value, style: AppTheme.headingSmall),
            const SizedBox(height: 4),
            Text(label, textAlign: TextAlign.center, style: AppTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 0,
      color: AppTheme.surfaceColor,
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryColor),
        title: Text(title, style: AppTheme.bodyLarge),
        subtitle: Text(subtitle, style: AppTheme.bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class RefreshController {
  void refreshCompleted() {}
}
