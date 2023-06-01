import 'package:capstone_project_tripease/features_pesanan/view/widgets/kereta_api/filter_kereta_api.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';
import '../../view_model/provider/data_provider.dart';
import '../widgets/hotel/filter_hotel.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({super.key});

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  int selectRadio = 0;

  bool isButton1Click = true;

  late String _selectedTrain;

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;
  bool checkbox6 = false;
  bool checkbox7 = false;
  bool checkbox8 = false;

  List<String> _trainList = [
    'Kereta Api A',
    'Kereta Api B',
    'Kereta Api C',
    'Kereta Api D',
  ];

  void showBottomSheetFilterHotel(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 464.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: mainBlue,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Filter',
                          style: myTextTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Hotel',
                        style: myTextTheme.labelSmall,
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Masukan nama hotel yang anda cari',
                          hintStyle: myTextTheme.headlineSmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Lokasi Hotel',
                        style: myTextTheme.labelSmall,
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Masukan lokasi hotel yag anda cari',
                          hintStyle: myTextTheme.headlineSmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Tanggal Pesanan Hotel',
                        style: myTextTheme.labelSmall,
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Pilih tanggal hotel yang anda pesan',
                          hintStyle: myTextTheme.headlineSmall,
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            size: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Terapkan',
                    style: myTextTheme.headlineMedium,
                  ),
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      mainBlue,
                    ),
                    fixedSize: MaterialStatePropertyAll(
                      Size(252.w, 40.h),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showBottomSheetUrutkanHotel(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 320.h,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: mainBlue,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Urutkan',
                        style: myTextTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildRadioButton(1, 'Rekoemendasi'),
                        ),
                        Expanded(
                          child: buildRadioButton(2, 'Kelas Hotel'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildRadioButton(3, 'Harga Terendah'),
                        ),
                        Expanded(
                          child: buildRadioButton(4, 'Harga Tertinggi'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      child: Text(
                        'Terapkan',
                        style: myTextTheme.headlineMedium,
                      ),
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          mainBlue,
                        ),
                        fixedSize: MaterialStatePropertyAll(
                          Size(252.w, 40.h),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildRadioButton(int value, String title) {
    return RadioListTile(
      title: Text(
        title,
        style: myTextTheme.displayMedium,
      ),
      value: value,
      groupValue: selectRadio,
      onChanged: (value) {
        setState(() {
          selectRadio = value!;
        });
      },
    );
  }

  void showBottomSheetUrutkanKA(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 320.h,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: mainBlue,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Urutkan',
                        style: myTextTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildRadioButton(1, 'Harga Terendah'),
                        ),
                        Expanded(
                          child: buildRadioButton(2, 'Durasi'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildRadioButton(3, 'Keberangkatan Awal'),
                        ),
                        Expanded(
                          child: buildRadioButton(4, 'Keberangkatan Akhir'),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    ElevatedButton(
                      child: Text(
                        'Terapkan',
                        style: myTextTheme.headlineMedium,
                      ),
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          mainBlue,
                        ),
                        fixedSize: MaterialStatePropertyAll(
                          Size(252.w, 40.h),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheetFilterKA(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 560.h,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: mainBlue,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Filter',
                        style: myTextTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kereta Api',
                      style: myTextTheme.labelSmall,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isButton1Click = !isButton1Click;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: grey),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(background),
                          ),
                          child: Text(
                            'Ekonomi',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: grey),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(background),
                          ),
                          child: Text(
                            'Bisnis',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: grey),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(background),
                          ),
                          child: Text(
                            'Eksekutif',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Nama Kereta Api',
                      style: myTextTheme.labelSmall,
                    ),
                    SizedBox(height: 10.h),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        hintText: 'Pilih Nama Kereta Api',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: _trainList.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _selectedTrain = newValue!;
                      },
                    ),
                     SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Waktu Keberangkatan',
                          style: myTextTheme.labelSmall,
                        ),
                        Text(
                          'Waktu Tiba',
                          style: myTextTheme.labelSmall,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '00.00 - 06.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox1,
                            onChanged: (value) {
                              setState(() {
                                checkbox1 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '00.00 - 06.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox2,
                            onChanged: (value) {
                              setState(() {
                                checkbox2 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '06.00 - 12.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox3,
                            onChanged: (value) {
                              setState(() {
                                checkbox3 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '06.00 - 12.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox4,
                            onChanged: (value) {
                              setState(() {
                                checkbox4 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '12.00 - 18.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox5,
                            onChanged: (value) {
                              setState(() {
                                checkbox5 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '12.00 - 18.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox6,
                            onChanged: (value) {
                              setState(() {
                                checkbox6 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '18.00 -  24.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox7,
                            onChanged: (value) {
                              setState(() {
                                checkbox7 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              '18.00 -  24.00',
                              style: myTextTheme.headlineSmall,
                            ),
                            value: checkbox8,
                            onChanged: (value) {
                              setState(() {
                                checkbox8 = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Terapkan',
                  style: myTextTheme.headlineMedium,
                ),
                style:  ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    mainBlue,
                  ),
                  fixedSize: MaterialStatePropertyAll(
                    Size(252.w, 40.h),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Pesanan',
          style: myTextTheme.headlineLarge,
        ),
        bottom: PreferredSize(
          preferredSize: Size(360.w, 60.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(),
                      filled: true,
                      fillColor: background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: iconSearch,
                      hintText: 'Cari pesananmu disini',
                      hintStyle: myTextTheme.displayMedium,
                    ),
                  ),
                ),
                Consumer<TabProvider>(
                  builder: (context, tabProvider, child) {
                    return IconButton(
                      onPressed: () {
                        if (tabProvider.isHotelView) {
                          showBottomSheetFilterHotel(context);
                        } else if (tabProvider.isKeretaApiView) {
                          showBottomSheetFilterKA(context);
                        }
                        tabProvider.toggleView();
                      },
                      icon: iconFilter,
                    );
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: iconSort,
                ),
              ],
            ),
          ),
        ),
      ),
      body: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
          labelStyle: myTextTheme.headlineMedium,
          unselectedLabelColor: grey,
          labelColor: mainBlue,
        ),
        tabs: const [
          Text('Hotel'),
          Text('Kereta Api'),
        ],
        views: const [
          FilterHotel(),
          FilterKeretaApi(),
        ],
      ),
    );
  }
}
