import '../../../../../selected_tab.dart';
import '../../../../view_model/provider/tab_provider.dart';
import '/features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import '/features_order/view_model/provider/hotel/hotel_order_update_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'checkout_splah.dart';
import 'component/button_active.dart';
import 'component/button_close.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HotelOrderDetailProvider>(
      builder: (context, orderTitle, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
            title: Text(
              orderTitle.getNameHotel ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: Consumer<HotelOrderDetailProvider>(
            builder: (context, orderDetail, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Detail Hotel',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 128, 255, 1),
                            ),
                          ),
                          Text(
                            orderDetail.getNameHotel ?? '',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Expanded(
                            child: Text(
                              orderDetail.getAddressHotel ?? '',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Detail Kamar',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 128, 255, 1),
                            ),
                          ),
                          const Text(
                            'Kamar No. 199',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${orderDetail.getNumberOfMattress} Single Bed, ${orderDetail.getNumberOfGuest} Guest',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Detail Waktu',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 128, 255, 1),
                            ),
                          ),
                          const Text(
                            'Check-in sebelum 14:00',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                '${orderDetail.getNumberOfNight} Night ',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                orderDetail.getCreateAt ?? '',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonClose(
                      text: 'Check-Out',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  'Apakah Anda yakin ingin Check-out?'),
                              titleTextStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 132,
                                      child: ButtonClose(
                                        text: 'Ya',
                                        onTap: () {
                                          final tabProvider =
                                              Provider.of<TabProvider>(context,
                                                  listen: false);

                                          final navBarProv =
                                              Provider.of<NavBarProvider>(
                                                  context,
                                                  listen: false);
                                          tabProvider.setInitialIndex(0);
                                          navBarProv.setSelectedIndex(1);
                                          var orderProvider = Provider.of<
                                                  StatusOrderHotelUpdateProvider>(
                                              context,
                                              listen: false);
                                          int? hotelOrderId =
                                              orderDetail.getHotelOrderId;
                                          String status = 'done';

                                          orderProvider.updateOrderStatus(
                                              hotelOrderId!, status);

                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckOutSplash(),
                                          ));
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: 132,
                                      child: ButtonActive(
                                        text: 'Tidak',
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: null,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
