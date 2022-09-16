import 'package:kps_public/kps_public.dart';

void main(List<String> args) async {
  KPSPublic kPSPublic = KPSPublic();
  await kPSPublic.TCKimlikNoDogrula(
      TCKimlikNo: "", Ad: "", Soyad: "", DogumYili: "");
}
