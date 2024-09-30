import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30), // Jarak dari atas
              
              // Teks Header "Create Profile"
              Text(
                'Create Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              
              SizedBox(height: 20), // Jarak antara header dan avatar

              // Avatar dan ikon edit
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: CircleAvatar(
                      radius: 46, // Ukuran lebih kecil untuk memberi efek border
                      backgroundColor: Colors.white, // Warna border putih
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: PopupMenuButton<String>(
                      onSelected: (value) {
                        // Aksi berdasarkan pilihan
                        print(value); // Ganti dengan aksi yang diinginkan
                      },
                      color: Colors.white, // Background putih pada PopupMenuButton
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'Take a Photo',
                            child: Text('Take a Photo'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Choose from Gallery',
                            child: Text('Choose from Gallery'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Choose from Google Drive',
                            child: Text('Choose from Google Drive'),
                          ),
                        ];
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30), // Jarak antara avatar dan form

              // Form Input Fields
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16), // Jarak antar input field
              
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16), // Jarak antar input field
              
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              
              SizedBox(height: 16), // Jarak antar input field
              
              // Input Tanggal Lahir
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'YYYY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'MM',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'DD',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30), // Jarak antara input dan tombol

              // Tombol "Next"
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Warna tombol biru
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
