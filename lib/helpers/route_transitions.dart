import 'package:flutter/material.dart';

enum AnimationType { normal, fadeIn, down2Up }

class RouteTransitions {
  //Propiedades de mi Clase

  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  //Constructor de mi Clase
  RouteTransitions({
    required this.context,
    required this.child,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      case AnimationType.down2Up:
        _slideTransitionsDown2Up();
    }
    //Navigator.push(
    //context, MaterialPageRoute(builder: ( _ ) => this.child));
  }

  //Metodo que hace una transicion Normal.
  void _normalTransition() {
    //Navigator.push(context, MaterialPageRoute(builder: (_) => this.child));

    final route = MaterialPageRoute(builder: (_) => child);
    (replacement) ? _pushReplacement(route) : _pushPage(route);
  }

  // Metodo Privado
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        //******************************************************************* */
        //BLOQUE DE PRIMERA ANIMACION DE ABAJO HACIA ARRIBA.
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
        //******************************************************************* */
      },
    );

    (replacement) ? _pushReplacement(route) : _pushPage(route);
  }

  //Metodo que realiza la animacion de Abajo hacia 
  //Arriba sobreponiendose sobre la pantalla que le antecede.
  void _slideTransitionsDown2Up() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        //******************************************************************* */
        //BLOQUE DE SEGUNDA ANIMACION DE ABAJO HACIA ARRIBA.
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
        // Fin de Segunda Animacion.
        //******************************************************************* */
      },
    );

    (replacement) ? _pushReplacement(route) : _pushPage(route);
  }

  

  void _pushPage(Route route) => Navigator.push(context, route);
  void _pushReplacement(Route route) =>
  
  //Si utizo este metdo sobre Remplazado pantallas.
  Navigator.pushReplacement(context, route);
  
  // -- 
  //Si utizo este metdo sobre pongo pantallas.
  //Navigator.push(context, route);
}
