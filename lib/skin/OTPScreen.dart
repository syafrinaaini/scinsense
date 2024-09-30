import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Untuk icon WhatsApp

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Where the OTP will be sent?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 128, 1),
              ),
            ),
            const SizedBox(height: 30),
            _buildOption(Icons.email_outlined, 'Email'),
            const SizedBox(height: 15),
            _buildOption(Icons.sms_outlined, 'SMS'),
            const SizedBox(height: 15),
            _buildOption(FontAwesomeIcons.whatsapp, 'WhatsApp',
                color: Colors.green),
          ],
        ),
      ),
    );
  }

  // Fungsi reusable untuk membuat tombol opsi
  Widget _buildOption(IconData icon, String label,
      {Color color = Colors.black}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label),
        onTap: () {
          // Implementasi aksi saat tombol ditekan
        },
      ),
    );
  }
}

