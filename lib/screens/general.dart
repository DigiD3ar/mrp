import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class General extends StatefulWidget {
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int index = 0;
  List<Widget> screens = [Historial(),Peticiones(),Profile()];

  void _onItemTapped(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            title: Text('Solicitudes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            title: Text('Historial'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Perfil'),
          ),
        ],
        currentIndex: this.index,
        fixedColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

//pantalla de perfil

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Container(
        child: Column(
          children: [
            Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: Header("hero", [
                  "https://i.pinimg.com/originals/c6/cf/b2/c6cfb2a022d7efbc99880f45986286bf.jpg"
                ])),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Content(),
            ),
          ],
        ),
      ),
    ]);
  }
}

class Header extends StatelessWidget {
  final tipo;
  final data;

  Header(this.tipo, this.data);

  @override
  Widget build(BuildContext context) {
    return (this.tipo == "hero")
        ? DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(this.data[0]), fit: BoxFit.cover)),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
        child: Text(
          "Proveedor",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
    )
        : CarouselSlider(
      viewportFraction: 1.0,
      height: 420,
      items: this.data.map<Widget>((i) {
        print(i);
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: 1000.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(i),
                      fit: BoxFit.cover,
                    )),
                child: new Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 5.0),
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'text ',
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    )));
          },
        );
      }).toList(),
    );
  }
}

class Content extends StatelessWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.034129, -89.600022),
    zoom: 15,
  );

  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Juan Solis Castillo",
                  style: TextStyle(fontSize: 32.0),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.place),
                    Text("Homún, Yucatán", style: TextStyle(fontSize: 14.0)),
                  ],
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Servicios",style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: <Widget>[Text("·"),Text("Cenotes de Homún",style:TextStyle(fontSize: 18.0,),)],),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: <Widget>[Text("·"),Text("Paseo en Lancha Ría",style:TextStyle(fontSize: 18.0,))],),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: <Widget>[Text("·"),Text("Buceo en Cenotes",style:TextStyle(fontSize: 18.0,))],),
        ),
        Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                    child: Text(
                      "Ubicacoin : Calle 9 #000 x 22 y 22. Homún Centro, Yucatán",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                )
              ],
            ),
        ButtonTheme(
          minWidth: 300.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () => Navigator.pop(context),
            color: Theme.of(context).accentColor,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Text('Log off',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}

//catalogo

class Historial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.00),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Mis Solicitudes",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Tarjeta("solicitudes", [
                      {
                        'idNumber': "#G224412",
                        'titulo':"Cenotes de Homún",
                        'fecha':"8 Julio",
                        'status':"Esperando confirmacion"
                      },
                      {
                        'idNumber': "#G224412",
                        'titulo':"Cenotes de Homún",
                        'fecha':"8 Julio",
                        'status':"Esperando confirmacion"
                      },
                      {
                        'idNumber': "#G224412",
                        'titulo':"Cenotes de Homún",
                        'fecha':"8 Julio",
                        'status':"Esperando confirmacion"
                      }
                    ])),
              ],
            )));
  }
}

class Peticiones extends StatefulWidget {
  @override
  PeticionesState createState() => PeticionesState();

}

class PeticionesState extends State<Peticiones>{


   int tipo = 0;

   void changetype(valor){
     setState(() {
       this.tipo = valor;
     });
   }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.00),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Historial",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(child: Text("Confirmados", style: TextStyle(color: (this.tipo == 0)?  Color.fromARGB(255,220,86,73): Colors.grey , fontSize: 24, fontWeight: FontWeight.w800,),),onTap:()=>changetype(0),),
                      GestureDetector(child: Text("Cancelados", style: TextStyle(color: (this.tipo == 1)?  Color.fromARGB(255,220,86,73): Colors.grey, fontSize: 24, fontWeight: FontWeight.w800,),),onTap: ()=>changetype(1),),

                    ],
                  ),
                ),
                Expanded(
                    child: (this.tipo == 0)? Tarjeta("historial", [{'idNumber': "#G224412", 'titulo':"Cenotes de Homún", 'fecha':"8 Julio", 'status':"Confirmado"}, {'idNumber': "#G224412", 'titulo':"Cenotes de Homún", 'fecha':"8 Julio", 'status':"confirmado"}])
                :
                    Tarjeta("historial", [{ 'idNumber': "#G224412",'titulo':"Cenotes de Homún",'fecha':"8 Julio",'status':"Cancelado"}],),
                )],
            )));
  }
}


