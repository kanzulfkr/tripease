import 'package:capstone_project_tripease/features_kai/view/seat_carriage/select_seat_departure_page.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/departure_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/station_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../model/order_train_model.dart';
import '../../view_model/carriage/carriage_departure_provider.dart';
import '../../view_model/carriage/select_seat_departure_provider.dart';
import '../../view_model/order_ticket/order_train_provider.dart';
import 'widgets/appbar_input_data.dart';
import 'widgets/show_dialog.dart';

class InputDataKai extends StatefulWidget {
  const InputDataKai({super.key, required this.list});
  final List<String> list;

  @override
  State<InputDataKai> createState() => _InputDataKaiState();
}

class PassengerData {
  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
}

class _InputDataKaiState extends State<InputDataKai> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namesController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isDropdownPemesan = false;
  bool isDropdownPenumpang = false;
  bool val = false;
  List<String> list = <String>['Tuan', 'Nyonya'];
  List<PassengerData> passengerDataList = [];

  @override
  void initState() {
    super.initState();
    final traveler =
        Provider.of<PostOrderTrainProvider>(context, listen: false);
    // Generate controller for each passenger
    for (int i = 0; i < traveler.getQuantityAdult; i++) {
      passengerDataList.add(PassengerData());
    }
  }

  @override
  Widget build(BuildContext context) {
    final stationProv = Provider.of<StationProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: const Row(
          children: [
            AppbarInputData(),
          ],
        ),
      ),
      body: Consumer<PostOrderTrainProvider>(
        builder: (context, travelerDetail, child) {
          if (travelerDetail.travelerDetail == null ||
              travelerDetail.travelerDetail!.length !=
                  travelerDetail.getQuantityAdult) {
            travelerDetail.travelerDetail = List.generate(
              travelerDetail.getQuantityAdult,
              (index) => TravelerDetail(),
            );
          }
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card departure shcedule KA
                    Consumer<DepartureProvider>(
                      builder: (context, departureProv, child) {
                        return SizedBox(
                          height: 180.h,
                          width: double.maxFinite,
                          child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            margin: EdgeInsets.only(bottom: 12.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 0.5,
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/kai.png',
                                      scale: 0.8,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProv
                                          .departure[departureProv
                                              .selectedDepartIndex as int]
                                          .name
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Rp. ${departureProv.departure[departureProv.selectedDepartIndex as int].price},-',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Stasiun ${departureProv.departure[departureProv.selectedDepartIndex as int].route![0].station!.origin.toString()}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Stasiun ${departureProv.departure[departureProv.selectedDepartIndex as int].route![1].station!.origin.toString()}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProv
                                          .departure[departureProv
                                              .selectedDepartIndex as int]
                                          .datumClass
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            113, 114, 117, 1),
                                      ),
                                    ),
                                    Text(
                                      'Tersedia',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            61, 175, 29, 1),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProv
                                          .departure[departureProv
                                              .selectedDepartIndex as int]
                                          .route![0]
                                          .arriveTime
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward),
                                    Text(
                                      departureProv
                                          .departure[departureProv
                                              .selectedDepartIndex as int]
                                          .route![1]
                                          .arriveTime
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      departureProv.departureDate == ''
                                          ? DateFormat('EEEE, dd MMMM', 'id_ID')
                                              .format(DateTime.now())
                                          : departureProv.departureDate,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromRGBO(
                                            113, 114, 117, 1),
                                      ),
                                    ),
                                    Text(
                                      departureProv.getDurationKA(
                                          departureProv
                                              .departure[departureProv
                                                  .selectedDepartIndex as int]
                                              .route![0]
                                              .arriveTime!,
                                          departureProv
                                              .departure[departureProv
                                                  .selectedDepartIndex as int]
                                              .route![1]
                                              .arriveTime!),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromRGBO(
                                            113, 114, 117, 1),
                                      ),
                                    ),
                                    Text(
                                      departureProv.departureDate == ''
                                          ? DateFormat('EEEE, dd MMMM', 'id_ID')
                                              .format(DateTime.now())
                                          : departureProv.departureDate,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromRGBO(
                                            113, 114, 117, 1),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Card return shcedule KA
                    stationProv.pulangPergi
                        ?
                        // consumer<return provider>
                        Text('is pp')
                        : SizedBox(),

                    // input data Booking
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownPemesan = !isDropdownPemesan;
                        });
                      },
                      child: Container(
                        height: 48,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(left: 0, top: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xF9FAFBFB),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.2,
                              blurRadius: 0.5,
                              offset: const Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Detail Pemesanan ',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              isDropdownPemesan
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (isDropdownPemesan) ...[
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color(0xF9FAFBFB),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.2,
                              blurRadius: 0.5,
                              offset: const Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: TextFormField(
                                  controller: _namesController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(210, 215, 224, 1)),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    hintText: 'Nama Lengkap',
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                  onChanged: (value) {
                                    travelerDetail.setName(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Nama Lengkap harap di isi.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Text(
                                'Nomor Telepon',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: TextFormField(
                                  controller: _phoneNumberController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(210, 215, 224, 1)),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    hintText: 'Nomor Telepon',
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    travelerDetail.setPhoneNumber(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Nomor Telepon harap di isi.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Text(
                                'Email',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: TextFormField(
                                  controller: _emailController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(210, 215, 224, 1)),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    hintText: 'Email Pemesan',
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                  onChanged: (value) {
                                    travelerDetail.setEmail(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email harap di isi.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                height: 150.h,
                                width: double.maxFinite,
                                padding: EdgeInsets.all(20.w),
                                margin: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromARGB(255, 219, 215, 215),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      blurRadius: 0.5,
                                      offset: const Offset(0.5, 0.5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.info_rounded,
                                            color: Colors.blue),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "Info",
                                          style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints constraints) {
                                        return Text(
                                          'Data Pemesan hanya digunakan untuk mengirim invoice melalui email dan segala yang berhubungan dengan transaksi. Privasi data tetap terjaga',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines:
                                              6, // Jumlah maksimum baris yang ingin ditampilkan
                                          overflow: TextOverflow
                                              .ellipsis, // Tindakan yang diambil saat teks melampaui jumlah maksimum baris
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      final PassengerData pass =
                                          passengerDataList[0];

                                      pass.nameController.text =
                                          travelerDetail.getName!;
                                    });
                                    travelerDetail.travelerDetail![0].fullName =
                                        travelerDetail.getName!;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      backgroundColor: const Color(0XFF0080FF)),
                                  child: Text(
                                    'Tambahkan sebagai Penumpang',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white, // Warna teks putih
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    // input data Passenger
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownPenumpang = !isDropdownPenumpang;
                        });
                      },
                      child: Container(
                        height: 48,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(left: 0, top: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xF9FAFBFB),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.2,
                              blurRadius: 0.5,
                              offset: const Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Detail Penumpang ',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              isDropdownPenumpang
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // if (isDropdownPenumpang) ...[
                    //   BodyDetailPessanger(list: list),
                    // ],
                    if (isDropdownPenumpang) ...[
                      SizedBox(
                        height: 300.h,
                        child: ListView.builder(
                          itemCount: travelerDetail.getQuantityAdult,
                          itemBuilder: (context, index) {
                            final passenger = index + 1;
                            final traveler =
                                travelerDetail.travelerDetail!.length > index
                                    ? travelerDetail.travelerDetail![index]
                                    : TravelerDetail();
                            final PassengerData passengerData =
                                passengerDataList[index];

                            return Column(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xF9FAFBFB),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        blurRadius: 0.5,
                                        offset: const Offset(0.5, 0.5),
                                      ),
                                    ],
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Penumpang $passenger',
                                              style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                final departureProv = Provider
                                                    .of<DepartureProvider>(
                                                        context,
                                                        listen: false);
                                                await Provider.of<
                                                            CarriageDepartureProvider>(
                                                        context,
                                                        listen: false)
                                                    .fetchCarriageDeparture(
                                                  trainId: departureProv
                                                      .departure[departureProv
                                                              .selectedDepartIndex
                                                          as int]
                                                      .trainId as int,
                                                  trainClass: departureProv
                                                      .departure[departureProv
                                                              .selectedDepartIndex
                                                          as int]
                                                      .datumClass,
                                                );
                                                if (context.mounted) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SelectSeatDepartureCarriage(
                                                        passengerNumber:
                                                            passenger,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              child: Text(
                                                'No.Kursi',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationThickness: 2.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Container(
                                          height: 48,
                                          width: double.maxFinite,
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 30),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: DropdownButton<String>(
                                            hint: const Text(
                                              'Tn. / Ny.',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            value: traveler.title,
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            elevation: 16,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            onChanged: (String? value) {
                                              traveler.title = value!;
                                              travelerDetail
                                                  .updateTravelerTitle(
                                                      index, value);
                                            },
                                            items: widget.list
                                                .map<DropdownMenuItem<String>>(
                                              (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Nomor Identitas',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller:
                                              passengerData.nikController,
                                          onChanged: (value) {
                                            traveler.idCardNumber = value;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(
                                                      210, 215, 224, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            hintText: 'NIK/Paspor',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 12,
                                            ),
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Nomor Identitas harap di isi.';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Nama Lengkap',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller:
                                              passengerData.nameController,
                                          onChanged: (value) {
                                            traveler.fullName = value =
                                                passengerData
                                                    .nameController.text;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(
                                                      210, 215, 224, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            hintText: 'Nama Lengkap',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 12,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Nama Lengkap harap di isi.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                    SizedBox(height: 30.h),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final selectedSeatsProvider =
                              Provider.of<SelectedSeatsDepartureProvider>(
                                  context,
                                  listen: false);
                          if (_formKey.currentState!.validate()) {
                            print('Pemesan');
                            print('email : ${travelerDetail.getEmail}');
                            print('name : ${travelerDetail.getName}');
                            print('phone : ${travelerDetail.getPhoneNumber}');
                            print('Penumpang :');
                            print(
                                'name : ${travelerDetail.travelerDetail![0].fullName}');
                            print(
                                'title : ${travelerDetail.travelerDetail![0].title}');
                            print(
                                'idCard : ${travelerDetail.travelerDetail![0].idCardNumber}');

                            if (selectedSeatsProvider.selectedSeats.isEmpty) {
                              print('seats masi kosong');
                            } else {
                              showCustomAlertDialog(context);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(252, 40),
                            backgroundColor: const Color(0XFF0080FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0)),
                        child: Text(
                          'Konfirmasi',
                          style: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // Warna teks putih
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
