import 'package:flutter/material.dart';
import 'package:tsw_custom_transition_route/helpers/route_transitions.dart';
import 'package:tsw_custom_transition_route/pages/page2.dart';



class PageUno extends StatelessWidget {
  const PageUno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1 '),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.amberAccent[300],
      body: Center(
          child: MaterialButton(
              color: Colors.white,
              onPressed: () {
                //Forma Larga de Navegar
                //Navigator.push(
                //  context, MaterialPageRoute(builder: (_) => PageDos()));

                //Forma Corta de Navegar
                //Navigator.pushNamed(context, 'page2');

                // Navegacion con Animacion entre Pantallas.
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //       pageBuilder: (BuildContext context,
                //           Animation<double> animation,
                //           Animation<double> secondaryAnimation) => PageDos()),
                // );



                // 
                //
                //Paquete de Navegacion creado por Mi
                RouteTransitions(
                    context: context,
                    child: PageDos(),
                    animation: AnimationType.down2Up,
                    duration: Duration(milliseconds: 1200),
                    replacement: true
                    );
              },
              child: Text('Go to Page 2'))),
    );
  }
}
