import 'package:flutter/material.dart';
import 'package:mus_app/core/app_event.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/helpers/media_query_helper.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/blocs/category_bloc.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';
import 'package:mus_app/services/new_post/widgets/custom_btn.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQueryHelper.width,
          height: MediaQueryHelper.height,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "M  U  S",
                    style: AppTextStyles.w800.copyWith(fontSize: 32),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 24)),
                const Divider(height: 0),
                Expanded(child: Center(child: Container(width: MediaQueryHelper.width,height: MediaQueryHelper.height-200,child: Image.network("https://ouch-cdn2.icons8.com/sjtEk6-nw2P4LfjhoTSkVI-HomBkocWCdrsZ90ypjDs/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTA3/L2FlZjQ4NmM4LTAz/NTYtNGRhNS04ZWQ2/LTBhMGIzMzdhZjNm/Mi5zdmc.png",fit: BoxFit.contain,),),)),
                Center(
                  child: Text(
                    "Take a journy to your book",
                    style: AppTextStyles.w800.copyWith(fontSize: 18,color: AppColor.SUB_TEXT),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:48),
                  child: CustomBtn(text: "Get Started", onTap: () {
                    HomeBloc.instance.add(GetData());
                    CategoryBlock.instance.add(GetData());
                    RouterGenerator.push(Routes.login);
                  },),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}