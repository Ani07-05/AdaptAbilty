import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc/core/common/loader.dart';
import 'package:gdsc/core/common/sign_in_button.dart';
import 'package:gdsc/core/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gdsc/features/auth/controller/auth_controller.dart';
import 'package:gdsc/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.googlePath,
          height: 40,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center, // Added
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Welcome to Adaptability!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  // Added
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Constants.mascotPath,
                        height: 400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SignInButton(),
              ],
            ),
    );
  }
}
