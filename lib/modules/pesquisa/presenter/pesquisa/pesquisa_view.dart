import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/modules/pesquisa/presenter/pesquisa/pesquisa_bloc.dart';
import 'package:flutter_clean_arch/modules/pesquisa/presenter/pesquisa/states/state.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PesquisaView extends StatefulWidget {
  @override
  _PesquisaViewState createState() => _PesquisaViewState();
}

class _PesquisaViewState extends State<PesquisaView> {
  final bloc = Modular.get<PesquisaBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesquisa Github")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pesquisar",
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<Object>(
              stream: bloc,
              builder: (context, snapshot) {
                final state = bloc.state;

                if (state is PesquisaInicia) {
                  return Center(child: Text("Digite um texto"));
                }

                if (state is PesquisaErro) {
                  return Center(child: Text("Ops! Algo deu errado"));
                }

                if (state is PesquisaCarregando) {
                  return Center(child: CircularProgressIndicator());
                }

                final listaResultados = (state as PesquisaSucesso).list;

                return ListView.builder(
                  itemCount: listaResultados?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = listaResultados[index];

                    return ListTile(
                      leading: item.imagem == null ? SizedBox.shrink() : CircleAvatar(backgroundImage: NetworkImage(item.imagem)),
                      title: Text(item.apelido ?? ""),
                      subtitle: Text(item.id ?? ""),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
