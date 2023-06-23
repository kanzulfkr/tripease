import '/features_profile/view/help_center/detail_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/article_provider.dart';

class PopularTopic extends StatefulWidget {
  const PopularTopic({
    super.key,
  });

  @override
  State<PopularTopic> createState() => _PopularTopicState();
}

class _PopularTopicState extends State<PopularTopic> {
  @override
  void initState() {
    final article = Provider.of<ArticleProvider>(context, listen: false);
    article.getAllArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, value, child) => Container(
        height: 567.h,
        width: double.maxFinite,
        padding: EdgeInsets.all(16.w),
        color: const Color.fromRGBO(240, 240, 248, 1),
        child: Container(
          color: Colors.white,
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(bottom: 26.h),
                child: Text(
                  'Topik Populer',
                  style: GoogleFonts.openSans(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 430.h,
                width: double.maxFinite,
                child: value.loading
                    ? Center(
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: const CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.listAllArticle.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              final id = value.listAllArticle[index].articleId;
                              value.getArticleById(id!);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DetailTopic(
                                  title: 'Details Topic',
                                ),
                              ));
                            },
                            child: SizedBox(
                              height: 60.h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 265.w,
                                        child: Text(
                                          value.listAllArticle[index].label!,
                                          style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color.fromRGBO(0, 128, 255, 1),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black54,
                                    height: 3.h,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
