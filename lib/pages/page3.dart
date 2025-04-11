import 'package:flutter/material.dart';
import 'package:tsw_custom_transition_route/helpers/route_transitions.dart';
import 'package:tsw_custom_transition_route/pages/page1.dart';

class PageTres extends StatelessWidget {
  const PageTres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoy en Page 3'),
        //backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Estoy en la Pagina #3',style: TextStyle(fontSize: 24),),
            SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                //Paquete de Navegacion creado por Mi
                RouteTransitions(
                  context: context,
                  child: PageUno(),
                  animation: AnimationType.normal,
                  duration: Duration(milliseconds: 1200),
                  replacement: true,
                );
              },
              child: Text('Ir a Page 1'),
            ),
          ],
        ),
      ),
    );
  }
}
