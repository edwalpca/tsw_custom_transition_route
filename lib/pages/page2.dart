import 'package:flutter/material.dart';
import 'package:tsw_custom_transition_route/helpers/route_transitions.dart';
import 'package:tsw_custom_transition_route/pages/page3.dart';

class PageDos extends StatelessWidget {
  const PageDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2 '),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Estoy en la Pagina #2'),
           SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                //Paquete de Navegacion creado por Mi
                RouteTransitions(
                  context: context,
                  child: PageTres(),
                  animation: AnimationType.fadeIn,
                  duration: Duration(milliseconds: 1200),
                  replacement: true,
                );
              },
              child: Text('Ir a Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}
