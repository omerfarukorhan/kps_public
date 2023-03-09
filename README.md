KPS Public Web Service Dart Library

## Sample Dart Usage

```dart
  KPSPublic kPSPublic = KPSPublic();

  // SOAP 1.2
  bool result = await kPSPublic.TCKimlikNoDogrula(
      TCKimlikNo: "TCKimlikNo", Ad: "Ad", Soyad: "Soyad", DogumYili: "DogumYili");
```

## Sample Flutter Usage

```dart
import 'package:flutter/material.dart';
import 'package:kps_public/kps_public.dart';

void main() {
  runApp(const KPSPublicSampleUsage());
}

class KPSPublicSampleUsage extends StatelessWidget {
  const KPSPublicSampleUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SampleForm(),
    );
  }
}

class SampleForm extends StatefulWidget {
  const SampleForm({super.key});

  @override
  State<SampleForm> createState() => _SampleFormState();
}

class _SampleFormState extends State<SampleForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  KPSPublic kpsPublic = KPSPublic();

  TextEditingController tcKimlikNoController = TextEditingController(),
      adController = TextEditingController(),
      soyadController = TextEditingController(),
      dogumYiliController = TextEditingController();

  bool? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KPS Public Sample Usage"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                textField("T.C. Kimlik No", tcKimlikNoController),
                textField("Ad", adController),
                textField("Soyad", soyadController),
                textField("Doğum Yılı", dogumYiliController),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        result = await kpsPublic.TCKimlikNoDogrula(
                          TCKimlikNo: tcKimlikNoController.text,
                          Ad: adController.text,
                          Soyad: soyadController.text,
                          DogumYili: dogumYiliController.text,
                        );
                        setState(() {});
                      }
                    },
                    child: const Text("Sorgula"),
                  ),
                ),
                result != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: result! ? Colors.green[100] : Colors.red[100],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              result! ? "Doğrulandı." : "Bilgiler hatalı.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: result! ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value!.isEmpty ? "Boş bırakılamaz." : null,
      ),
    );
  }
}
```

