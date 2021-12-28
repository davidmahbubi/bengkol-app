import '../order/order.dart';
import '../order/riwayat_order.dart';

abstract class Layanan {

  static const String
    SERVICE_MOTOR_MATIC = 'Servis Motor Matic',
    SERVICE_MOTOR_GIGI = 'Servis Motor Gigi',
    SERVICE_MOBIL_MATIC = 'Servis Mobil Matic',
    SERVICE_MOBIL_GIGI = 'Servis Mobil Gigi';

  final List<String> sop;
  String tipeLayanan;
  String nomorPlat = '';

  Layanan(this.sop, this.tipeLayanan, this.nomorPlat);

  void kompaBan(int index) {
    tambahkanLayananKeListOrder(this, 'Kompa Ban', 2000, index);
    print('Memompa ban');
  }

  void tambalBan(int index) {
    tambahkanLayananKeListOrder(this, 'Tambal Ban', 50000, index);
    print('Menambal ban');
  }

  void gantiOli(int index) {
    tambahkanLayananKeListOrder(this, 'Ganti Oli', 45000, index);
    print('Mengganti oli');
  }

  void isiBahanBakar(int index) {
    tambahkanLayananKeListOrder(this, 'Isi Bahan Bakar', 10000, index);
    print('Mengisi Bahan Bakar');
  } 

  void servisMesinRingan(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Mesin Ringan', 150000, index);
    print('Menyervis Ringan');
  }

  void servisMesinBerat(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Mesin Berat', 300000, index);
    print('Menyervis Berat');
  }

  void tambahkanLayananKeListOrder(Layanan context, String namaLayanan, int harga, int index) {
    Order orderServisGigi = Order(context, namaLayanan, harga, index, nomorPlat: nomorPlat);
    RiwayatOrder.addRiwayatOrder(orderServisGigi);
  }
}