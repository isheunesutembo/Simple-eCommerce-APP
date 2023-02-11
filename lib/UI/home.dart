import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productapp/data/fakedata.dart';
import 'package:productapp/models/productsorttype.dart';
import 'package:productapp/providers/providers.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsProvider = ref.watch(futureProductsProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          actions: [
            DropdownButton<ProductSortType>(
              dropdownColor: Colors.orange,
              value: ref.watch(productSortTypeProvider),
              items: const [
                DropdownMenuItem(
                    value: ProductSortType.name,
                    child: Icon(Icons.sort_by_alpha)),
                DropdownMenuItem(
                    value: ProductSortType.price, child: Icon(Icons.sort))
              ],
              onChanged: (value) =>
                  ref.watch(productSortTypeProvider.notifier).state = value!,
            )
          ],
        ),
        body: productsProvider.when(
            data: (products) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 3),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: FakeData.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                FakeData.products[index].image,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                FakeData.products[index].name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "\$${FakeData.products[index].price}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            error: (error, stackTrace) => Text("Error $error"),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                )));
  }
}
