import 'package:flutter/material.dart';

class TryAgain extends StatefulWidget {
  @override
  _TryAgainState createState() => _TryAgainState();
}

class _TryAgainState extends State<TryAgain> with SingleTickerProviderStateMixin {
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
          width: 300, // Ukuran lebar kotak
          height: 200, // Ukuran tinggi kotak
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // posisi bayangan
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
                    shape: BoxShape.circle, // Membuat bentuk lingkaran
                    border: Border.all(
                      color: Colors.red, // Warna pinggir lingkaran merah
                      width: 3, // Ketebalan border lingkaran
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close, // Tanda silang
                      color: Colors.red, // Warna tanda silang
                      size: 40, // Ukuran tanda silang
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara ikon dan tombol
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Membuat tombol melengkung
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Try Again',
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
