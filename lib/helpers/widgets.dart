import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_flow_admin/src/constants.dart';


textFieldTitle({title}){
  return Padding(
    padding: EdgeInsets.only(bottom: 2.sp),
    child: Row(
      children: [
        Text(title,
          style: poppinsTextFont.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),)
      ],
    ),
  );
}

class TextFieldWidget extends StatelessWidget {
  String hint;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Widget? suffix;
  TextEditingController? textController;
  String? Function(String?)? validator;
  Color? backgroundColor;
  bool? enabled;
  bool obscureText;
  double? fieldHeight;
  bool underLine;
  int? maxLine = 1;
  TextInputType? keyboardType;
  ScrollController? scrollController;
  bool? isDropDown;
  TextStyle? textStyle;
  Function()? onTap;
  List<TextInputFormatter>? inputFormatters;

  TextFieldWidget(
      {Key? key,
        required this.hint,
        this.prefixIcon,
        this.suffixIcon,
        this.suffix,
        this.obscureText = false,
        this.enabled,
        this.maxLine = 1,
        this.fieldHeight,
        this.textController,
        this.keyboardType,
        this.scrollController,
        this.backgroundColor,
        this.underLine = false,
        this.inputFormatters,
        this.validator,
        this.textStyle,
        this.isDropDown,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fieldHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
        color:  backgroundColor ?? Color(0xFFF6F6F6),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height() * 0.5,
        ),
        child: TextFormField(
          style: textStyle ?? poppinsTextFont.copyWith(
              fontSize: 9.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),
          onTap: onTap,
          maxLines: maxLine == null ? null : maxLine,
          enabled: enabled,
          scrollPhysics: ClampingScrollPhysics(),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          autocorrect: false,
          scrollController: scrollController,
          controller: textController,
          obscureText: obscureText,
          enableInteractiveSelection: true,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: underLine == true ? Color(0xFF003049) : Colors.transparent)),
            disabledBorder: InputBorder.none,
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: underLine == true ? Color(0xFF003049) : Colors.transparent)),
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 11.sp),
            hintText: hint,
            // labelText: hint,
            hintStyle: poppinsTextFont.copyWith(
              fontSize: 14.sp,
              color: Color(0xFF828282),
              fontWeight: FontWeight.w400,
            ),
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 16.sp, color: Colors.grey.shade400),
            prefixIcon: prefixIcon,
            suffix: suffix,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
