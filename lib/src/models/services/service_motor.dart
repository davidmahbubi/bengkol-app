import 'layanan.dart';

abstract class ServiceMotor extends Layanan {

  ServiceMotor(List<String> sop, String tipeLayanan, String nomorPlat) : super([
    'Pemeriksaan suspensi depan dan belakang',
    'Pemeriksaan fungsi kelistrikan',
    'Pemeriksaan gerak bebas kemudi'
  ], tipeLayanan, nomorPlat) {
    sop += sop;
  }

  void servisSpeedometer(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Speedometer', 75000, index);
    print('Servis Spidometer Motor');
  }

  void servisStangGas(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Stang Gas', 100000, index);
    print('Servis Stang gas');
  }

  void servisInjeksi(int index);
}