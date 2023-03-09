import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class KPSPublic {
  Future<bool> TCKimlikNoDogrula({
    required String TCKimlikNo,
    required String Ad,
    required String Soyad,
    required String DogumYili,
  }) async {
    try {
      var url = 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx';

      var body = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <TCKimlikNoDogrula xmlns="http://tckimlik.nvi.gov.tr/WS">
      <TCKimlikNo>$TCKimlikNo</TCKimlikNo>
      <Ad>$Ad</Ad>
      <Soyad>$Soyad</Soyad>
      <DogumYili>$DogumYili</DogumYili>
    </TCKimlikNoDogrula>
  </soap12:Body>
</soap12:Envelope>''';

      Map<String, String> headers = {
        'content-type': 'application/soap+xml; charset=utf-8',
        'Host': 'tckimlik.nvi.gov.tr',
      };

      Response response = await Dio().post(
        url,
        data: body,
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      );

      final document = XmlDocument.parse(response.data);
      final TCKimlikNoDogrulaResult =
          document.findAllElements('TCKimlikNoDogrulaResult').first;

      return TCKimlikNoDogrulaResult.innerText == "true";
    } catch (e) {
      return false;
    }
  }
}
