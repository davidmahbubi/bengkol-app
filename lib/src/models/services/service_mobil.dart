import 'package:bengkol_app/src/models/services/layanan.dart';
import 'package:bengkol_app/src/models/services/service_motor_gigi.dart';

<<<<<<< HEAD
 abstract class ServiceMobil extends Layanan {
=======
abstract class ServiceMobil extends Layanan {
>>>>>>> 4b1cc64010fdc46f5eee07718ca5a0f7c7eead67
  ServiceMobil(List<String> sop, String tipeLayanan, String nomorPlat)
      : super([
          'Pemeriksaan suspensi depan dan belakang',
          'Pemeriksaan fungsi kelistrikan',
          'Pemeriksaan gerak bebas kemudi'
        ], tipeLayanan, nomorPlat) {
    sop += sop;
  }

<<<<<<< HEAD
    void serviceKampasKopling();
  }

=======
  void servisKampasKopling(int index);
}
>>>>>>> 4b1cc64010fdc46f5eee07718ca5a0f7c7eead67
