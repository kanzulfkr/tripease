import 'dart:async';
import '/features_kai/view/payment/status_payment.dart';
import '/features_kai/view_model/order_ticket/payment_provider.dart';
import '/features_kai/view_model/order_ticket/patch_order_provider.dart';
import '/features_kai/view_model/station/departure_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/order_ticket/response_order_train_provider.dart';
import '../../view_model/timer/time_payment_provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage(
      {super.key,
      required this.timerText,
      required this.imageUrl,
      required this.isPaymentVA});

  final bool isPaymentVA;
  final String imageUrl;
  final TimerPaymentProvider timerText;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isDropdownOpened = false;
  TimerPaymentProvider timerText = TimerPaymentProvider();
  Timer? countdownTimer;
  List<String> payWithOther = [
    '1. Pilih opsi pembayaran dengan OVO/Gopay/Minimarket dan lainnya pada halaman pembayaran.',
    '2. Setelah itu klik tombol bayar.',
    '3. Anda akan diarahkan ke aplikasi yang dipilih untuk melakukan pembayaran. Pastikan nomor yang terhubung dengan akun dompet digital yang akan digunakan pembayaran.',
    '4. Jika akun dompet digital telah terhubung dengan benar, masukan PIN pada halaman pembayaran.',
    '5. Tunggu hingga muncul notifikasi yang mengkonfirmasi bahwa pembayaran telah berhasil dilakukan.',
  ];

  List<String> payWithVA = [
    '1. Buka aplikasi perbankan Anda dan pilih menu pembayaran atau transfer.',
    '2. Pilih opsi pembayaran Virtual Account atau VA.',
    '3. Masukan nomor VA.',
    '4. Masukan jumlah pembayaran yang sesuai dengan tagihan yang diterima.',
    '5. Pilih rekenening atau kartu debit/kredit anda yang digunakan untuk melakukan pembayaran.',
    '6. Cek kembali informasi yang anda masukan, pastikan nomor VA dan jumlah pembayaran sudah benar.',
    '7. Konfirmasi pembayaran dengan memasukan kode OTP yang dikirimkan nomor telepon atau email terdaftar anda.',
    '8. Tunggu beberapa saat hingga proses pembayaran selesai dan terkonfirmasi.',
    '9. Simpan bukti pembayaran sebagai referensi untuk memudahkan proses verifikasi pembayaran oleh platform pemesanan.'
  ];

  @override
  void initState() {
    super.initState();
    TimerPaymentProvider timerPaymentOther =
        Provider.of<TimerPaymentProvider>(context, listen: false);
    timerPaymentOther.stopCountDown();
    timerPaymentOther.startCountDown(context);
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (timerPaymentOther.isTimeUp()) {
          countdownTimer?.cancel();

          Navigator.of(context).pop();
          showDialogWithContext(context);
        }
      },
    );
  }

  Future<dynamic> showDialogWithContext(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          title: Text('Time Up'),
          content: Text('The time has run out.'),
        );
      },
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);
    final paymentProv = Provider.of<PaymentProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: Text(
          'Pembayaran',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Waktu Pembayaran',
                  style: GoogleFonts.openSans(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Consumer<TimerPaymentProvider>(
                  builder: (context, timerSeat, _) {
                    return Text(timerSeat.timer,
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600));
                  },
                ),
              ],
            ),
            Container(
              height: 80.h,
              margin: EdgeInsets.all(20.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: const Color.fromARGB(255, 226, 228, 232),
              child: widget.isPaymentVA
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          paymentProv.getImageUrl ??
                              'https://res.cloudinary.com/dt3wofhpk/image/upload/v1686845736/go-cloudinary/qnkgyrgwgksdmmhs1tz5.png',
                          height: 60.h,
                          width: 60.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor Virtual Account',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              paymentProv.getAccountNumber ?? 'No data',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.content_copy,
                          size: 13,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 40.h,
                          child: Image.asset(
                            widget.imageUrl,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Total Biaya',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                                '${departureProv.departure[departureProv.selectedDepartIndex as int].price}'),
                          ],
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownOpened = !isDropdownOpened;
                });
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cara Pembayaran',
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(isDropdownOpened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: isDropdownOpened,
                child: SizedBox(
                    height: 420.h,
                    width: 304.w,
                    child: widget.isPaymentVA
                        ? ListView.builder(
                            itemCount: payWithVA.length,
                            itemBuilder: (BuildContext context, int index) {
                              String itemVA = payWithVA[index];
                              return ListTile(
                                title: Text(
                                  itemVA,
                                  maxLines: 19,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: payWithOther.length,
                            itemBuilder: (BuildContext context, int index) {
                              String itemOther = payWithOther[index];
                              return ListTile(
                                title: Text(
                                  itemOther,
                                  maxLines: 19,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            },
                          )),
              ),
            ),
            if (isDropdownOpened)
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ElevatedButton(
              onPressed: () async {
                // order();

                // if (postOrderProv.getStatusCode == '201') {
                //   await responseOrderProv.getResponseOrder(ticketId, trainId);
                //   if (context.mounted) {
                //     print('success code : ${postOrderProv.getStatusCode}');
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Center(
                //           child: Text(
                //             'Berhasil melakukan order Tiket KA',
                //           ),
                //         ),
                //       ),
                //     );
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const PaymentStatus(),
                //       ),
                //       (route) => false,
                //     );
                //   }
                // } else if (postOrderProv.getStatusCode == '400') {
                //   print('failed code : ${postOrderProv.getStatusCode}');
                //   if (context.mounted) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Center(
                //           child: Text(
                //             'Kesalahan Input Data order.',
                //           ),
                //         ),
                //       ),
                //     );
                //   }
                // } else if (postOrderProv.getStatusCode == '401') {
                //   print('failed code : ${postOrderProv.getStatusCode}');
                //   if (context.mounted) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Center(
                //           child: Text(
                //             'Internal Server error.',
                //           ),
                //         ),
                //       ),
                //     );
                //   }
                // }

                //bayaar
                final responOrderProv = Provider.of<ResponseOrderTrainProvider>(
                    context,
                    listen: false);

                final patchOrderProv =
                    Provider.of<PatchTrainProvider>(context, listen: false);
                final ticketOrder = responOrderProv.dataOrder.ticketOrderId;

                print('ticketOrderId : $ticketOrder');

                await patchOrderProv.patchOrderTrainProvider(
                    ticketOrder as int, 'paid');

                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentStatus(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(252, 40),
                backgroundColor: const Color(0XFF0080FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              ),
              child: Text(
                'Bayar',
                style: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Warna teks putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
