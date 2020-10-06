import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdi_jugend_streikerfassung/util/sigleton.dart';

class SendMessageProxy {
  bool _saveToFile = true;
  Future<String> sendData() async {
    if (_saveToFile) {
      writeData();
    }

    SingletonModel clientInputs = SingletonModel();
    String clientInputsJson = clientInputs.toJson();
    SharedPreferences settings = await SharedPreferences.getInstance();
    var host = settings.getString("ws.host");
    var port = settings.getInt("ws.port");
    var path = settings.getString("ws.path");

    var context = SecurityContext.defaultContext;
    context.useCertificateChain(settings.getString("client.cert.path"));

    context.usePrivateKey(settings.getString("client.privatekey.path"),
        password: settings.getString("client.privatekey.password"));

    HttpClientRequest request = await HttpClient().post(host, port, path)
      ..headers.contentType = ContentType.json
      ..write(clientInputsJson);
    HttpClientResponse response = await request.close();
    await utf8.decoder.bind(response).forEach(print);
    return await utf8.decoder.bind(response).join("\n");
  }

  void writeData() async {
    Directory appdoc = await getApplicationDocumentsDirectory();
    SingletonModel model = SingletonModel();
    File localFile = File(appdoc.path + "/${model.getData()["forename"]}.${model.getData()["surname"]}.txt");
    localFile.writeAsString(model.toJson(), mode: FileMode.append);
    print(localFile.absolute);
  }
}
