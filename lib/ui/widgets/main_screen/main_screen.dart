import 'package:flutter/material.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:interview_test_1/domain/data.dart';
import 'package:interview_test_1/resources/resources.dart';
import 'package:interview_test_1/ui/theme/app_button_style.dart';
import 'package:interview_test_1/ui/theme/app_colors.dart';
import 'package:interview_test_1/ui/theme/app_text_styles.dart';
import 'package:intl/intl.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.ios_share),
          SizedBox(width: 16)
        ],
      ),
      body: const CustomScrollView(
        slivers: <Widget>[
          _WalletInfoWidget(),
          _WalletFiltersWidget(),
          _WalletTransactionsWidget()
        ],
      )
    );
  }
}


class _WalletInfoWidget extends StatelessWidget {
  const _WalletInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
          Container(
            height: 290,
            color: AppColors.mainBlack,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.mainWhite,
                  backgroundImage: NetworkImage(AppImages.usdAccount),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Center(
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            'USD Account',
                            style: AppTextStyle.walletNameTextStyle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 0,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Hide'),
                          style: AppButtonStyle.mainOutlinedButton,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    String.fromCharCodes(Runes('\u0024')) + '  180, 970.83',
                    style: AppTextStyle.walletBalanceTextStyle
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}


class _WalletFiltersWidget extends StatefulWidget {
  const _WalletFiltersWidget({Key? key}) : super(key: key);

  @override
  State<_WalletFiltersWidget> createState() => _WalletFiltersWidgetState();
}

class _WalletFiltersWidgetState extends State<_WalletFiltersWidget> {
  String dropdownCurrency = 'USD Dollar';
  String dropdownTransaction = 'All';
  String dropdownEmpty = 'A';

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          height: 220,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          color: AppColors.mainDarkGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transactions History',
                style: AppTextStyle.walletFilterTextStyle
              ),
              const SizedBox(height: 16),
              DecoratedBox(
                decoration: AppButtonStyle.mainBoxDecoration,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    value: dropdownCurrency,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownCurrency = newValue!;
                      });
                    },
                    isExpanded: true,
                    style: AppTextStyle.walletFilterTextStyle,
                    dropdownColor: AppColors.mainDarkGrey,
                    underline: Container(),
                    items: <String>['USD Dollar', 'RUB Rubles', 'KZT Tenge']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: DecoratedBox(
                      decoration: AppButtonStyle.mainBoxDecoration,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<String>(
                          value: dropdownTransaction,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownTransaction = newValue!;
                            });
                          },
                          isExpanded: true,
                          style: AppTextStyle.walletFilterTextStyle,
                          dropdownColor: AppColors.mainDarkGrey,
                          underline: Container(),
                          items: <String>['All', 'Incomes', 'Costs']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: DecoratedBox(
                      decoration: AppButtonStyle.mainBoxDecoration,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.mainWhite,
                        )
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}


class _WalletTransactionsWidget extends StatelessWidget {
  const _WalletTransactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverGroupedListView<dynamic, String>(
      elements: data,
      groupBy: (element) => element['date'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) =>
          item1['subject'].compareTo(item2['subject']),
      order: GroupedListOrder.ASC,
      groupSeparatorBuilder: (String value) {
        final _date = DateTime.parse(value);
        final _today = DateTime.now();
        final _yesterday = DateTime.now().subtract(const Duration(days:1));
        String? dateValue;
        if (_date.isSameDate(_today)) {
          dateValue = 'Today';
        } else if (_date.isSameDate(_yesterday)) {
          dateValue = 'Yesterday';
        } else {
          dateValue = DateFormat('EE, MMM dd').format(_date);
        }

        return Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.centerLeft,
          color: AppColors.mainGrey,
          height: 55,
          child: Text(
            dateValue,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
      itemBuilder: (BuildContext context, element) {
        final logo = element['logo'];
        List<String> valueList = [];
        element['type'] == 'cost' ? valueList.add('-') : valueList.add('+');
        valueList.add(element['value'].toString());
        var value = valueList.join(' ');
        return Card(
          shape: const RoundedRectangleBorder(),
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 2),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 90,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10.0),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.mainLightGrey,
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor: AppColors.mainWhite,
                  backgroundImage: logo != ''
                      ? NetworkImage(logo)
                      : const NetworkImage(AppImages.emptyLogo),
                ),
              ),
              title: Text(
                element['subject'],
                style: AppTextStyle.cardMainTextStyle,
              ),
              subtitle: Text(
                element['time'],
                style: AppTextStyle.cardAdditionalTextStyle,
              ),
              trailing: Text(
                value + ' USD',
                style: AppTextStyle.cardMainTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}


// Helpers
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }
}
