import 'package:flutter/material.dart';
import 'package:tugas3/router/home_page.dart';
import 'package:tugas3/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
  }

  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      _showErrorDialog('Perhatian', 'Username dan password tidak boleh kosong');
      return;
    }

    setState(() => _isLoading = true);

    // Simulasi delay login
    await Future.delayed(const Duration(milliseconds: 800));

    if (_usernameController.text == "atmin" &&
        _passwordController.text == "atmin") {
      await _saveUsername();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } else {
      setState(() => _isLoading = false);
      _showErrorDialog(
        'Login Gagal',
        'Username atau password salah. Coba: admin/admin',
      );
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title, style: AppTheme.headingSmall),
        content: Text(message, style: AppTheme.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                const SizedBox(height: 60),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Selamat Datang',
                  textAlign: TextAlign.center,
                  style: AppTheme.headingLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Masuk dengan akun Anda untuk melanjutkan',
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyMedium,
                ),
                const SizedBox(height: 48),

                // Form Section
                TextField(
                  controller: _usernameController,
                  enabled: !_isLoading,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: AppTheme.surfaceColor,
                  ),
                  style: AppTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  enabled: !_isLoading,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
                      },
                    ),
                    filled: true,
                    fillColor: AppTheme.surfaceColor,
                  ),
                  style: AppTheme.bodyLarge,
                ),
                const SizedBox(height: 24),

                // Login Button
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : Text(
                          'Masuk',
                          style: AppTheme.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),

                const SizedBox(height: 32),

                // Demo Credentials Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.accentColor.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Demo Credentials:',
                        style: AppTheme.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Username: atmin', style: AppTheme.bodySmall),
                      Text('Password: atmin', style: AppTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
