import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final TextStyle labelStyle;
  final TextStyle titleStyle;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String labelText;
  final String title;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final bool hasTitle;
  final bool hasTitleIcon;
  final Widget titleIcon;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final double width;
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry textFormFieldMargin;
  final int maxlines;
  final TextEditingController controller;

  CustomTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.labelStyle,
    this.titleStyle,
    this.titleIcon,
    this.hasTitleIcon = false,
    this.title,
    this.contentPadding,
    this.textFormFieldMargin,
    this.hasTitle = false,
    this.border = Borders.primaryInputBorder,
    this.focusedBorder = Borders.focusedBorder,
    this.enabledBorder = Borders.enabledBorder,
    this.hintText,
    this.labelText,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.obscured = false,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.width,
    this.height,
    this.maxlines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            hasTitleIcon ? titleIcon : Container(),
            hasTitle ? Text(title, style: titleStyle) : Container(),
          ],
        ),
//        hasTitle ? SpaceH4() : Container(),
        Container(
          width: width,
          height: height,
          margin: textFormFieldMargin,
          child: TextFormField(
            style: textStyle,
            cursorColor: AppColors.buttonShade1,
            keyboardType: textInputType,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxlines,
            inputFormatters: inputFormatters,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF1F1F1),
              contentPadding: contentPadding,
              labelText: labelText,
              labelStyle: labelStyle,
              border: border,
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              prefixIcon: hasPrefixIcon ? prefixIcon : null,
              suffixIcon: hasSuffixIcon ? suffixIcon : null,
              hintText: hintText,
              hintStyle: hintTextStyle,
            ),
            obscureText: obscured,
          ),
        ),
      ],
    );
  }
}