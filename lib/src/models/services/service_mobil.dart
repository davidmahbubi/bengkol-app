import 'package:bengkol_app/src/models/services/layanan.dart';
import 'package:bengkol_app/src/models/services/service_motor_gigi.dart';

<<<<<<< HEAD
 abstract class ServiceMobil extends Layanan {
=======
abstract class ServiceMobil extends Layanan {
>>>>>>> 02137c050496e988f3b80acb365c034b4881fbea
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
  void serviceKampasKopling();
}
>>>>>>> 02137c050496e988f3b80acb365c034b4881fbea
