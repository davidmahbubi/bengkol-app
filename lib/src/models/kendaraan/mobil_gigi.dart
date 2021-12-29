import 'package:bengkol_app/src/models/services/service_mobil_gigi.dart';

import './../services/service_motor_gigi.dart';

class MobilGigi extends ServiceMobilGigi {
  final String merk;
  final String platNomor;

  MobilGigi(this.merk, this.platNomor) : super(platNomor);
}