class Tarjeta extends StatelessWidget {
  final tipo;
  final datos;

  Tarjeta(this.tipo, this.datos);



  Widget TarjetSolicitud(data){
    return  Card(
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0,),
                      child: Text(data['idNumber'], style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: Text(data['titulo'], style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 9.0),
                      child: Text(data['fecha'], style: TextStyle(fontSize: 11,color:  Color.fromARGB(255,220,86,73),))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      decoration:BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(35.0))),
                      padding: EdgeInsets.only(top:6.0, bottom: 6.0,left: 6.0,right:6.0),
                      child: Text(data['status'], style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        margin: EdgeInsets.all(10),
      );
  }

  Widget TarjetHistorial(data){
    if(data['status'] == "Cancelado") {
      return Card(
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0,),
                      child: Text(data['idNumber'], style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold)
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: Text(data['titulo'], style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 9.0),
                      child: Text(data['fecha'], style: TextStyle(fontSize: 11,
                        color: Color.fromARGB(255, 220, 86, 73),))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.all(
                              Radius.circular(35.0))),
                      padding: EdgeInsets.only(
                          top: 6.0, bottom: 6.0, left: 6.0, right: 6.0),
                      child: Text(data['status'],
                          style: TextStyle(fontSize: 18, color: Colors.white)
                      )),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        margin: EdgeInsets.all(10),
      );
    }else{
      return Card(
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0,),
                      child: Text(data['idNumber'], style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold)
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: Text(data['titulo'], style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold))),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 3.0),
                          child: Icon(
                            Icons.chat,
                            color:  Color.fromARGB(255,220,86,73),
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 3.0),
                        child: Text(
                          "Chat",
                          style: TextStyle(
                            fontSize: 18,
                            color:  Color.fromARGB(255,220,86,73),
                          ),
                        ),
                      )
                    ],
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(color: Color.fromARGB(255,220,86,73),
                          borderRadius: BorderRadius.all(
                              Radius.circular(35.0))),
                      padding: EdgeInsets.only(
                          top: 6.0, bottom: 6.0, left: 6.0, right: 6.0),
                      child: Text(data['status'],
                          style: TextStyle(fontSize: 18, color: Colors.white)
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 3.0, bottom: 9.0),
                      child: Text(data['fecha'], style: TextStyle(fontSize: 11,
                        color: Color.fromARGB(255, 220, 86, 73),))),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        margin: EdgeInsets.all(10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        if (this.tipo == "solicitudes") {
          return InkWell(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceForm()),),child: TarjetSolicitud(this.datos[position]));
        } else if (this.tipo == "historial") {
          return TarjetHistorial(this.datos[position]);
        }
      },
      itemCount: this.datos.length,
    );
  }
}

// categoria

