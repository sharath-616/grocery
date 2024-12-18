import 'package:flutter/material.dart';
import 'package:grocery/Db/product_item_class.dart';
import 'package:grocery/Utilities/customtext.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final productData = ProductItemClass();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Customtext(
                    text: 'Popular Pack',
                    clr: Colors.black,
                    fm: 'Roboto',
                    fs: 20,
                    fw: FontWeight.w400,
                    ls: 1,
                  ),
                  Customtext(
                    text: 'View All',
                    clr: Colors.green,
                    fm: 'Roboto',
                    fs: 15,
                    fw: FontWeight.w800,
                    ls: 1,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productData.productImg.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              productData.productImg[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Customtext(
                            text: productData.productName[index],
                            clr: Colors.black,
                            fm: 'Roboto',
                            fs: 16,
                            fw: FontWeight.bold,
                            ls: 1,
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                               Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Customtext(
                              text: "\$${productData.ProductPrice[index].toStringAsFixed(2)}",
                              clr: Colors.black,
                              fm: 'Roboto',
                              fs: 14,
                              fw: FontWeight.bold,
                              ls: 1,
                            ),
                          ),
                      
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                          )
                        ],
                      ),
                    ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
