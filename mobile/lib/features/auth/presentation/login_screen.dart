import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../application/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isSubmitting = false;

  Future<void> _run(Future<void> Function() action) async {
    setState(() => _isSubmitting = true);
    try {
      await action();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed: $e')),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.agriculture, size: 72, color: AppColors.primary),
              const SizedBox(height: 16),
              Text('Farmloop', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Sign in to manage your farm',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _isSubmitting ? null : () => _run(controller.loginWithGoogle),
                icon: const Icon(Icons.login),
                label: const Text('Continue with Google'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _isSubmitting ? null : () => _run(controller.loginWithApple),
                icon: const Icon(Icons.apple),
                label: const Text('Continue with Apple'),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              ),
              if (kDebugMode) ...[
                const SizedBox(height: 32),
                const Divider(),
                const SizedBox(height: 12),
                Text(
                  'Debug only — bypasses real sign-in',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: _isSubmitting
                      ? null
                      : () => _run(() => controller.devLogin('owner@farmloop.demo')),
                  child: const Text('Dev Login — Owner (Admin)'),
                ),
                TextButton(
                  onPressed: _isSubmitting
                      ? null
                      : () => _run(() => controller.devLogin('sam@farmloop.demo')),
                  child: const Text('Dev Login — Sam (Farmhand)'),
                ),
              ],
              if (_isSubmitting) ...[
                const SizedBox(height: 24),
                const CircularProgressIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
