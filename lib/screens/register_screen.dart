import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String selectedRole = "student";

  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  bool isLoading = false;

  Future<void> registerUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      final credential = await _authService.register(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await _userService.createUser(
        uid: credential.user!.uid,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        role: selectedRole,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration Successful"),
          ),
        );

        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Role",
                ),
                items: const [
                  DropdownMenuItem(
                    value: "student",
                    child: Text("Student"),
                  ),
                  DropdownMenuItem(
                    value: "teacher",
                    child: Text("Teacher"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : registerUser,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}