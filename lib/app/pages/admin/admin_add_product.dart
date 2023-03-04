import 'dart:io';
import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/custom_input_field_floating_label.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AdminAddProductPage extends ConsumerStatefulWidget {
  const AdminAddProductPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminAddProductPageState();
}

// Create an image provider with riverpod
final addImageProvider = StateProvider<XFile?>((_) => null);

class _AdminAddProductPageState extends ConsumerState<AdminAddProductPage> {
  final nameEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();
  final priceEditingController = TextEditingController();

  _addProduct() async {
    final databaseStorage = ref.read(databaseProvider); // reference database storage
    final fileStorage = ref.read(storageProvider); // reference file storage
    final imageFile = ref.read(addImageProvider.state).state; // reference the image file

    // make sure none of them are null
    if (databaseStorage == null || fileStorage == null || imageFile == null) { 
      // ignore: avoid_print
      print("Error: databaseStorage, fileStorage or imageFile is null");
      return;
    }

    // Upload to FileStorage
    final imageUrl = await fileStorage.uploadFile(imageFile.path);

    await databaseStorage.addProduct(Product(
      name: nameEditingController.text, 
      description: descriptionEditingController.text, 
      price: double.parse(priceEditingController.text), 
      imageUrl: imageUrl,
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
        child: SingleChildScrollView(
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
              const SizedBox(
                height: 15,
              ),
              Consumer(
                builder: (context, watch, child) {
                  final image = ref.watch(addImageProvider);
                  return image == null ? const Text('No image selected') : Image.file(
                    File(image.path),
                    height: 200,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Choose an image from your gallery'),
                  ElevatedButton(
                    onPressed: () async {
                      final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        ref.watch(addImageProvider.state).state = image;
                      }
                    }, 
                    child: const Text('Upload Image'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GradientButton(
                text: 'Add Product', 
                onPressed: () => _addProduct(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}