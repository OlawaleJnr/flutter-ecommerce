import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/custom_input_field_floating_label.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminAddProductPage extends ConsumerStatefulWidget {
  const AdminAddProductPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminAddProductPageState();
}
class _AdminAddProductPageState extends ConsumerState<AdminAddProductPage> {
  final nameEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();
  final priceEditingController = TextEditingController();

  _addProduct() async {
    final storage = ref.read(databaseProvider);
    if (storage == null) {
      return;
    }
    await storage.addProduct(Product(
      name: nameEditingController.text, 
      description: descriptionEditingController.text, 
      price: double.parse(priceEditingController.text), 
      imageUrl: 'Image',
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomInputFieldFloatingLabel(
              inputController: nameEditingController,
              hintText: 'Product Name', 
              label: 'Product Name',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomInputFieldFloatingLabel(
              inputController: descriptionEditingController,
              hintText: 'Product Description', 
              label: 'Product Description',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomInputFieldFloatingLabel(
              inputController: priceEditingController,
              hintText: 'Price', 
              label: 'Price',
            ),
            const Spacer(),
            GradientButton(
              text: 'Add Product', 
              onPressed: () => _addProduct(),
            ),
          ],
        ),
      ),
    );
  }
}