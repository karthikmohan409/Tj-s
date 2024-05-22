import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/iphone_14_15_pro_max_ten_bloc.dart';
import 'models/iphone_14_15_pro_max_ten_model.dart';

class Iphone1415ProMaxTenPage extends StatefulWidget {
  const Iphone1415ProMaxTenPage({Key? key})
      : super(key: key);

  @override
  Iphone1415ProMaxTenPageState createState() => Iphone1415ProMaxTenPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1415ProMaxTenBloc>(
      create: (context) => Iphone1415ProMaxTenBloc(Iphone1415ProMaxTenState(
        iphone1415ProMaxTenModelObj: Iphone1415ProMaxTenModel(),
      ))
        ..add(Iphone1415ProMaxTenInitialEvent()),
      child: Iphone1415ProMaxTenPage(),
    );
  }
}

class Iphone1415ProMaxTenPageState extends State<Iphone1415ProMaxTenPage>
    with AutomaticKeepAliveClientMixin<Iphone1415ProMaxTenPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [SizedBox(height: 10.v), _buildColumnbadminton(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnbadminton(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomElevatedButton(
                  height: 43.v,
                  width: 129.h,
                  text: "lbl_badminton".tr,
                  buttonStyle: CustomButtonStyles.fillBlack,
                  buttonTextStyle: theme.textTheme.titleMedium!,
                ),
                text: "lbl_badminton".tr,
                buttonStyle: CustomButtonStyles.fillBlack,
                buttonTextStyle: theme.textTheme.titleMedium!,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.h, top: 10.v, bottom: 11.v),
                child: Text(
                  "lbl_table_tennis".tr,
                  style: CustomTextStyles.titleMediumBlack90001,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14.v),
        Divider(
          color: appTheme.black90001.withOpacity(0.2),
        ),
        SizedBox(height: 14.v),
        Text(
          "lbl_february".tr,
          style: CustomTextStyles.titleMediumBlack90001Bold_1,
        ),
        SizedBox(height: 3.v),
        BlocBuilder<Iphone1415ProMaxTenBloc, Iphone1415ProMaxTenState>(
          builder: (context, state) {
            return SizedBox(
              height: 77.v,
              child: EasyDateTimeLine(
                initialDate: state.selectedDatesFromCalendar ?? DateTime.now(),
                locale: 'en_US',
                headerProps: EasyHeaderProps(
                  selectedDateFormat: SelectedDateFormat.fullDateDMY,
                  monthPickerType: MonthPickerType.switcher,
                  showHeader: false,
                ),
                dayProps: EasyDayProps(
                  width: 49.h,
                  height: 77.v,
                ),
                onDateChange: (selectedDate) {
                  state.selectedDatesFromCalendar = selectedDate;
                },
                itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                    isSelected) {
                  return isSelected
                      ? Container(
                          width: 49.h,
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(
                              14.h,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text(
                                  dayName.toString(),
                                  style: CustomTextStyles.titleMediumBlack90001
                                      .copyWith(
                                    color: appTheme.black90001,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 6.v),
                                child: Text(
                                  dayNumber.toString(),
                                  style: CustomTextStyles.bodyLargeBlack90001_4
                                      .copyWith(
                                    color: appTheme.black90001,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 49.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayName.toString(),
                                style: CustomTextStyles.titleMediumBlack90001
                                    .copyWith(
                                  color: appTheme.black90001,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 6.v),
                                child: Text(
                                  dayNumber.toString(),
                                  style: CustomTextStyles.bodyLargeBlack90001
                                      .copyWith(
                                    color: appTheme.black90001.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

