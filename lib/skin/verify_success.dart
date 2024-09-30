import 'package:flutter/material.dart';

class VerifySuccess extends StatefulWidget {
  @override
  _VerifySuccessState createState() => _VerifySuccessState();
}

class _VerifySuccessState extends State<VerifySuccess> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Durasi animasi
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Kurva animasi untuk efek yang smooth
    );

    // Memulai animasi saat widget diinisialisasi
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Hentikan animasi ketika widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: 300, // Lebar kotak
          height: 200, // Tinggi kotak
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue[900]!, // Warna border biru
              width: 2, // Ketebalan border
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Posisi bayangan
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation, // Animasi pembesaran
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Membuat lingkaran
                    border: Border.all(
                      color: Colors.green, // Warna pinggir lingkaran hijau
                      width: 3, // Ketebalan border lingkaran
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check, // Tanda centang
                      color: Colors.green, // Warna tanda centang hijau
                      size: 40, // Ukuran tanda centang
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Memberi jarak antara ikon dan tombol
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Membuat tombol melengkung
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
