import 'package:bengkol_app/src/models/services/service_mobil_gigi.dart';
import 'package:bengkol_app/src/models/services/service_mobil_matic.dart';

class MobilMatic extends ServiceMobilMatic {
  final String merk;
  final String platNomor;

  MobilMatic(this.merk, this.platNomor) : super(platNomor);
}
