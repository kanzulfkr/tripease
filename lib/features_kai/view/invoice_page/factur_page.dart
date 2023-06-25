import '../../../features_order/view_model/provider/tab_provider.dart';
import '../../../selected_tab.dart';
import '/features_kai/view_model/order_ticket/response_order_train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../main_page.dart';
import '../../view_model/order_ticket/order_train_provider.dart';
import '../../view_model/station/departure_provider.dart';
import '../../view_model/station/return_provider.dart';
import '../../view_model/station/station_provider.dart';
import 'ticket_booking.dart';

class FacturPage extends StatefulWidget {
  const FacturPage({super.key});

  @override
  State<FacturPage> createState() => _FacturPageState();
}

class _FacturPageState extends State<FacturPage> {
  @override
  Widget build(BuildContext context) {
    final stationProv = Provider.of<StationProvider>(context, listen: false);
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);
    final postOrderProv =
        Provider.of<PostOrderTrainProvider>(context, listen: false);

    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: Text(
          'Faktur',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<ResponseOrderTrainProvider>(
        builder: (context, responseProv, child) {
          int quantityAdult = postOrderProv.getQuantityAdult;

          // int price
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: ListView(
              children: [
                Text(
                  'No. ${responseProv.dataOrder.ticketOrderCode}',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const TicketBooking(),
                const SizedBox(height: 16),
                stationProv.pulangPergi
                    ? Container(
                        height: 160,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  returnProv
                                      .returns[
                                          returnProv.selectedDepartIndex as int]
                                      .name
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Rp. ${returnProv.returns[returnProv.selectedDepartIndex as int].price},-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Stasiun ${returnProv.returns[returnProv.selectedDepartIndex as int].route![0].station!.origin.toString()}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Stasiun ${returnProv.returns[returnProv.selectedDepartIndex as int].route![1].station!.origin.toString()}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  returnProv
                                      .returns[
                                          returnProv.selectedDepartIndex as int]
                                      .datumClass
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(113, 114, 117, 1),
                                  ),
                                ),
                                const Text(
                                  'Tersedia',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(61, 175, 29, 1),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  returnProv
                                      .returns[
                                          returnProv.selectedDepartIndex as int]
                                      .route![0]
                                      .arriveTime
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const Icon(Icons.arrow_forward),
                                Text(
                                  returnProv
                                      .returns[
                                          returnProv.selectedDepartIndex as int]
                                      .route![1]
                                      .arriveTime
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  departureProv.returnDate == ''
                                      ? DateFormat('dd MMMM yyyy', 'id_ID')
                                          .format(DateTime.now())
                                      : departureProv.returnDate,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(113, 114, 117, 1),
                                  ),
                                ),
                                Text(
                                  returnProv.getDurationKA(
                                      returnProv
                                          .returns[returnProv
                                              .selectedDepartIndex as int]
                                          .route![0]
                                          .arriveTime!,
                                      returnProv
                                          .returns[returnProv
                                              .selectedDepartIndex as int]
                                          .route![1]
                                          .arriveTime!),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(113, 114, 117, 1),
                                  ),
                                ),
                                Text(
                                  departureProv.returnDate == ''
                                      ? DateFormat('dd MMMM yyyy', 'id_ID')
                                          .format(DateTime.now())
                                      : departureProv.returnDate,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(113, 114, 117, 1),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      stationProv.pulangPergi ? 'Tiket Keberangkatan' : 'Tiket',
                      style: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                            '$quantityAdult x Rp. ${departureProv.departure[departureProv.selectedDepartIndex as int].price!}',
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 17),
                stationProv.pulangPergi
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tiket Pulang',
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '$quantityAdult x Rp.${returnProv.returns[returnProv.selectedDepartIndex as int].price!}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Container(
                  width: 400,
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(height: 17),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          stationProv.pulangPergi
                              ? 'Rp.${quantityAdult * ((returnProv.returns[returnProv.selectedDepartIndex as int].price!) + (departureProv.departure[departureProv.selectedDepartIndex as int].price!))}'
                              : 'Rp. ${(departureProv.departure[departureProv.selectedDepartIndex as int].price!) * quantityAdult}',
                          style: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pay With',
                      style: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Image.network(
                      '${responseProv.dataOrder.payment!.imageUrl}',
                      width: 50,
                      height: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final tabProvider =
                          Provider.of<TabProvider>(context, listen: false);

                      final navBarProv =
                          Provider.of<NavBarProvider>(context, listen: false);
                      tabProvider.setInitialIndex(1);
                      navBarProv.setSelectedIndex(1);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                        (route) =>
                            false, // Condition to remove all previous routes
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(252, 40),
                        backgroundColor:
                            const Color(0XFF0080FF), // Ukuran tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5), // Sudut melengkung dengan jari-jari 5
                        ),
                        padding: const EdgeInsets.fromLTRB(
                            24, 0, 24, 0) // Warna latar belakang biru
                        ),
                    child: Text(
                      'Cek Pesanan',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // Warna teks putih
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
