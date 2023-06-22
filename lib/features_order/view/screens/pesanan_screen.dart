import 'package:capstone_project_tripease/features_order/view/widgets/bottom_sheet/sort_train.dart';
import 'package:capstone_project_tripease/features_order/view/widgets/train.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/train/train_order_filter_provider.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/train/train_search_provider.dart';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/icons.dart';
import '../../view_model/provider/tab_provider.dart';
import '../widgets/bottom_sheet/filter_hotel.dart';
import '../widgets/bottom_sheet/filter_train.dart';
import '../widgets/bottom_sheet/sort_hotel.dart';
import '../widgets/hotel.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  int selectRadio = 0;
  final TextEditingController _searchController = TextEditingController();

  void showBottomSheetFilterHotel(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetFilterHotel();
      },
    );
  }

  void showBottomSheetSortHotel(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetShortHotel();
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
          selectRadio = value ?? 0;
        });
      },
    );
  }

  void showBottomSheetFilterKA(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetFilterKA();
      },
    );
  }

  void showBottomSheetSortKA(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetShortKA();
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
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Consumer<TrainSearchProvider>(
                    builder: (context, trainSearchProvider, _) {
                      return TextFormField(
                        controller: _searchController,
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          color: black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(),
                          filled: true,
                          fillColor: background,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          prefixIcon: iconSearch,
                          hintText: 'Cari pesananmu disini',
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: grey,
                          ),
                        ),
                        onChanged: (value) {
                          trainSearchProvider.searchTrainByName(value);
                        },
                      );
                    },
                  ),
                ),
                Consumer<TabProvider>(
                  builder: (context, tabProvider, _) {
                    return IconButton(
                      onPressed: () {
                        final activeTabIndex = tabProvider.activeTabIndex;
                        if (activeTabIndex == 0) {
                          showBottomSheetFilterHotel(context);
                        } else if (activeTabIndex == 1) {
                          showBottomSheetFilterKA(context);
                        }
                      },
                      icon: iconFilter,
                    );
                  },
                ),
                Consumer<TabProvider>(
                  builder: (context, tabProvider, _) {
                    return IconButton(
                      onPressed: () {
                        final activeTabIndex = tabProvider.activeTabIndex;
                        if (activeTabIndex == 0) {
                          showBottomSheetSortHotel(context);
                        } else if (activeTabIndex == 1) {
                          showBottomSheetSortKA(context);
                        }
                      },
                      icon: iconSort,
                    );
                  },
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
          Hotel(),
          KeretaApi(),
        ],
      ),
    );
  }
}
