import 'dart:io';

// 1. Fungsi Operasi Matematika
int penambahan(int a, int b) => a + b;
int pengurangan(int a, int b) => a - b;
int perkalian(int a, int b) => a * b;
int pembagian(int a, int b) => a ~/ b;

// 2. Fungsi Input Angka (Input tidak boleh < 0)
int inputAngka(String pesan) {
  while (true) {
    try {
      stdout.write(pesan);
      int angka = int.parse(stdin.readLineSync() ?? '');

      if (angka < 0) {
        print('Error: angka tidak boleh di bawah 0.\n');
        continue;
      }

      return angka;
    } on FormatException {
      print('Error: input harus berupa bilangan bulat.\n');
    }
  }
}

void main() {
  bool ulangi = true;

  while (ulangi) {
    print('====KALKULATOR====');

    var angkaPertama = inputAngka('Masukkan angka pertama: ');

    stdout.write('Masukkan kalkulasi yang diinginkan (+, -, *, /): ');
    String? kalkulasi = stdin.readLineSync();

    var angkaKedua = inputAngka('Masukkan angka kedua: ');

    int? hasil;

    // Eksekusi kalkulasi
    if (kalkulasi == '+') {
      hasil = penambahan(angkaPertama, angkaKedua);
    } else if (kalkulasi == '-') {
      hasil = pengurangan(angkaPertama, angkaKedua);
    } else if (kalkulasi == '*') {
      hasil = perkalian(angkaPertama, angkaKedua);
    } else if (kalkulasi == '/') {
      if (angkaKedua == 0) {
        print('Error: Pembagian dengan angka 0 tidak diperbolehkan!');
      } else {
        hasil = pembagian(angkaPertama, angkaKedua);
      }
    } else {
      print('Kalkulasi Tidak Valid');
    }

    // Pengecekan jika hasil perhitungan di bawah 0
    if (hasil != null) {
      if (hasil < 0) {
        print('Error: Hasil perhitungan tidak boleh di bawah 0 (negatif)!');
      } else {
        print('Hasil Perhitungan : $hasil');
      }
    }

    // Opsi perulangan
    stdout.write('\nMau menghitung lagi? (y/n): ');
    String? respon = stdin.readLineSync();
    if (respon?.toLowerCase() != 'y') {
      ulangi = false;
      print('Terima kasih!');
    }
    print('\n');
  }
}
