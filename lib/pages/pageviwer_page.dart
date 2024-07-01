import 'package:app_imc_flutter/pages/home_page.dart';
import 'package:app_imc_flutter/pages/list_page.dart';
import 'package:app_imc_flutter/models/imc_model.dart';
import 'package:flutter/material.dart';

class PageViwerC extends StatefulWidget {
  const PageViwerC({super.key});

  @override
  State<PageViwerC> createState() => _PageViwerCState();
}

class _PageViwerCState extends State<PageViwerC> {
  int paginaAtual = 0;
  late PageController pc;
  List<ImcModel> listaImc = [];

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(int Pagina) {
    setState(() {
      paginaAtual = Pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          MyHomePage(
            title: 'Controle do IMC',
            onImcCalculated: (imcModel) {
              setState(() {
                listaImc.add(imcModel);
              });
            },
          ),
          ListPage(
            title: 'Lista de IMC', 
            lista: listaImc,
          ),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calculador de IMC'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Historico de calculo'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
