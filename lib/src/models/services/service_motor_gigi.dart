import 'layanan.dart';
import 'service_motor.dart';

class ServiceMotorGigi extends ServiceMotor {

  ServiceMotorGigi(String? nomorPlat) : super([
    'Penyetelan tuas kopling',
    'Pemeriksaan perseneling',
  ], Layanan.SERVICE_MOTOR_GIGI, nomorPlat ?? '');

  @override
  void servisInjeksi(int index) {
    print('Servis injeksi untuk motor gigi');
    tambahkanLayananKeListOrder(this, 'Servis Injeksi Motor Gigi', 50000, index);
  }

  void servisGigi(int index) {
    print('Melakukan Servis Gigi ...');
    tambahkanLayananKeListOrder(this, 'Servis Gigi', 10000, index);
  }

  void servisRantai(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Rantai', 35000, index);
    print('Servis Rantai');
  }
} 