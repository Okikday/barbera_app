import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/utils/device_utils.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String? hint;
  final String? label;
  final double pixelHeight;
  final double pixelWidth;
  final double? height;
  final double? width;
  final bool? addSuffixIcon;
  final String? defaultText;
  final void Function()? ontap;
  final Function(String text)? onchanged;
  final TextInputType? keyboardType;
  final Icon? icon;
  final void Function()? onIconPressed;
  final bool textVisible;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const CustomTextfield({
    super.key,
    this.hint,
    this.label,
    this.height,
    this.width,
    this.addSuffixIcon = false,
    this.defaultText = "",
    this.ontap,
    this.onchanged,
    this.keyboardType,
    this.icon,
    this.onIconPressed,
    this.pixelHeight = 48,
    this.pixelWidth = 100,
    this.textVisible = false,
    this.hintStyle,
    this.labelStyle,

  });

  @override
  State<CustomTextfield> createState() => _TextField1State();
}

class _TextField1State extends State<CustomTextfield> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  String? text;
  bool checkForSuffixIcon = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(refreshSuffixIconState);
    controller.addListener(refreshSuffixIconState);
    controller.text = widget.defaultText ?? "";
  }

  @override
  void dispose() {
    focusNode.removeListener(refreshSuffixIconState);
    controller.removeListener(refreshSuffixIconState);
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }


  void refreshSuffixIconState() {
    setState(() {
      widget.addSuffixIcon == true && focusNode.hasFocus && controller.text.isNotEmpty 
       ? checkForSuffixIcon = true : checkForSuffixIcon = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: widget.width != null ? DeviceUtils.getScreenWidth(context) * (widget.width! / 100) : widget.pixelWidth,
      height: widget.height != null ? DeviceUtils.getScreenHeight(context) * (widget.height! / 100) : widget.pixelHeight,
      child: TextFormField(
        obscureText: (widget.keyboardType == TextInputType.visiblePassword && widget.textVisible == false) ? true : false,
        keyboardType: widget.keyboardType,
        controller: controller,
        focusNode: focusNode,
        onChanged: (text) {
          setState(() {
            text = controller.text;
            refreshSuffixIconState();
          });
         if(widget.onchanged != null){
          widget.onchanged;
         }
        },
        onTap: widget.ontap,
        onTapOutside: (t) => focusNode.unfocus(),
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          suffixIcon: checkForSuffixIcon
              ? IconButton(
            onPressed: widget.onIconPressed ?? (){},
            icon: widget.icon ?? Icon(
              Icons.clear,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
              : null,
          hintText: widget.hint,
          labelText: widget.label,
          labelStyle: widget.labelStyle ?? TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          hintStyle: widget.hintStyle ?? TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          fillColor: const Color.fromRGBO(243, 243, 243, 0.9),
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Color(0xffdddddd),
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5,
            ),
            
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: BarberaColor.goldenRod,
              width: 1.5,
            ),
          )
        ),
      ),
    );
  }
}
