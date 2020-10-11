import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';
import 'package:verdi_jugend_streikerfassung/services/localStorageService.dart';

class SendMessageProxy {
  bool _saveToFile = true;

  Future<bool> sendData() async {
    if (_saveToFile) {
      writeData();
    }

    var clientInputs = UserModelProvider().getCurrentUser();
    String clientInputsJson = clientInputs.toJson();
    // Server needs a List of JSON
    if (!(clientInputsJson.startsWith("[") && clientInputsJson.endsWith("]"))) clientInputsJson = "[$clientInputsJson]";

    SharedPreferences settings = await SharedPreferences.getInstance();
    var host = settings.getString("ws.host");
    var port = settings.getInt("ws.port");
    var path = settings.getString("ws.path");

    var context = SecurityContext.defaultContext;
    ByteData certBytes = await rootBundle.load(settings.getString("client.cert.path"));
    context.useCertificateChainBytes(certBytes.buffer.asUint8List());
    ByteData privKeyBytes = await rootBundle.load(settings.getString("client.privatekey.path"));
    context.usePrivateKeyBytes(privKeyBytes.buffer.asUint8List(), password: settings.getString("client.privatekey.password"));

    var url = Uri.parse("$host:$port$path");
    HttpClient client = HttpClient(context: context)..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    var request = await client.postUrl(url)
      ..headers.contentType = ContentType.json
      ..write(clientInputsJson);
    print("[DEBUG] => $clientInputsJson");
    HttpClientResponse response = await request.close();
    await utf8.decoder.bind(response).forEach(print);

    return response.statusCode == HttpStatus.ok;
  }

  void writeData() async {
    var model = UserModelProvider().getCurrentUser();
    var date = DateTime.now();
    var filePath = "/";
    filePath += model.prename != null ? model.prename + "." + model.name : model.membershipNumber;
    filePath += "_${date.hour}:${date.minute}:${date.second}.txt";
    var stringToWrite = model.toJson();
    var instance = await LocalStorageService.getInstance();
    instance.writeToFile(filePath: filePath, stringToWrite: stringToWrite);
  }
}
