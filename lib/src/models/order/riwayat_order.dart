import './order.dart';

class RiwayatOrder {
  static List<Order> riwayatOrder = [];

  static void addRiwayatOrder(Order order) {
    riwayatOrder.add(order);
  }

  static void printRiwayatOrder() {
    print("==== RIWAYAT ORDER ====");
    riwayatOrder.forEach((element) {
      print('[${element.layanan.tipeLayanan}] ${element.tanggal.toLocal()} - ${element.namaLayanan}');
    });
  }

  static int getLatestIndex() {
    return riwayatOrder.length;
  }
}