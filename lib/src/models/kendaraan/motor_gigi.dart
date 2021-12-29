import './../services/service_motor_gigi.dart';

class MotorGigi extends ServiceMotorGigi {
  final String merk;
  final String platNomor;

  MotorGigi(this.merk, this.platNomor) : super(platNomor);
}
