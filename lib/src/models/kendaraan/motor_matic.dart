import './../services/service_motor_matic.dart';

class MotorMatic extends ServiceMotorMatic {

  final String merk;
  final String platNomor;

  MotorMatic(this.merk, this.platNomor) : super(platNomor);
}