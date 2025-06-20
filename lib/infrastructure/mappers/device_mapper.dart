import 'package:elanel_asistencia_it/domain/entities/device.dart';
import 'package:elanel_asistencia_it/infrastructure/models/firebase/device_firebase.dart';

class DeviceMapper {
  static Device deviceFirebaseToEntity(DeviceFromFirebase deviceFb) {
    return Device(
      id: deviceFb.id,
      name: deviceFb.name,
      type: DeviceTypeX.fromString(deviceFb.type),
      ticketCount: deviceFb.ticketCount,
      lastMaintenance: deviceFb.lastMaintenance,
    );
  }
  static DeviceFromFirebase deviceEntityToFirebase(Device device) {
    return DeviceFromFirebase(
      id: device.id,
      name: device.name,
      type: device.type.name,
      ticketCount: device.ticketCount,
      lastMaintenance: device.lastMaintenance,
    );
  }
}
