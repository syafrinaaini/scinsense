import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Email Verify",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 22, // Ukuran font sedikit dikurangi
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Jarak lebih kecil
            Text(
              "Check the email, you'll get the code. Submit it",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14, // Ukuran font lebih kecil
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Mengurangi jarak antar elemen
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldHeight: 45, // Sesuaikan tinggi field
                fieldWidth: 35,  // Sesuaikan lebar field
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              controller: _otpController,
              onCompleted: (v) {
                print("Completed: $v");
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            const SizedBox(height: 30), // Mengurangi jarak antar elemen
            SizedBox(
              width: double.infinity,
              height: 45, // Tinggi button sedikit dikurangi
              child: ElevatedButton(
                onPressed: () {
                  print("OTP: ${_otpController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Radius lebih kecil
                  ),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Ukuran font button lebih kecil
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
