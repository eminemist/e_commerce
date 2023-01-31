import 'package:ecommerce/common/widgets/loader.dart';
import 'package:ecommerce/feature/home/services/home_services.dart';
import 'package:ecommerce/feature/product_details/screens/product_details_screen.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeservices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeservices.fetchDealOfDay(
      context: context,
    );
    setState(() {});
  }

  void navigateToDetailsScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailsScreen,
                child: Column(
                  children: [
                    //PRODUCT IMAGE
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: const Text(
                        'Deal of the day',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    //PRODUCT PRICE
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        product!.price.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //PRODUCT DETAILS
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: Text(
                        product!.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: product!.images
                              .map(
                                (e) => Image.network(
                                  e,
                                  fit: BoxFit.fitWidth,
                                  width: 100,
                                  height: 100,
                                ),
                              )
                              .toList()),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(
                        left: 15,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}
