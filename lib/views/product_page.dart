import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryonemore/provider/providers.dart';

class ProductPage extends ConsumerWidget{
  final int cateId;
  const ProductPage({super.key, required this.cateId});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(Providers.productByCateProvider(cateId));
    return Scaffold(
      appBar: AppBar(title: Text('Products'),),
      body: state.when(
          data: (data) {
            print(data[0].id);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: data.length,
                itemBuilder: (context,index){
                  final product = data[index];
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.network(product.images[0],fit: BoxFit.cover,),
                          ),
                        ),
                        Text(product.title)
                      ],
                    ),
                  );
                });
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
