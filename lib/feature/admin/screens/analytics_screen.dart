import 'package:ecommerce/common/widgets/loader.dart';
import 'package:ecommerce/feature/account/services/account_services.dart';
import 'package:ecommerce/feature/admin/models/sales.dart';
import 'package:ecommerce/feature/admin/services/admin_services.dart';
import 'package:ecommerce/feature/admin/widgets/category_products_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../account/widgets/account_button.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 250,
                child: CategoryProductsChart(
                  seriesList: [
                    charts.Series(
                      id: 'Sales',
                      data: earnings!,
                      domainFn: (Sales sales, _) => sales.label,
                      measureFn: (Sales sales, _) => sales.earning,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  AccountButton(
                      text: 'Log Out',
                      onTap: () => AccountServices().logOut(context)),
                ],
              )
            ],
          );
  }
}
