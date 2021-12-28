import './layanan.dart';
import 'service_motor.dart';

class ServiceMotorMatic extends ServiceMotor {

  ServiceMotorMatic(String? nomorPlat) : super([
    'Pengecekan V-Belt',
    'Pembersihan saringan CVT',
  ], Layanan.SERVICE_MOBIL_MATIC, nomorPlat ?? '');

  @override
  void servisInjeksi(int index) {
    tambahkanLayananKeListOrder(this, 'Servis Injeksi Motor matic', 75000, index);
    print('Servis Injeksi Utk Motor Matic');    
  }

  void servisCvt(int index) {
    tambahkanLayananKeListOrder(this, 'Servis CVT', 120000, index);
    print('Servis CVT');
  }

  void servisVbelt(int index) {
    tambahkanLayananKeListOrder(this, 'Servis V-BELT', 25000, index);
    print('Servis VBelt');
  }
} 