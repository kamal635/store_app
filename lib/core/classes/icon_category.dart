import 'package:flutter/material.dart';

import '../color/app_color.dart';
import 'image_assets.dart';

class AppCategoryIcon {
  final String icon;
  final String title;
  final Color colorbox;

  AppCategoryIcon(
      {required this.icon,
      required this.title,
      this.colorbox = AppColor.darkGrey});

  static List<AppCategoryIcon> categoryListIcon = [
    AppCategoryIcon(
      icon: AppAssets.smartPhone,
      title: "Phone",
    ),
    AppCategoryIcon(
      icon: AppAssets.laptops,
      title: "Laptops",
    ),
    AppCategoryIcon(
      icon: AppAssets.fragrances,
      title: "Fragrances",
    ),
    AppCategoryIcon(
      icon: AppAssets.skincare,
      title: "Skincare",
    ),
    AppCategoryIcon(
      icon: AppAssets.grocery,
      title: "Grocery",
    ),
    AppCategoryIcon(
      icon: AppAssets.houseDecoration,
      title: "House\n Decoration",
    ),
    AppCategoryIcon(
      icon: AppAssets.furnitures,
      title: "Furnitures",
    ),
    AppCategoryIcon(
      icon: AppAssets.tops,
      title: "Tops",
    ),
    AppCategoryIcon(
      icon: AppAssets.womensDresses,
      title: "Womens\n Dresses",
    ),
    AppCategoryIcon(
      icon: AppAssets.womensShoes,
      title: "Womens\n Shoes",
    ),
    AppCategoryIcon(
      icon: AppAssets.mensShirt,
      title: "Mens\n Shirt",
    ),
    AppCategoryIcon(
      icon: AppAssets.menShoes,
      title: "Men\n Shoes",
    ),
    AppCategoryIcon(
      icon: AppAssets.menWatches,
      title: "Men\n Watches",
    ),
    AppCategoryIcon(
      icon: AppAssets.womensWatches,
      title: "Womens\n Watches",
    ),
    AppCategoryIcon(
      icon: AppAssets.womensBags,
      title: "Bags",
    ),
    AppCategoryIcon(
      icon: AppAssets.womensJewellery,
      title: "Jewellery",
    ),
    AppCategoryIcon(
      icon: AppAssets.sunglasses,
      title: "Sunglasses",
    ),
    AppCategoryIcon(
      icon: AppAssets.automotive,
      title: "Automotive",
    ),
    AppCategoryIcon(
      icon: AppAssets.motorbike,
      title: "Motorbike",
    ),
    AppCategoryIcon(
      icon: AppAssets.lighting,
      title: "Lighting",
    ),
  ];
}
