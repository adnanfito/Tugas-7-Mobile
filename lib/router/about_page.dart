import 'package:flutter/material.dart';
import 'package:tugas3/router/sidemenu.dart';
import 'package:tugas3/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(title: const Text('Tentang Aplikasi'), elevation: 0),
      drawer: const Sidemenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Info Card
              Card(
                elevation: 0,
                color: AppTheme.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.apps,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Flutter App',
                        textAlign: TextAlign.center,
                        style: AppTheme.headingMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'v1.0.0',
                        textAlign: TextAlign.center,
                        style: AppTheme.bodyMedium.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Fitur Section
              Text('Fitur Utama', style: AppTheme.headingSmall),
              const SizedBox(height: 12),
              _buildFeatureItem(
                '🔐',
                'Autentikasi Aman',
                'Login dengan username dan password yang terenkripsi',
              ),
              _buildFeatureItem(
                '💾',
                'Penyimpanan Lokal',
                'Data tersimpan aman di perangkat Anda',
              ),
              _buildFeatureItem(
                '🎨',
                'Interface Minimalis',
                'Desain modern dan mudah digunakan',
              ),
              _buildFeatureItem(
                '⚡',
                'Performa Cepat',
                'Aplikasi yang responsif dan efisien',
              ),
              const SizedBox(height: 24),

              // Developer Info
              Text('Informasi Developer', style: AppTheme.headingSmall),
              const SizedBox(height: 12),
              Card(
                elevation: 0,
                color: AppTheme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Dikembangkan oleh:', 'Adnan Fito'),
                      const SizedBox(height: 12),
                      _buildInfoRow('Platform:', 'Flutter'),
                      const SizedBox(height: 12),
                      _buildInfoRow('Versi:', '1.0.0'),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        'Tahun Rilis:',
                        DateTime.now().year.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // About Text
              Card(
                elevation: 0,
                color: AppTheme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tentang Aplikasi', style: AppTheme.headingSmall),
                      const SizedBox(height: 12),
                      Text(
                        'Aplikasi ini dibangun sebagai demonstrasi penggunaan Flutter untuk membuat aplikasi mobile yang modern, minimalis, dan user-friendly. Aplikasi ini menampilkan best practices dalam UI/UX design dan state management.',
                        style: AppTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String emoji, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 0,
        color: AppTheme.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTheme.bodyLarge),
                    const SizedBox(height: 4),
                    Text(description, style: AppTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTheme.bodyMedium),
        Text(
          value,
          style: AppTheme.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryColor,
          ),
        ),
      ],
    );
  }
}
