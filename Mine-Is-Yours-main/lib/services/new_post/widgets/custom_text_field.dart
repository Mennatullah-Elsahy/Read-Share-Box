import 'package:flutter/material.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/helpers/media_query_helper.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.onChange,
    this.onValidate,
    this.hasError = false,
    this.initText,
    this.type = TextInputType.text,
    this.hide = false,
    this.suffixIcon
  }) : super(key: key);
  final String hint;
  final String? Function(String?)? onValidate;
  final void Function(String)? onChange;
  final String? initText;
  final bool hasError;
  final Widget? suffixIcon;
  final bool hide;
  final TextInputType type ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQueryHelper.width,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      
      child: TextFormField(
        maxLines: 1,
        minLines: null,
        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18), 
        validator: onValidate,
        onChanged: onChange,
        initialValue: initText,
        keyboardType: type,
        obscureText: suffixIcon != null ? !hide : false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          
          enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1,
                    color: hasError? AppColor.REJECTED:Colors.grey,
                  ),
                ),
          focusedBorder: hasError
              ? const OutlineInputBorder(borderSide: BorderSide.none)
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),errorBorder: hasError? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColor.REJECTED,
                  ),
                ):null,
        ),
      ),
    );
  }
}
