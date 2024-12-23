# Implementasi data API ke dalam apliksai flutter

- nama : DIMAS JANUAR PRADANA
- kelas: 2A TRPL

## Tangkapan Layar

![localhost_56852 - Google Chrome 23_12_2024 19 40 56](https://github.com/user-attachments/assets/15167314-bf64-433e-8b6f-0265157217c1)

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
