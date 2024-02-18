import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utility/image_assets.dart';
import 'package:get/get.dart';

import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                    child: SvgPicture.asset(
                      ImageAssets.craftyBayLogoSVG,
                      width: 100,
                    )),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome Back!',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailTEController,
                  validator: (String? text) {
                    if (text!.isEmpty) {
                      return 'Enter Your email address';
                    } else if (!text!.isEmail) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: GetBuilder<EmailVerificationController>(
                        builder: (controller) {
                          if (controller.emailVerificationInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  verifyEmail(controller);
                                }
                              },
                              child: const Text('Next'));
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
    await controller.verifyEmail(_emailTEController.text.trim());
    if (response) {
      Get.to(() => const OTPVerificationScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email verification failed! Try Again')));
      }
    }
  }
}
