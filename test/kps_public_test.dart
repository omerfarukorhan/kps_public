import 'package:flutter_test/flutter_test.dart';

import 'package:kps_public/kps_public.dart';

void main() async {
  test('TCKimlikNoDogrula', () async {
    KPSPublic kPSPublic = KPSPublic();
    expect(
        await kPSPublic.TCKimlikNoDogrula(
            TCKimlikNo: "",
            Ad: "",
            Soyad: "",
            DogumYili: ""),
        true);
  });
}


