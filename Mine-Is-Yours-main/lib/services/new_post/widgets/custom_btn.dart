import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  final Color? color;
  final Color? txtColor,borderColor;
  final IconData? icon;
  final Widget? image;
  final bool? loading;
  final double? btnWidth;
  final double? btnHeight;
  final double? txtFontSize;
  final double? paddingWidth;
  final double? horizontalPadding;
  final double? radius;
  final bool? withPadding;
  final bool? onlyBorder;
  final bool? showTransparent;
  final bool isCentered;
  /// you can't use text if you are going to use a widget instead
  final Widget? widget;
  const CustomBtn(
      {Key? key,
      @required this.text,
      @required this.onTap,
      this.color,
      this.borderColor,
      this.widget,
      this.txtColor,
      this.paddingWidth,
      this.icon,
      this.loading = false,
      this.btnWidth,
      this.txtFontSize,
      this.withPadding = true,
      this.image,
      this.onlyBorder = false,
      this.btnHeight,
      this.isCentered = true,
      this.showTransparent = false, this.radius, this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: onTap!,
        child: Padding(
          padding: withPadding!
              ? const EdgeInsets.only(right: 5, left: 5)
              : EdgeInsets.zero,
          child: Container(
            height: btnHeight ?? 45,
            width: btnWidth,
            decoration: loading!?null:BoxDecoration(
              border: onlyBorder! ? Border.all(color: borderColor??txtColor!) : null,
              borderRadius: BorderRadius.circular(radius ?? 15),
              color: color ?? Colors.black,
              // gradient: onlyBorder!
              //     ? null
              //     : const LinearGradient(
              //         colors: [
              //             Styles.LOGIN_BTN_COLOR,
              //             Styles.HOME_ICONS_COLOR,
              //           ],
              //         stops: [
              //             0,
              //             4
              //           ],
              //         end: Alignment.bottomCenter,
              //         begin: Alignment.topCenter),
            ),
            child:
             loading! ? const Center(child: CircularProgressIndicator()):
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15.0),
              child: Row(
                mainAxisAlignment: isCentered?MainAxisAlignment.center:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  icon != null
                      ? Icon(
                    icon,
                    color: Colors.white,
                  )
                      : Container(),
                  image != null ? image! : Container(),
                  icon != null || image != null && text != ''
                      ?  SizedBox(width: paddingWidth ?? 14)
                      : Container(),
                  widget ?? Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: txtColor ?? Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: txtFontSize ?? 15),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
}
