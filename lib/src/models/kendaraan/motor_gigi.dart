import './../services/service_motor_gigi.dart';

class MotorGigi extends ServiceMotorGigi {

  String merk;
  String platNomor;

  MotorGigi(this.merk, this.platNomor): super(platNomor);
}