import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BirthdayPickerBottomsheet extends StatefulWidget {
  const BirthdayPickerBottomsheet(this.initialDate, {super.key});
  final int initialDate;
  @override
  State<BirthdayPickerBottomsheet> createState() =>
      _BirthdayPickerBottomsheetState();
}

class _BirthdayPickerBottomsheetState extends State<BirthdayPickerBottomsheet> {
  DateTime? _selectedDate;
  @override
  initState() {
    super.initState();
    _selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.initialDate);
  }

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 375.w + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogTopBtn(),
          16.vGap,
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: DatePickerWidget(
              looping: false,
              firstDate: DateTime(1970, 1, 1),
              lastDate: DateTime.now(),
              initialDate:
                  DateTime.fromMillisecondsSinceEpoch(widget.initialDate),
              dateFormat: "yyyy/MM/dd",
              locale: DatePicker.localeFromString('en'),
              onChange: (DateTime newDate, _) {
                _selectedDate = newDate;
              },
              pickerTheme: DateTimePickerTheme(
                pickerHeight: 260.w,
                itemTextStyle: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                dividerColor: AppColors.cD2D2D2,
                dividerThickness: 1,
                diameterRatio: 5,
                dividerSpacing: 0,
                squeeze: 0.8,
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: MtInkWell(
                onTap: () {
                  final UserInfoController controller = Get.find();
                  controller.editBirthday.value =
                      _selectedDate!.millisecondsSinceEpoch;
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.w)),
                  height: 50.w,
                  alignment: Alignment.center,
                  child: Text(
                    'confirm'.toUpperCase(),
                    style: 23.w5(
                        color: Colors.white,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                )),
          ),
          30.vGap,
        ],
      ),
    ));
  }
}
