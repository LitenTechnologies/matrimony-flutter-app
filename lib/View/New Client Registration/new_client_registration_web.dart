import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Forms/info_form_one.dart';
import 'package:bright_weddings/Component/Forms/info_form_two.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/new_registration_controller.dart';

class NewClientRegistrationWeb extends StatelessWidget {
  const NewClientRegistrationWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final NewRegistrationController controller = Get.find<NewRegistrationController>();

    return Scaffold(
      appBar: Header(onBack: () => Get.back()),
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          // Left panel with background image and logo
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF9800), Color(0xFFFFCC80)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 20),
                    Image(
                      image: AssetImage('assets/images/vector_wedding.png'),
                      width: 150,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Bright Weddings',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Capturing Moments,\nCreating Memories',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right panel with form
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Create an account',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              // Navigate to login
                              Get.toNamed('/login');
                            },
                            child: const Text('Log in'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Form switching (InfoFormOne & Two)
                      Obx(() {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) => SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                          child: controller.currentFormIndex.value == 0
                              ? InfoFormOne(onNext: () {
                                  controller.currentFormIndex.value = 1;
                                })
                              : InfoFormTwo(onBack: () {
                                  controller.currentFormIndex.value = 0;
                                }),
                        );
                      }),

                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Submit or switch form
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 233, 117, 40),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                        child: const Text('Create Account'),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.g_mobiledata),
                        label: const Text("Sign up with Google"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.apple),
                        label: const Text("Sign up with Apple"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
