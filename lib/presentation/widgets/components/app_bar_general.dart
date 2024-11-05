import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/text_styles.dart';
import 'package:stadtplan/utils/dotenv_utils.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGeneral({
    super.key,
    this.title,
    this.backPressCallBack,
    this.logoUrl = '',
    this.titleKey,
    this.backButtonKey,
    this.hideBackButton = false,
    this.showAction = false,
    this.action,
  });
  final String? title;
  final String? logoUrl;
  final VoidCallback? backPressCallBack;
  final bool? showAction;
  final Widget? action;
  final Key? titleKey;
  final Key? backButtonKey;
  final bool hideBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !hideBackButton
          ? IconButton(
              icon: ImageAssets.icNavigationBack(),
              key: backButtonKey,
              onPressed: () {
                if (backPressCallBack != null) {
                  backPressCallBack?.call();
                } else {
                  Navigator.pop(context);
                }
              },
            )
          : null,
      centerTitle: true,
      elevation: 0.5,
      shadowColor: Palette.lightgrey_f3f3f2,
      backgroundColor: Color(
        int.parse(
          DotenvUtils.getString('APP_BAR_COLOR', fallback: '0xffffffff'),
        ),
      ),
      actions: <Widget>[
        if (showAction != null) action ?? Container(),
        if (logoUrl != null && showAction == false)
          // This icon is technically useless but just for better
          // alignment for spacing from both sides
          Theme(
            data: ThemeData(
              highlightColor: Colors.white,
              splashColor: Colors.white,
              hoverColor: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Palette.white,
              ),
              onPressed: () {},
            ),
          ),
      ],
      title: (logoUrl != null)
          ? Text(
              title ?? '',
              key: titleKey,
              style: TextStyles.header4Bold(
                color: Palette.greyDark,
              ),
            )
          : Center(
              child: SizedBox(
                height: 60,
                width: 60,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Palette.white,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: CachedNetworkImage(imageUrl: logoUrl ?? ''),
                ),
              ),
            ),
    );
  }
}
