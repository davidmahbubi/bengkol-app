import './../services/layanan.dart';

class Order {

  late DateTime tanggal;
  int index;
  Layanan layanan;
  String namaLayanan;
  int harga;
  String status;
  String jenisKendaraan;
  String nomorPlat;

  Order(this.layanan, this.namaLayanan, this.harga, this.index, { this.status = 'Pending', this.jenisKendaraan = '', this.nomorPlat = '' }) {
    tanggal = DateTime.now();
  }

}