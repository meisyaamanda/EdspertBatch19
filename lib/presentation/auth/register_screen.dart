
import 'package:flutter/material.dart';
import 'package:immersive_boothcamp/core/utils/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _namaSekolahController = TextEditingController();

  String jenisKelamin = '';
  String? selectedKelas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Yuk isi data diri'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 22, right: 22),
          child: SingleChildScrollView(
            child: FormRegister(),
          ),
        ),
      ),
    );
  }

  Form FormRegister() {
    return Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Ihsanadi08@gmail.com'
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _namaLengkapController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          hintText: 'contoh: Ihsan Adijera'),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Jenis Kelamin',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  jenisKelamin = 'Laki-laki';
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: jenisKelamin == 'Laki-laki'
                                      ? primary.withOpacity(0.7)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xFFD6D6D6)),
                                ),
                                child: Text(
                                  'Laki-laki',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                jenisKelamin = 'Perempuan';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: jenisKelamin == 'Perempuan'
                                    ? Colors.green.withOpacity(0.7)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFD6D6D6),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Perempuan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isRadioSelected(
                                    currentValue: jenisKelamin,
                                    radioValue: 'Laki-laki',
                                  )
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Kelas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'pilih kelas'),
                      value: selectedKelas,
                      items: [
                        DropdownMenuItem(child: Text('Kelas 10'), value: '10'),
                        DropdownMenuItem(child: Text('Kelas 11'), value: '11'),
                        DropdownMenuItem(child: Text('Kelas 12'), value: '12'),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedKelas = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Nama Sekolah',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _namaSekolahController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          hintText: 'nama sekolah'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 64,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'DAFTAR',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )),
                    )
                  ],
                )
              ],
            ),
          );
  }
}

bool isRadioSelected({
  required String currentValue,
  required String radioValue,
}) {
  return currentValue == radioValue;
}
