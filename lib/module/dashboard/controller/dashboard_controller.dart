import 'package:flutter/material.dart';
import 'package:slicing2/state_util.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  var scaffoldeKey = GlobalKey<ScaffoldState>();
  int selectedCategoryIndex = 0;
  updateIndex(int newIndex) {
    selectedCategoryIndex = newIndex;
    setState(() {});
  }

//buatlah sebuah List<Map> berisi kategori produk pada parfume, isi dengan 10 contoh data
  List<Map<String, dynamic>> categories = [
    {
      'category_name': 'Citrus',
      'description':
          'Citrus-based fragrances are light, refreshing, and often have a zesty, tart aroma.'
    },
    {
      'category_name': 'Floral',
      'description':
          'Floral fragrances are the most popular type of perfume. They are often described as romantic, feminine, and soft.'
    },
    {
      'category_name': 'Woody',
      'description':
          'Woody fragrances are warm, earthy, and often have a smoky or spicy aroma.'
    },
    {
      'category_name': 'Oriental',
      'description':
          'Oriental fragrances are often described as exotic, mysterious, and sensual.'
    },
    {
      'category_name': 'Fruity',
      'description':
          'Fruity fragrances are sweet, light, and often have a fresh, juicy aroma.'
    },
    {
      'category_name': 'Green',
      'description':
          'Green fragrances are often described as fresh, clean, and natural.'
    },
    {
      'category_name': 'Aquatic',
      'description':
          'Aquatic fragrances are often described as fresh, light, and airy.'
    },
    {
      'category_name': 'Gourmand',
      'description':
          'Gourmand fragrances are often described as sweet, edible, and indulgent.'
    },
    {
      'category_name': 'Spicy',
      'description':
          'Spicy fragrances are often described as warm, exotic, and sensual.'
    },
    {
      'category_name': 'Chypre',
      'description':
          'Chypre fragrances are often described as earthy, mossy, and woody.'
    },
  ];

//buatlah sebuah List<Map> Products, berisi 10 product perfume dengan data id, product_name, photo, dan price
  List<Map> products = [
    {
      'id': 1,
      'product_name': 'Lacoste Pour Femme',
      'photo':
          'https://images.unsplash.com/photo-1523293182086-7651a899d37f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      'price': 'Rp. 500.000'
    },
    {
      'id': 2,
      'product_name': 'Chanel Coco Mademoiselle',
      'photo':
          'https://images.unsplash.com/photo-1592945403244-b3fbafd7f539?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=553&q=80',
      'price': 'Rp. 1.000.000'
    },
    {
      'id': 3,
      'product_name': 'Dior Jadore',
      'photo':
          'https://images.unsplash.com/photo-1595425959632-34f2822322ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=798&q=80',
      'price': 'Rp. 1.500.000'
    },
    {
      'id': 4,
      'product_name': 'Gucci Bloom',
      'photo':
          'https://images.unsplash.com/photo-1594035910387-fea47794261f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      'price': 'Rp. 2.000.000'
    },
    {
      'id': 5,
      'product_name': 'Calvin Klein Euphoria',
      'photo':
          'https://images.unsplash.com/photo-1620848616916-3efaf499adcb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',
      'price': 'Rp. 2.500.000'
    },
    {
      'id': 6,
      'product_name': 'Givenchy Very Irresistible',
      'photo':
          'https://images.unsplash.com/photo-1591375372226-3531cf2eb6d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      'price': 'Rp. 3.000.000'
    },
    {
      'id': 7,
      'product_name': 'Versace Bright Crystal',
      'photo':
          'https://images.unsplash.com/photo-1678266168507-69535e3138ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
      'price': 'Rp. 3.500.000'
    },
    {
      'id': 8,
      'product_name': 'Yves Saint Laurent Black Opium',
      'photo':
          'https://images.unsplash.com/photo-1600612156191-12fedf6117f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
      'price': 'Rp. 4.000.000'
    },
    {
      'id': 9,
      'product_name': 'Tom Ford Black Orchid',
      'photo':
          'https://images.unsplash.com/photo-1642698215110-87817f1fbe0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      'price': 'Rp. 4.500.000'
    },
    {
      'id': 10,
      'product_name': 'Marc Jacobs Daisy',
      'photo':
          'https://images.unsplash.com/photo-1602055286793-da371c55e332?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      'price': 'Rp. 5.000.000'
    },
  ];
}
