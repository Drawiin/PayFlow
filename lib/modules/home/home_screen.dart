import 'package:flutter/material.dart';
import 'package:pay_flow/modules/extract/extract_screen.dart';
import 'package:pay_flow/modules/home/home_controller.dart';
import 'package:pay_flow/modules/my_invoices/my_invoices_screen.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/values/app_routes.dart';
import 'package:pay_flow/shared/values/app_strings.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  final pages = [MyInvoicesScreen(), ExtractScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: pages[controller.page],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimens.heightAppBar),
          child: Container(
            color: AppColors.primary,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.paddingSmall),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text.rich(TextSpan(
                      text: AppStrings.homeTitle,
                      style: AppTextStyles.titleRegularBackground,
                      children: [
                        TextSpan(
                          text: "${widget.user.name}",
                          style: AppTextStyles.titleBoldBackground,
                        )
                      ])),
                  subtitle: Text(
                    AppStrings.homeSubtitle,
                    style: AppTextStyles.captionBackground,
                  ),
                  trailing: Container(
                    height: AppDimens.sizeAvatar,
                    width: AppDimens.sizeAvatar,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(AppDimens.borderRadiusSmall),
                        image: DecorationImage(
                            image: NetworkImage(widget.user.photoUrl!))),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: AppDimens.heightBottomBar,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    controller.setPage(0);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.home,
                    color: controller.page == 0
                        ? AppColors.primary
                        : AppColors.body,
                  )),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.barcodeScanner),
                child: Container(
                  height: AppDimens.sizeAddButton,
                  width: AppDimens.sizeAddButton,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.circular(AppDimens.borderRadiusSmall)),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.setPage(1);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.description_outlined,
                    color: controller.page == 1
                        ? AppColors.primary
                        : AppColors.body,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
