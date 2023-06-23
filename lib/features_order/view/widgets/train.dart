import 'package:buttons_tabbar/buttons_tabbar.dart';

import 'package:capstone_project_tripease/features_order/view_model/provider/tab_provider.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_detail_kai.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_cancelled.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_done.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_pending.dart';
import 'package:capstone_project_tripease/features_order_details_train/view/order_kai_refund_pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/number_symbols.dart' as symbols;
import 'package:intl/number_symbols_data.dart' as symbols_data;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';
import '../../utils/images.dart';
import '../../view_model/provider/coundown_provider.dart';
import '../../view_model/provider/train/train_order_detail_provider.dart';
import '../../view_model/provider/train/train_order_provider.dart';
import '../../view_model/provider/train/train_order_update_provider.dart';

class KeretaApi extends StatefulWidget {
  const KeretaApi({
    super.key,
  });

  @override
  State<KeretaApi> createState() => _KeretaApiState();
}

class _KeretaApiState extends State<KeretaApi>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder());
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  getFilteredCardTrains() {
    var providerTrain =
        Provider.of<TrainOrderProvider>(context, listen: false).tabStatusTrain;
    switch (providerTrain) {
      case TabStatusTrain.MENUNGGU:
        return Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder(status: 'unpaid');
      case TabStatusTrain.AKTIF:
        return Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder(status: 'paid');
      case TabStatusTrain.SELESAI:
        return Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder(status: 'done');
      case TabStatusTrain.DIBATALKAN:
        return Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder(status: 'canceled');
      case TabStatusTrain.PENGEMBALIAN:
        return Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder(status: 'refund');
      case TabStatusTrain.SEMUA:
      default:
        return Provider.of<TrainOrderProvider>(context, listen: false)
            .fetchTrainOrder(status: '');
    }
  }

  Color getIconColor(SvgPicture icon) {
    if (icon == iconCheck) {
      return green;
    } else if (icon == iconSchedule) {
      return kuning;
    } else if (icon == iconPesananSelesai) {
      return orange;
    } else if (icon == iconCencel) {
      return red;
    } else {
      return black;
    }
  }

  void navigateToDetailPage() {
    var detailTrain =
        Provider.of<TrainOrderProvider>(context, listen: false).tabStatusTrain;
    List<Widget> destinationPages = [];

    switch (detailTrain) {
      case TabStatusTrain.MENUNGGU:
        destinationPages.add(const OrderKaiPendingPage());
        break;
      case TabStatusTrain.AKTIF:
        destinationPages.add(const OrderDetailKai());
        break;
      case TabStatusTrain.SELESAI:
        destinationPages.add(const OrderKaiDonePage());
        break;
      case TabStatusTrain.DIBATALKAN:
        destinationPages.add(const OrderKaiCancelledPage());
        break;
      case TabStatusTrain.PENGEMBALIAN:
        destinationPages.add(const OrderKaiCancelledPage());
        break;
      case TabStatusTrain.SEMUA:
      default:
        return;
    }
    if (destinationPages.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return PageView(
            children: destinationPages,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context, listen: false);
    tabProvider.setActiveTabIndex(1);

    ScreenUtil.init(context);

    return Consumer<TrainOrderProvider>(
      builder: (context, trainProvider, _) {
        return Container(
          color: background,
          child: DefaultTabController(
            length: 6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: background,
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.5),
                              spreadRadius: 1.w,
                              blurRadius: 5.w,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: ButtonsTabBar(
                            radius: 50.0.r,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            backgroundColor: mainBlue,
                            unselectedBackgroundColor: background,
                            labelStyle: myTextTheme.labelLarge,
                            unselectedLabelStyle: myTextTheme.labelMedium,
                            borderColor: grey,
                            borderWidth: .3,
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'Semua'),
                              Tab(text: 'Menunggu'),
                              Tab(text: 'Aktif'),
                              Tab(text: 'Selesai'),
                              Tab(text: 'Dibatalkan'),
                              Tab(text: 'Pengembalian'),
                            ],
                            onTap: (index) {
                              trainProvider
                                  .changesTab(TabStatusTrain.values[index]);
                              getFilteredCardTrains();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: trainProvider.trainOrder.length,
                      itemBuilder: (context, index) {
                        DateTime date = trainProvider.trainOrder[index].date ??
                            DateTime.now();
                        initializeDateFormatting('id_ID', null);
                        String formattedDate =
                            DateFormat.yMMMMd('id_ID').format(date);
                        return InkWell(
                          onTap: () {
                            var orderDetail =
                                Provider.of<TrainOrderDetailProvider>(context,
                                    listen: false);
                            var nameTrain =
                                trainProvider.trainOrder[index].train?.name ??
                                    '';
                            orderDetail.setNameTrain(nameTrain);
                            var classTrain = trainProvider
                                    .trainOrder[index].train?.trainClass ??
                                '';
                            orderDetail.setClassTrain(classTrain);
                            var ticketOrderCode = trainProvider
                                    .trainOrder[index].ticketOrderCode ??
                                '';
                            orderDetail.setTicketOrderCode(ticketOrderCode);
                            var stationOrigin = trainProvider
                                    .trainOrder[index].stationOrigin?.origin ??
                                '';
                            orderDetail.setStationOrigin(stationOrigin);
                            var stationDestination = trainProvider
                                    .trainOrder[index]
                                    .stationDestination
                                    ?.origin ??
                                '';
                            orderDetail
                                .setStationDestination(stationDestination);
                            var depatureTime = trainProvider.trainOrder[index]
                                    .stationOrigin?.arriveTime ??
                                '';
                            orderDetail.setDepatureTime(depatureTime);
                            var arriveTime = trainProvider.trainOrder[index]
                                    .stationDestination?.arriveTime ??
                                '';
                            orderDetail.setArriveTime(arriveTime);
                            var dateTime =
                                trainProvider.trainOrder[index].date ??
                                    DateTime.now();
                            initializeDateFormatting('id_ID', null);
                            String formattedDateTime =
                                DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                    .format(dateTime);
                            orderDetail.setDateTime(formattedDateTime);
                            var typePayment =
                                trainProvider.trainOrder[index].payment?.type ??
                                    '';
                            orderDetail.setTypePayment(typePayment);
                            var namePayment =
                                trainProvider.trainOrder[index].payment?.name ??
                                    '';
                            orderDetail.setNamePayment(namePayment);
                            var imagePayment = trainProvider
                                    .trainOrder[index].payment?.imageUrl ??
                                '';
                            orderDetail.setImagePayment(imagePayment);
                            var trainPrice = trainProvider
                                    .trainOrder[index].train?.trainPrice ??
                                '';
                            initializeDateFormatting('id_ID', null);
                            var numberFormat = NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp.',
                                decimalDigits: 0);
                            String formattedTrainPrice = numberFormat
                                .format(int.parse(trainPrice.toString()));
                            orderDetail.setTrainPrice(formattedTrainPrice);
                            var createdAt =
                                trainProvider.trainOrder[index].createdAt ?? '';
                            orderDetail.setCreatedAt(createdAt.toString());
                            var updateAt =
                                trainProvider.trainOrder[index].updatedAt ?? '';
                            orderDetail.setUpdatedAt(updateAt.toString());
                            var accountName = trainProvider
                                    .trainOrder[index].payment?.accountName ??
                                '';
                            orderDetail.setAccountName(accountName);
                            var accountNumber = trainProvider
                                    .trainOrder[index].payment?.accountNumber ??
                                '';
                            orderDetail.setAccountNumber(accountNumber);
                            var trainCarriage = trainProvider
                                    .trainOrder[index].train?.trainCarriage ??
                                '';
                            orderDetail.setTrainCarriage(trainCarriage);
                            var trainSeat = trainProvider
                                    .trainOrder[index].train?.trainSeat ??
                                '';
                            orderDetail.setTrainSeat(trainSeat);
                            var trainOrderId =
                                trainProvider.trainOrder[index].ticketOrderId;
                            orderDetail.setTrainOrderId(trainOrderId);
                            var qualityAdult =
                                trainProvider.trainOrder[index].quantityAdult ??
                                    '';
                            orderDetail
                                .setQualityAdult(qualityAdult.toString());
                            var qualityInfant = trainProvider
                                    .trainOrder[index].quantityInfant ??
                                '';
                            orderDetail
                                .setQualityInfant(qualityInfant.toString());
                            var nameOrder =
                                trainProvider.trainOrder[index].nameOrder ?? '';
                            orderDetail.setNameOrder(nameOrder);

                            navigateToDetailPage();
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: background,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.5),
                                        spreadRadius: 1.w,
                                        blurRadius: 3.w,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  width: 350.w,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            trainProvider.trainOrder[index]
                                                        .status ==
                                                    'unpaid'
                                                ? iconSchedule
                                                : trainProvider
                                                            .trainOrder[index]
                                                            .status ==
                                                        'paid'
                                                    ? iconCheck
                                                    : trainProvider
                                                                .trainOrder[
                                                                    index]
                                                                .status ==
                                                            'done'
                                                        ? iconPesananSelesai
                                                        : trainProvider
                                                                    .trainOrder[
                                                                        index]
                                                                    .status ==
                                                                'canceled'
                                                            ? iconCencel
                                                            : iconCencel,
                                            SizedBox(width: 5.w),
                                            Expanded(
                                              child: trainProvider
                                                          .trainOrder[index]
                                                          .status ==
                                                      'unpaid'
                                                  ? Text(
                                                      'MENUNGGU PEMBAYARAN',
                                                      style: myTextTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                        color: kuning,
                                                      ),
                                                    )
                                                  : trainProvider
                                                              .trainOrder[index]
                                                              .status ==
                                                          'paid'
                                                      ? Text(
                                                          'SUDAH BAYAR',
                                                          style: myTextTheme
                                                              .titleLarge
                                                              ?.copyWith(
                                                            color: green,
                                                          ),
                                                        )
                                                      : trainProvider
                                                                  .trainOrder[
                                                                      index]
                                                                  .status ==
                                                              'done'
                                                          ? Text(
                                                              'PESANAN SELESAI',
                                                              style: myTextTheme
                                                                  .titleLarge
                                                                  ?.copyWith(
                                                                color: orange,
                                                              ),
                                                            )
                                                          : trainProvider
                                                                          .trainOrder[
                                                                              index]
                                                                          .status ==
                                                                      'canceled' &&
                                                                  trainProvider
                                                                          .trainOrder[
                                                                              index]
                                                                          .status ==
                                                                      'refund'
                                                              ? Text(
                                                                  'PESANAN DIBATALKAN',
                                                                  style: myTextTheme
                                                                      .titleLarge
                                                                      ?.copyWith(
                                                                    color: red,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  'PESANAN DIBATALKAN',
                                                                  style: myTextTheme
                                                                      .titleLarge
                                                                      ?.copyWith(
                                                                    color: red,
                                                                  ),
                                                                ),
                                            ),
                                            if (trainProvider
                                                    .trainOrder[index].status ==
                                                'unpaid')
                                              Consumer<CountdownProvider>(
                                                builder:
                                                    (context, timeProvider, _) {
                                                  return Expanded(
                                                    child: CountdownTimer(
                                                        endTime: timeProvider
                                                            .endTime,
                                                        textStyle: myTextTheme
                                                            .titleLarge
                                                            ?.copyWith(
                                                          color: getIconColor(
                                                              iconSchedule),
                                                        ),
                                                        onEnd: () {
                                                          var orderProvider =
                                                              Provider.of<
                                                                      StatusOrderTrainUpdateProvider>(
                                                                  context,
                                                                  listen:
                                                                      false);

                                                          int? ticketOrderId =
                                                              trainProvider
                                                                  .trainOrder[
                                                                      index]
                                                                  .ticketOrderId;
                                                          String status =
                                                              'canceled';
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                  'Waktu Habis',
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                    color:
                                                                        black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                content: Text(
                                                                  'Pesanan Dibatalkan',
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                    color:
                                                                        black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    child: Text(
                                                                      'Tutup',
                                                                      style: GoogleFonts
                                                                          .openSans(
                                                                        color:
                                                                            mainBlue,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ).then((value) {
                                                            orderProvider
                                                                .updateOrderStatus(
                                                                    ticketOrderId,
                                                                    status);
                                                            _tabController
                                                                ?.animateTo(4);
                                                          });
                                                        }),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(48.r),
                                                child: train1,
                                              ),
                                            ),
                                            SizedBox(width: 20.w),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        trainProvider
                                                                .trainOrder[
                                                                    index]
                                                                .stationOrigin
                                                                ?.origin ??
                                                            '',
                                                        style: myTextTheme
                                                            .displayMedium,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      iconForward,
                                                      Expanded(
                                                        child: Text(
                                                          trainProvider
                                                                  .trainOrder[
                                                                      index]
                                                                  .stationDestination
                                                                  ?.origin ??
                                                              '',
                                                          style: myTextTheme
                                                              .displayMedium,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          iconTrain,
                                                          SizedBox(width: 5.w),
                                                          Expanded(
                                                            child: Text(
                                                              trainProvider
                                                                      .trainOrder[
                                                                          index]
                                                                      .train
                                                                      ?.name ??
                                                                  '',
                                                              style: myTextTheme
                                                                  .headlineSmall,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          iconSeat,
                                                          SizedBox(width: 5.w),
                                                          Expanded(
                                                            child: Text(
                                                              trainProvider
                                                                      .trainOrder[
                                                                          index]
                                                                      .train
                                                                      ?.trainSeat ??
                                                                  '',
                                                              style: myTextTheme
                                                                  .headlineSmall,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          iconDate,
                                                          SizedBox(width: 5.w),
                                                          Expanded(
                                                            child: Text(
                                                              formattedDate,
                                                              style: myTextTheme
                                                                  .headlineSmall,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        const Divider(
                                          color: black,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nomor Pesanan :',
                                                style: myTextTheme.bodySmall,
                                              ),
                                              SizedBox(width: 5.w),
                                              Expanded(
                                                child: Text(
                                                  trainProvider
                                                          .trainOrder[index]
                                                          .ticketOrderCode
                                                          ?.toString() ??
                                                      '',
                                                  style: myTextTheme.bodySmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
