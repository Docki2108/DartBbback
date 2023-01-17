import 'dart:io';
import 'package:bbback/appservice.dart';
import 'package:conduit/conduit.dart';

void main(List<String> arguments) async {
  //порт, на котором будет запущена апишка
  final api_port = int.parse(Platform.environment["PORT"] ?? '8080');

  final service = Application<AppService>()..options.port = 5432;
  await service.start(numberOfInstances: 3, consoleLogging: true);
}