class categoria extends StatelessWidget {
  final datos = [
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://vanguardia.com.mx/sites/default/files/styles/paragraph_image_large_desktop_1x/public/d04_01_cenote_ik_kilent_id235778.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://blog.seccionamarilla.com.mx/wp-content/uploads/2018/10/cenotes-en-Valladolid-770x578.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://vanguardia.com.mx/sites/default/files/styles/paragraph_image_large_desktop_1x/public/d04_01_cenote_ik_kilent_id235778.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://blog.seccionamarilla.com.mx/wp-content/uploads/2018/10/cenotes-en-Valladolid-770x578.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://vanguardia.com.mx/sites/default/files/styles/paragraph_image_large_desktop_1x/public/d04_01_cenote_ik_kilent_id235778.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
    {
      'titulo': "Cenote",
      'lugar': "Homún, Yucatán",
      'cantidad': "22",
      'precio_menores': '43.0',
      'precio_mayores': '45.0',
      'url':
      "https://blog.seccionamarilla.com.mx/wp-content/uploads/2018/10/cenotes-en-Valladolid-770x578.jpg",
      'descripcion':
      "The sacred cenote is located north of the pyramid of Kukulcan in the archaeological zone of Chichen Itza, 60 meters in diameter"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: this.datos.length,
        itemBuilder: (context, position) {
          if (position > 0)
            return Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Card(
                semanticContainer: false,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Servicio()),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(0.0),
                        padding: EdgeInsets.all(0.0),
                        width: MediaQuery.of(context).size.width,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  NetworkImage(this.datos[position]['url']),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  this.datos[position]['cantidad'] +
                                      " Services Provided",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  this.datos[position]['titulo'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 15.0),
                                child: Text(
                                  this.datos[position]['lugar'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                          this.datos[position]
                                          ['precio_mayores'] +
                                              " USD",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Theme.of(context)
                                                  .accentColor)),
                                      Text("Per Adult",
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                          this.datos[position]
                                          ['precio_menores'] +
                                              " USD",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Theme.of(context)
                                                  .accentColor)),
                                      Text("Per Child",
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
                                child: Text(
                                  this.datos[position]['descripcion'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
                margin: EdgeInsets.all(10),
              ),
            );
          else
            return Column(
              children: <Widget>[
                Container(
                  height: 280,
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  width: MediaQuery.of(context).size.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.nauticalnewstoday.com/wp-content/uploads/2016/12/Cenote-Mexicano-1.jpg"),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 22.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                size: 33,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 22.0),
                          child: Text(
                            "Cenote",
                            style:
                            TextStyle(color: Colors.white, fontSize: 22.0,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 16.0),
                  child: Card(
                    semanticContainer: false,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Servicio()),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            margin: EdgeInsets.all(0.0),
                            padding: EdgeInsets.all(0.0),
                            width: MediaQuery.of(context).size.width,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          this.datos[position]['url']),
                                      fit: BoxFit.cover)),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      this.datos[position]['cantidad'] +
                                          " Services Provided",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 2.0, 0.0, 0.0),
                                    child: Text(
                                      this.datos[position]['titulo'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 0.0, 0.0, 15.0),
                                    child: Text(
                                      this.datos[position]['lugar'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 6.0, bottom: 6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                              this.datos[position]
                                              ['precio_mayores'] +
                                                  " USD",
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  color: Theme.of(context)
                                                      .accentColor)),
                                          Text("Per Adult",
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                              this.datos[position]
                                              ['precio_menores'] +
                                                  " USD",
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  color: Theme.of(context)
                                                      .accentColor)),
                                          Text("Per Child",
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin:
                                    EdgeInsets.only(top: 3.0, bottom: 3.0),
                                    child: Text(
                                      this.datos[position]['descripcion'],
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.all(10),
                  ),
                )
              ],
            );
        },
      ),
    );
  }
}

class WavyHeaderImage extends StatelessWidget {
  final img;

  WavyHeaderImage(this.img);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ClipPath(
            child: Stack(children: [
              Image.network(this.img, fit: BoxFit.cover),
              Container(
                height: 280,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "lol",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "lol",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ]),
            clipper: BottomWaveClipper(),
          ),
        ),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(0, size.height - 10.0);
    var firstEndPoint = Offset(10, size.height - 10.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width - 10, size.height - 10);
    var secondControlPoint = Offset(size.width, size.height - 10);

