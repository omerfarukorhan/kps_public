import 'package:flutter_test/flutter_test.dart';

import 'package:kps_public/kps_public.dart';

void main() {
  test('TCKimlikNoDogrula', () async {
    KPSPublic kPSPublic = KPSPublic();
    expect(
        await kPSPublic.TCKimlikNoDogrulaSOAP1_1(
            TCKimlikNo: "",
            Ad: "",
            Soyad: "",
            DogumYili: ""),
        true);
    expect(
        await kPSPublic.TCKimlikNoDogrulaSOAP1_2(
            TCKimlikNo: "",
            Ad: "",
            Soyad: "",
            DogumYili: ""),
        true);
  });
}


