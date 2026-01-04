import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryonemore/provider/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(Providers.categoryProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Categories')),),
      body: state.when(
          data: (data){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: data.length,
                itemBuilder: (context,index){
                  final category = data[index];
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: Image.network(category.image,fit: BoxFit.cover,),
                          ),
                        ),
                        Text(category.name)
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
