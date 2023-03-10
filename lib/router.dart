import 'package:ecommerce/common/widgets/bottom_bar.dart';
import 'package:ecommerce/feature/address/screens/address_screen.dart';
import 'package:ecommerce/feature/admin/screens/add_products_screen.dart';
import 'package:ecommerce/feature/auth/screens/auth_screen.dart';
import 'package:ecommerce/feature/home/screens/category_deals_screen.dart';
import 'package:ecommerce/feature/order_details/screens/order_details.dart';
import 'package:ecommerce/feature/product_details/screens/product_details_screen.dart';
import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

import 'feature/home/screens/home_screen.dart';
import 'feature/search/screens/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    case AddProductsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductsScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );

    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen Does not exist! Error 404'),
          ),
        ),
      );
  }
}
