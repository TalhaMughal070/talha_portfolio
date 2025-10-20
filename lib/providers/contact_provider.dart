import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talha_portfolio/utils/custom_snackbar.dart';

class ContactProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(BuildContext context) async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String message = messageController.text.trim();

    if (name.isEmpty) {
      showSnackbar(true, 'Please enter your name', context);
      return;
    }
    if (email.isEmpty) {
      showSnackbar(true, 'Please enter your email', context);
      return;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      showSnackbar(true, 'Please enter a valid email address', context);
      return;
    }
    if (message.isEmpty) {
      showSnackbar(true, 'Please enter your message', context);
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      await _firestore.collection('contactMessages').add({
        'name': name,
        'email': email,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });

      showSnackbar(false, 'Message sent successfully!', context);

      nameController.clear();
      emailController.clear();
      messageController.clear();
    } catch (e) {
      showSnackbar(true, 'Failed to send message. Try again.', context);
      debugPrint("Error sending message: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
