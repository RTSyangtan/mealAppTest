import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/providers.dart';

class DetailPage extends ConsumerWidget {
  final int productId;
  const DetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(Providers.singleProductProvider(productId));
    final imgNo = ref.watch(Providers.imgeNoProvider);
    print(state);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,),
      body: state.when(
          data: (data) {
            return Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: ListView(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        data.images[imgNo],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Positioned(
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            data.images.length, (index) => InkWell(
                              onTap: () {
                                ref.read(Providers.imgeNoProvider.notifier).state = index;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: imgNo == index
                                      ? Colors.white
                                      : Colors.white54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("\$${data.price}",style: TextStyle(fontSize: 25),),
                  Text(data.title,style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10),
                  Text(data.description)
                ],
              ),
            );
          },
          error: (err,st){
            return Text('Error $err');
          },
          loading: (){
            return CircularProgressIndicator();
          }
      ),
    );
  }
}
