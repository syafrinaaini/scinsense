import 'package:flutter/material.dart';

class ChooseGenderScreen extends StatefulWidget {
  @override
  _ChooseGenderScreenState createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  String? selectedGender;

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Jarak dari atas
            // Teks Header
            Text(
              'Hello, User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20), // Jarak antara header dan pertanyaan
            // Teks Pertanyaan
            Text(
              'What is your gender?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30), // Jarak antara pertanyaan dan opsi gender
            // Opsi Gender
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pilihan Male
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: selectedGender == 'Male'
                            ? Colors.blue[900]
                            : Colors.grey[300],
                        child: Icon(
                          Icons.male,
                          size: 50,
                          color: selectedGender == 'Male'
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedGender == 'Male'
                              ? Colors.blue[900]
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40), // Jarak antara opsi Male dan Female
                // Pilihan Female
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: selectedGender == 'Female'
                            ? Colors.pink
                            : Colors.grey[300],
                        child: Icon(
                          Icons.female,
                          size: 50,
                          color: selectedGender == 'Female'
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedGender == 'Female'
                              ? Colors.pink
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(), // Mendorong tombol ke bagian bawah
            // Tombol Next
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: selectedGender != null
                    ? () {
                        // Aksi ketika gender telah dipilih
                        print('Selected Gender: $selectedGender');
                      }
                    : null, // Disable tombol jika belum ada gender yang dipilih
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGender != null
                      ? Colors.blue[900]
                      : Colors.grey, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Warna teks putih agar lebih terang
                  ),
                ),
              ),
            ),
            SizedBox(height: 40), // Jarak dari tombol ke bagian bawah
          ],
        ),
      ),
    );
  }
}
