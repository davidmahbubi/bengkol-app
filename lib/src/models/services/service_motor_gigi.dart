import 'layanan.dart';
import 'service_motor.dart';

class ServiceMotorGigi extends ServiceMotor {
  ServiceMotorGigi(String? nomorPlat)
      : super([
          'Penyetelan tuas kopling',
          'Pemeriksaan perseneling',
        ], Layanan.SERVICE_MOTOR_GIGI, nomorPlat ?? '');

  @override
  void servisInjeksi(int index) {
    tambahkanLayananKeListOrder(
      this,
      'Servis Injeksi Motor Gigi',
      50000,
      index,
    );
  }

  void servisGigi(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Gigi', 10000, index);
  }

  void servisRantai(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Rantai', 35000, index);
  }
}
