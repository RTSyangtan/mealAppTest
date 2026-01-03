import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryonemore/provider/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(Providers.categoryProvider);
    return Scaffold(
      body: state.when(
          data: (data){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context,index){
                  final category = data[index];
                  return Container(
                    child: Column(
                      children: [
                        Image.network(category.image),
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
