# Implementasi data API ke dalam apliksai flutter

- nama : DIMAS JANUAR PRADANA
- kelas: 2A TRPL

## Tangkapan Layar

[tangkapan layar]

- Pencarian cuaca berdasarkan nama kota
- Menampilkan suhu saat ini
- Menampilkan deskripsi cuaca
- Menghitung dan menampilkan suhu rata-rata
- Antarmuka pengguna yang bersih dan intuitif
- Desain latar belakang gradien
- Tata letak responsif

## Struktur Proyek

- `main.dart` - Berisi kode aplikasi utama dan implementasi UI
- `api_service.dart` - Menangani panggilan API dan pemrosesan data

## Implementasi Fitur

### Layanan API
- Menggunakan API Geocoding OpenWeatherMap untuk mengkonversi nama kota menjadi koordinat
- Mengambil data cuaca menggunakan koordinat
- Memproses dan mengembalikan informasi cuaca yang telah diformat

### Antarmuka Pengguna
- Implementasi desain Material
- Latar belakang gradien
- Tampilan informasi cuaca berbasis kartu
- Fungsi pencarian dengan input teks
- Tombol refresh untuk memperbarui data cuaca