    var secondEndPoint = Offset(size.width, size.height);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//detalle

class Servicio extends StatelessWidget {
  final data = [
    "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
    "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
    "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
  ];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.034129, -89.600022),
    zoom: 15,
  );

  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(0.0),
              width: MediaQuery.of(context).size.width,
              child: CarouselWithIndicator(context),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 15.0),
                        child: Text("Duration 2 hrs",
                            style: TextStyle(fontSize: 20.0)))
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "45.0 USD",
                            style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                          ),
                          Text("Per adult", style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("45.0 USD",
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor)),
                          Text("Per child", style: TextStyle(fontSize: 16.0))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            "About the location",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 2.0),
                          child: Text(
                              "The cenotes of the municipality of Homún are among the most beautiful in the Yucatan Peninsula and can be reached by taking a truck. They are natural underground beauty of crystalline waters, where you can explore and have the opportunity to swim or snorkel, if you are intrepid and you like adrenaline. Homún is famous in the region for its cenotes and its peculiar way … read more",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            "The intenerary",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 2.0),
                          child: Text(
                              "Our great adventure will begin at 9:00 in the morning, walking along paths surrounded by nature until we reach the cenotes, which have excellent conditions of visibility and transparency as well as a wonderful blue color.You can visit rock formations such as stalactites and stalagmites; Of course, the ancient henequen plantations … read more",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            "Location:",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 2.0),
                          child: Text(
                              "Homún, Calle 9 #000 x 22 y 22. Centro, Homún, Yucatán.",
                              style: TextStyle(fontSize: 22.0)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 75.0),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              height: 200.0,
              child: GoogleMap(
                  markers: Set.from([
                    Marker(
                        markerId: MarkerId('value2'),
                        position: LatLng(21.034129, -89.600022))
                  ]),
                  initialCameraPosition: _kGooglePlex),
            ),
          ],
        ),
      ]),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonTheme(
            minWidth: 300.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceForm()),
              ),
              color: Theme.of(context).accentColor,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text('Send Request',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//carusel con indicadores

class CarouselWithIndicator extends StatefulWidget {
  final c;

  CarouselWithIndicator(this.c);

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState(c);
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  final space;

  _CarouselWithIndicatorState(this.space);

  final List imgList = [
    "https://s27957.pcdn.co/wp-content/uploads/2018/04/best-cenotes-near-valladolid.jpg",
    "https://www.elcaminomascorto.es/wp-content/uploads/09A7394.jpg",
    "https://foodandtravel.mx/wp-content/uploads/2017/05/Gran-Cenote.jpg"
  ];

  final List child = [
    "https://s27957.pcdn.co/wp-content/uploads/2018/04/best-cenotes-near-valladolid.jpg",
    "https://www.elcaminomascorto.es/wp-content/uploads/09A7394.jpg",
    "https://foodandtravel.mx/wp-content/uploads/2017/05/Gran-Cenote.jpg"
  ]
      .asMap()
      .map((i, x) => MapEntry(
    i,
    Stack(children: <Widget>[
      Image.network(
        x,
        fit: BoxFit.cover,
      ),
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(200, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
    ]),
  ))
      .values
      .toList();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: CarouselSlider(
          items: child,
          autoPlay: true,
          height: 300,
          aspectRatio: 1.5,
          viewportFraction: 1.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
      Positioned(
        bottom: 35.0,
        child: Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 1.0,style: BorderStyle.solid)),
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: this
                    .imgList
                    .asMap()
                    .map((i, url) => MapEntry(
                    i,
                    Column(
                      children: <Widget>[
                        Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == i
                                  ? Color.fromRGBO(255, 255, 255, 1)
                                  : Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ],
                    )))
                    .values
                    .toList(),
              ),
              Text("Cenotes de Homún",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    child: Text("26 Services Provided",
                        style: TextStyle(color: Colors.white, fontSize: 14.0)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                        color: Color.fromARGB(127, 255, 255, 255)),
                    padding: EdgeInsets.all(7.0),
                    margin:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    child: Text("Homún, Yucatan",
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class ServiceForm extends StatelessWidget {
  final data = [
    "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                height: 230.0,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new NetworkImage(this.data[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Cenotes de Homún",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 5.0),
                              child: Text("26 Services Provided",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                  color: Color.fromARGB(127, 255, 255, 255)),
                              padding: EdgeInsets.all(7.0),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 5.0),
                              child: Text("Homún, Yucatan",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0)),
                            ),
                          ],
                        ),

                        //new Container()
                      ],
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 70.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 8.0,bottom: 15.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("#G224412",
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.place),
                                  Text("Mérida, Yucatán",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Date",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              margin: EdgeInsets.symmetric(),
                              child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(30.0)),
                                onPressed: () => showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now()
                                        .add(Duration(seconds: 1)),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100)),
                                color: Color.fromARGB(255, 250, 231, 229),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '8 julio',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Select Time",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold)),
                            RaisedButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(30.0)),
                              onPressed: () => showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now()),
                              color: Color.fromARGB(255, 250, 231, 229),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('08:00 am',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 22.0, horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "No. of Adults",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(6.0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 15.0),
                                    child: Text('2',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("No. of Childs",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 15.0),
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text('3',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "218.50",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 231, 229),
                            borderRadius:
                            BorderRadius.all(Radius.circular(35.0))),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Fee",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "109.25",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chat())),
                  color: Theme.of(context).accentColor,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Confirmar',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Msg(
                            "Request Send \n We will contact \n you soon",
                            "profile")),
                  ),
                  color: Colors.black,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Elegir Nuevas Fechas',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Msg extends StatelessWidget {
  final msg;
  final redirect;

  Msg(this.msg, this.redirect);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/loginbg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    this.msg,
                    style: TextStyle(
                        fontSize: 33.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
                    child: ButtonTheme(
                      minWidth: 300.0,
                      buttonColor: Color.fromARGB(255, 220, 86, 73),
                      disabledColor: Color.fromARGB(255, 220, 86, 73),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () => true,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Confirm',
                              style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class ServiceDetail extends StatelessWidget {
  final data = [
    "https://www.kayak.com.mx/news/wp-content/uploads/sites/29/2018/08/cenote_dos_ojos.jpg",
  ];

  final dates = [
    "2019-07-19 20:24:56",
    "2019-07-19 20:24:56",
    "2019-07-19 20:24:56"
  ];

  final dformat = new DateFormat('dd MMMM');
  final hformat = new DateFormat('h:m a');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 300.0,
            child: Stack(children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(this.data[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Cenotes de Homún",
                        style: TextStyle(color: Colors.white, fontSize: 26.0)),
                    //new Container()
                  ],
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Jane Doe",
                            style: TextStyle(fontSize: 29.0),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.place),
                              Text("Mérida, Yucatán",
                                  style: TextStyle(fontSize: 16.0)),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("#G224412", style: TextStyle(fontSize: 29.0)),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                            child: Text("July 4 / July 11",
                                style: TextStyle(fontSize: 16.0)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "No. of Adults : 3",
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("No. of Childs: 1",
                              style: TextStyle(fontSize: 22.0)),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 0.0),
                            child: Text(
                              "Sorry! The service is not available at that day. But here are another 3 options of calendar to choose!",
                              style: TextStyle(fontSize: 19.0),
                            ))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 1, groupValue: 1, onChanged: null),
                    Text(
                      "Option 1",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 231, 229),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            "14 august",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22.0),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 231, 229),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            " 8:00 AM",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22.0),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 2, groupValue: 1, onChanged: null),
                    Text(
                      "Option 2",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 00.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 231, 229),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            "15 august",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22.0),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 231, 229),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            " 10:00 AM",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22.0),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 3, groupValue: 1, onChanged: null),
                    Text(
                      "Option 3",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 231, 229),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            "16 august",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22.0),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 231, 229),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            " 10:00 AM",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 22.0),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("218.50 USD",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 231, 229),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Fee",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("109.25 USD",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),
                  padding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                          child: Container(
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae sem cursus, rhoncus felis nec, commodo urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean tempus sed massa vel accumsan. Etiam vel diam eu urna scelerisque aliquet ac ac velit."))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonTheme(
            minWidth: 300.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chat()),
              ),
              color: Theme.of(context).accentColor,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text('Confirm',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//chat

class Chat extends StatelessWidget {
  final data = [
    {'date': "8:00 AM", 'msg': "hi", 'id': "15"},
    {'date': "9:00 AM", 'msg': "hi", 'id': "14"},
    {'date': "9:10 AM", 'msg': "how are you?", 'id': "15"},
    {'date': "9:14 AM", 'msg': "im fine", 'id': "14"},
    {
      'date': "8:00 AM",
      'msg': "Are they childrens who doesn’t know how to swim?",
      'id': "15"
    },
    {'date': "9:00 AM", 'msg': "Hi! Yes, my younger son. He’s 4", 'id': "14"},
    {'date': "9:10 AM", 'msg': "we have life jackets", 'id': "15"},
    {'date': "9:14 AM", 'msg': "are there food stands nearby?", 'id': "14"},
    {
      'date': "8:00 AM",
      'msg':
      "There is no around the cenote, but there are restaurants in a nearby town, we can still stop for snacks along the way, if you like",
      'id': "15"
    },
    {'date': "8:00 AM", 'msg': "perfect, is the cenote very deep?", 'id': "14"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Theme.of(context).accentColor,
                        size: 30.0,
                      ),
                      onPressed: () => Navigator.pop(context)),
                  Text("#G224412",
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w800))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: this.data.length,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: (position == 0 && position == this.data.length)
                          ? EdgeInsets.symmetric(
                          vertical: 35.0, horizontal: 20.0)
                          : EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment:
                        (int.parse(this.data[position]['id']) == 15)
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Material(
                              elevation: 4.0,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0)),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 25.0),
                                  decoration:
                                  (int.parse(this.data[position]['id']) ==
                                      14)
                                      ? BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      color:
                                      Theme.of(context).accentColor)
                                      : BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      color: Colors.grey[200]),
                                  child: Text(
                                    this.data[position]['msg'] +
                                        " \n " +
                                        this.data[position]['date'],
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: (int.parse(this.data[position]
                                        ['id']) ==
                                            14)
                                            ? Colors.white
                                            : Colors.grey),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              decoration:
              BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.add), onPressed: () => true),
                  Container(
                    width: 250,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        helperText: "",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                            borderRadius: BorderRadius.all(Radius.circular(25.0))),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Theme.of(context).accentColor),
                        child: IconButton(
                            icon: Icon(Icons.send),
                            color: Colors.white,
                            onPressed: () => true)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//pago

class PayForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                            color: Theme.of(context).accentColor,
                            size: 30.0,
                          ),
                          onPressed: () => Navigator.pop(context)),
                      Text(
                          "Checkout",
                          style:  TextStyle(
                              fontSize: 28.0,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w800))
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                        margin: EdgeInsets.all(5.0),
                        child: Text(
                          "Card Number",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.grey[300]),
                            child: TextField(

                                decoration:
                                InputDecoration(hintText: "4242 4242 4242 4242", border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(width: 0.0, style: BorderStyle.none),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),)),
                          ))
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                        margin: EdgeInsets.all(5.0),
                        child: Text("Card Name",
                            style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 20)))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.grey[300]),
                            child: TextField(
                              decoration: const InputDecoration(hintText: "John Doe", border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 0.0, style: BorderStyle.none),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Expiration Date",
                              style:
                              TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                          Container(
                              margin:
                              EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                              padding:
                              EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  color: Colors.grey[300]),
                              child: Row(
                                children: <Widget>[
                                  Text("06/22",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context).accentColor)),
                                  IconButton(
                                    icon: Icon(
                                      Icons.expand_more,
                                    ),
                                    onPressed: () => true,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("CVC",
                              style:
                              TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)), color: Colors.grey[300]),
                              child: Row(
                                children: <Widget>[
                                  Text("123", style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor),)
                                ],
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 35.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Fee"),
                          Text("109.25 USD"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                          child: Container(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet elementum metus, hendrerit fringilla eros. Quisque quis gravida justo. Proin sed velit mollis, maximus mauris sit amet, vehicula odio. Nullam non orci finibus, volutpat mauris id, euismod odio.",
                                textAlign: TextAlign.center,
                              ))),
                    ],
                  ),
                ),
                /*Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Msg(
                              "Thanks for choose us! \n Be ready for \n the adventure",
                              "profile")),
                    ),
                child: Text("Pay", style: TextStyle(color: Colors.white)),
                color: Theme.of(context).accentColor,
              )
            ],
        ),
        Row(
            children: <Widget>[
              RaisedButton(

                onPressed: () => {},
                child: Text("Cancel", style: TextStyle(color: Colors.white)),
                color: Colors.black,
              )
            ],
        )*/
              ])],
          )),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          ButtonTheme(
            minWidth: 300.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Msg(
                        "Thanks for choose us! \n Be ready for \n the adventure",
                        "profile")),
              ),
              color: Theme.of(context).accentColor,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text('Pay',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
