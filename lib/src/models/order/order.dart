import './../services/layanan.dart';

class Order {
  late DateTime tanggal;
  late int _harga;
  int index;
  Layanan layanan;
  String namaLayanan;
  String status;
  String jenisKendaraan;
  String nomorPlat;

  Order(this.layanan, this.namaLayanan, int hargaLayanan, this.index,
      {this.status = 'Pending',
      this.jenisKendaraan = '',
      this.nomorPlat = ''}) {
    tanggal = DateTime.now();
    harga = hargaLayanan;
  }

  set harga(int harga) {
    if (harga < 0) throw Exception('Harga tidak boleh kurang dari 0 !');
    _harga = harga;
  }

  int get harga => _harga;
}
