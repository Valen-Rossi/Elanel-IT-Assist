import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elanel_asistencia_it/domain/datasources/devices_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/device.dart';
import 'package:elanel_asistencia_it/infrastructure/mappers/device_mapper.dart';
import 'package:elanel_asistencia_it/infrastructure/models/firebase/device_firebase.dart';


class DevicesFbDatasource extends IDevicesDatasource {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<Device>> getDevices() async {
    final query = await db.collection('device').get();

    // print('Documentos encontrados: ${query.docs.length}');

    final devices = query.docs.map((doc) {
      final deviceFb = DeviceFromFirebase.fromJson(doc.id, doc.data());
      return DeviceMapper.deviceFirebaseToEntity(deviceFb);
    }).toList();

    return devices;
  }

  
  @override
  Future<void> addDevice(Device device) async {
    final docRef = db.collection('device').doc(); // genera un nuevo id
    final newDevice = device.copyWith(id: docRef.id); // copiás el device con ese id
    final deviceFb = DeviceMapper.deviceEntityToFirebase(newDevice);

    await docRef.set(deviceFb.toJson());
  }


  
  @override
  Future<void> deleteDevice(String id) async {
    await db.collection('device').doc(id).delete();
  }
  
  @override
  Future<void> updateDevice(Device device) async {
    final deviceFb = DeviceMapper.deviceEntityToFirebase(device);

    await db.collection('device').doc(device.id).update(deviceFb.toJson());
  }

  
}