import 'package:flutter/material.dart';
import 'package:latihan_pak_ary_bagian_2/components/custom_app_bar.dart';
import 'package:latihan_pak_ary_bagian_2/components/input_container.dart';
import 'package:latihan_pak_ary_bagian_2/components/label_and_value.dart';
import 'package:latihan_pak_ary_bagian_2/pages/latihan_2_4.dart';

class Latihan21 extends StatefulWidget {
  const Latihan21({super.key});

  @override
  State<Latihan21> createState() => _Latihan21State();
}

class _Latihan21State extends State<Latihan21> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();

  Gender? _gender;
  bool _isBekerja = false;
  double _tinggiBadan = 0;
  String? _pilihanPekerjaanOrtu;
  String? _pilihanAsalProvinsi;

  final List<Map<String, dynamic>> _makananFavoritList = [
    {'nama': 'Pizza', 'isSelected': false},
    {'nama': 'Nasgor', 'isSelected': false},
    {'nama': 'Nasi padang', 'isSelected': false},
    {'nama': 'Uduk', 'isSelected': false},
  ].toList();

  final List<DropdownMenuItem<String>> _pekerjaaanOrtuList = const [
    DropdownMenuItem(value: 'Pegawai swasta', child: Text('Pegawai swasta')),
    DropdownMenuItem(value: 'Manager', child: Text('Manager')),
    DropdownMenuItem(value: 'Bos limbah', child: Text('Bos limbah')),
  ];

  final List<String> _provinsiIndonesia = const [
    "Aceh",
    "Sumatera Utara",
    "Sumatera Barat",
    "Riau",
    "Kepulauan Riau",
    "Jambi",
    "Bengkulu",
    "Sumatera Selatan",
    "Kepulauan Bangka Belitung",
    "Lampung",
    "DKI Jakarta",
    "Jawa Barat",
    "Banten",
    "Jawa Tengah",
    "DI Yogyakarta",
    "Jawa Timur",
    "Bali",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Kalimantan Barat",
    "Kalimantan Tengah",
    "Kalimantan Selatan",
    "Kalimantan Timur",
    "Kalimantan Utara",
    "Sulawesi Utara",
    "Sulawesi Barat",
    "Sulawesi Tengah",
    "Sulawesi Selatan",
    "Sulawesi Tenggara",
    "Gorontalo",
    "Maluku",
    "Maluku Utara",
    "Papua Barat",
    "Papua",
    "Papua Tengah",
    "Papua Pegunungan",
    "Papua Selatan"
  ];

  // * Sebenernya bisa pake arrow function atau whatever that is, kayak js
  void handleChangeGender(Gender? value) => setState(() => _gender = value);

  void handleChangeSwitch(bool value) => setState(() => _isBekerja = value);

  void handleChangeSlider(double value) => setState(() => _tinggiBadan = value);

  void handleChangeCheckbox(bool? value, int index) {
    setState(() {
      _makananFavoritList[index]['isSelected'] = value!;
    });
  }

  void handleChangeDropdownMenu(String? value) {
    setState(() {
      _pilihanPekerjaanOrtu = value!;
    });
  }

  void handleChangeDropdownButton(String? value) {
    setState(() {
      _pilihanAsalProvinsi = value!;
    });
  }

  String? texfieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? dropdownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Harus pilih provinsi';
    }
    return null;
  }

  void showResultDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Data mahasiswa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelAndValue(label: 'Nama', value: _namaController.text),
              LabelAndValue(label: 'Gender', value: _gender.toString()),
              LabelAndValue(
                  label: 'Status bekerja',
                  value: _isBekerja ? 'Sudah bekerja' : 'Belum bekerja'),
              LabelAndValue(
                  label: 'Tinggi badan',
                  value: '${_tinggiBadan.toInt().toString()}cm'),
              LabelAndValue(
                  label: 'Makanan favorit',
                  value: _makananFavoritList
                      .where((makanan) => makanan['isSelected'])
                      .map((makanan) => makanan['nama'])
                      .join(", ")),
              LabelAndValue(
                  label: 'Pekerjaan ortu', value: _pilihanPekerjaanOrtu!),
              LabelAndValue(
                  label: 'Asal provinsi', value: _pilihanAsalProvinsi!)
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tutup'))
          ],
        );
      },
    );
  }

  void showConfirmDialog() {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Apakah data sudah benar?'),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Belum'),
                      child: const Text('Belum'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Udah');
                        handleSubmit();
                      },
                      child: const Text('Udah'),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      // * Tampilkan snackbar lalu terus tampilin dialog hasil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil disimpan'),
          duration: Duration(seconds: 2),
        ),
      );

      // * Tunggu snackbar selesai, terus tampilin result dialog
      Future.delayed(const Duration(seconds: 2), () {
        showResultDialog();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Latihan 2.1 sampai 2.3',
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Latihan24())),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      'Ke Tugas 2.4',
                    ),
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: Text(
                      'Latihan input data mahasiswa',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // * Textfield
                  InputContainer(
                    widget: TextFormField(
                      validator: texfieldValidator,
                      controller: _namaController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                    label: 'Nama lengkap',
                  ),

                  // * Radio button
                  InputContainer(
                    widget: Column(
                      children: [
                        _buildRadioButton(Gender.pria, 'Pria'),
                        _buildRadioButton(Gender.wanita, 'Wanita'),
                      ],
                    ),
                    label: 'Pilih gender',
                  ),

                  // * Switch
                  InputContainer(
                    widget: SwitchListTile(
                      value: _isBekerja,
                      onChanged: handleChangeSwitch,
                      title: const Text('Sudah bekerja'),
                      secondary: const Icon(Icons.badge),
                    ),
                    label: 'Status pekerjaan',
                  ),

                  // * Slider
                  InputContainer(
                    widget: Slider(
                      value: _tinggiBadan,
                      onChanged: handleChangeSlider,
                      label: '${_tinggiBadan.toStringAsFixed(0)}cm',
                      min: 0,
                      max: 300,
                      divisions: 300,
                    ),
                    label: 'Tinggi badan (cm)',
                  ),

                  // * Checkbox
                  InputContainer(
                      widget: Column(
                        children:
                            _makananFavoritList.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, dynamic> makananFavorit = entry.value;

                          return CheckboxListTile(
                            title: Text(makananFavorit['nama']),
                            value: makananFavorit['isSelected'],
                            onChanged: (value) =>
                                handleChangeCheckbox(value, index),
                          );
                        }).toList(),
                      ),
                      label: 'Makanan favorit'),

                  // * Dropdown menu
                  // ! di Flutter ngak ada widget yang namanya DropdownMenu
                  InputContainer(
                    widget: DropdownButton<String>(
                      hint: Text(
                        'Pilih pekerjaan ortu',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      value: _pilihanPekerjaanOrtu, // * Nilai yang terpilih
                      items: _pekerjaaanOrtuList,
                      onChanged: handleChangeDropdownMenu,
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                    ),
                    label: 'Pekerjaan orang tua',
                  ),

                  // * Dropdown button
                  InputContainer(
                    widget: DropdownButtonFormField<String>(
                      hint: Text(
                        'Pilih asal provinsi',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      value: _pilihanAsalProvinsi, // * Nilai yang terpilih
                      items: _provinsiIndonesia.map((provinsi) {
                        return DropdownMenuItem<String>(
                          value: provinsi,
                          child: Text(provinsi),
                        );
                      }).toList(),
                      onChanged: handleChangeDropdownButton,
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      validator: dropdownValidator,
                    ),
                    label: 'Asal provinsi',
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: showConfirmDialog,
                      child: const Text('Submit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  // * Buat radio button custom
  Widget _buildRadioButton(Gender gender, String label) {
    return RadioListTile<Gender>(
      value: gender,
      groupValue: _gender,
      onChanged: handleChangeGender,
      title: Text(label),
    );
  }
}

enum Gender { pria, wanita }
