import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class KPSPublic {
  Future<bool> TCKimlikNoDogrulaSOAP1_1({
    required String TCKimlikNo,
    required String Ad,
    required String Soyad,
    required String DogumYili,
  }) async {
    var requestBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <TCKimlikNoDogrula xmlns="http://tckimlik.nvi.gov.tr/WS">
      <TCKimlikNo>$TCKimlikNo</TCKimlikNo>
      <Ad>$Ad</Ad>
      <Soyad>$Soyad</Soyad>
      <DogumYili>$DogumYili</DogumYili>
    </TCKimlikNoDogrula>
  </soap:Body>
</soap:Envelope>''';

    http.Response response = await http.post(
      Uri.parse('https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx'),
      headers: {
        'content-type': 'text/xml; charset=utf-8',
        'SOAPAction': 'http://tckimlik.nvi.gov.tr/WS/TCKimlikNoDogrula',
        'Host': 'tckimlik.nvi.gov.tr',
      },
      body: utf8.encode(requestBody),
    );

    final document = XmlDocument.parse(response.body);
    final TCKimlikNoDogrulaResult =
        document.findAllElements('TCKimlikNoDogrulaResult');
    String result = TCKimlikNoDogrulaResult.isEmpty
        ? ""
        : TCKimlikNoDogrulaResult.map((XmlElement node) => node.text).first;

    return result.toLowerCase() == "true";
  }

  Future<bool> TCKimlikNoDogrulaSOAP1_2({
    required String TCKimlikNo,
    required String Ad,
    required String Soyad,
    required String DogumYili,
  }) async {
    var requestBody = '''<?xml version="1.0" encoding="utf-8"?>
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

    http.Response response = await http.post(
      Uri.parse('https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx'),
      headers: {
        'content-type': 'application/soap+xml; charset=utf-8',
        'Host': 'tckimlik.nvi.gov.tr',
      },
      body: utf8.encode(requestBody),
    );

    final document = XmlDocument.parse(response.body);
    final TCKimlikNoDogrulaResult =
        document.findAllElements('TCKimlikNoDogrulaResult');
    String result = TCKimlikNoDogrulaResult.isEmpty
        ? ""
        : TCKimlikNoDogrulaResult.map((XmlElement node) => node.text).first;

    return result.toLowerCase() == "true";
  }
}
