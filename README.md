# animated_header_component

Header Animated Component

## Getting Started

Componente simples de animação

Exemplo de uso:

Crie um controller:



Crie um AnimationBuilder e passe o controller como parent e retorne o AnimatedComponent no builder:

    AnimationController controller = AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    AnimatedBuilder(
        builder: (context, child) {
            return AnimatedComponent(
            controller,
            Text("Titulo"),
            Icon(
                Icon(Icons.person),
                size: 40,
            ),
            //opcionais
            iconSize: 40.0,//para melhor desempenho, defina o mesmo valor do tamanho do icone
            color: Colors.blue, //Não use se estiver usando decoration
            padding: EdgeInsets.only(left: 16),
            //decoration:BoxDecoration()
            );
        },
        animation: controller,
        );

    Você ainda pode ajudar largura e altura definindo um Container

    Size size = MediaQuery.of(context).size;
    Container(
        height: 200,
        width: size.width,
        child: AnimatedBuilder(
            builder: (context, child) {
                return AnimatedComponent(
                controller,
                Text("Titulo"),
                Icon(
                    Icon(Icons.person),
                    size: 40,
                ),
                //opcionais
                iconSize: 40.0,//para melhor desempenho, defina o mesmo valor do tamanho do icone
                color: Colors.blue, //Não use se setar o decoration
                padding: EdgeInsets.all(4),
                //decoration:BoxDecoration()
                );
            },
            animation: controller,
            ),

    );
