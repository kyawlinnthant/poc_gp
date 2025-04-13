import '../../../../../data/network/resource/network_resource.dart';

abstract class PinRepository {
  Future<NetworkResource<bool>> createPin({required String pin});
}
