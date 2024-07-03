# Digio Store

## Índice

1. [Objetivo](#objetivo)
2. [Especificações](#especificacoes)
3. [Arquitetura](#arquitetura)
4. [Padrões](#padroes)
    - [Padrão Delegate](#padrao-delegate)
    - [Padrão Factory](#padrao-factory)
    - [Padrão Repository](#padrao-repository)
5. [Acessibilidade](#acessibilidade)
6. [Suporte a Múltiplos Idiomas](#multilinguagem)
7. [Fluxo de Trabalho com GitFlow](#gitflow)


⚠️ **Atenção**: Peço gentilmente que, por mais extenso que esse documento pareça ser, leiam as últimas sessões onde comento superficialmente alguns detalhes sobre determinadas implementações, sobretudo, no que tange à acessibilidade uma vez que realmente cuidei para que a mesma fosse implementada de forma correta proporcionando uma experiência boa ao usuário que fizer uso dessa feature. Também gostaria de salientar que, realizei as configurações solicitadas porém, não pude testar a aplicação em um device com iOS 12 por não possuir um aparelho antigo e também não dispor de espaço no meu macbook para realizar o download de versões mais antigas do xCode.

## Objetivo <a name="objetivo"></a>

O objetivo deste projeto iOS é demonstrar conceitos técnicos e melhores práticas no desenvolvimento iOS utilizando Swift 4.2 e direcionando para iOS 12.

## Especificações <a name="especificacoes"></a>

- **Versão do iOS**: iOS 12
- **Versão do Swift**: Swift 4.2

## Arquitetura <a name="arquitetura"></a>

O projeto segue uma arquitetura modularizada aplicando MVVM (Model-View-ViewModel) com ViewModel hierárquico e princípios de Clean Architecture. Esta abordagem ajuda em:
- **Modularidade**: Encapsula funcionalidades em módulos independentes para melhor manutenibilidade e reutilização.
- **Separação de Responsabilidades**: Separa claramente as camadas de acesso a dados, lógica de negócios e apresentação da interface do usuário.
- **Testabilidade**: Facilita testes unitários ao desacoplar componentes e usar injeção de dependência.

## Padrões <a name="padroes"></a>

### Padrão Delegate <a name="padrao-delegate"></a>

O Padrão Delegate é usado para facilitar a comunicação entre objetos. Permite que um objeto delegue tarefas ou responsabilidades para outro objeto. Isso é vantajoso porque:
- **Baixo Acoplamento**: Objetos podem interagir sem precisar conhecer os detalhes ou a existência um do outro, promovendo flexibilidade.
- **Princípio da Responsabilidade Única**: Ajuda a separar responsabilidades delegando tarefas específicas para objetos dedicados.

### Padrão Factory <a name="padrao-factory"></a>

O Padrão Factory é utilizado para criar objetos sem especificar a classe exata do objeto que será criado. Este padrão é vantajoso porque:
- **Encapsulamento**: Centraliza a lógica de criação de objetos, facilitando o gerenciamento e modificação.
- **Flexibilidade**: Permite a adição de novos tipos ou variantes de objetos sem alterar o código cliente existente.

### Padrão Repository <a name="padrao-repository"></a>

O Padrão Repository é utilizado para separar a lógica que recupera dados da fonte de dados subjacente (como um banco de dados ou API) do restante da aplicação. Este padrão oferece várias vantagens:
- **Abstração**: Fornece uma API limpa para operações de acesso a dados, ocultando os detalhes de como os dados são obtidos e armazenados.
- **Gerenciamento Centralizado de Dados**: Ajuda no gerenciamento de cache de dados, sincronização e tratamento de erros de forma centralizada.
- **Testabilidade**: Facilita testes ao permitir a substituição de repositórios por versões de teste.


## Acessibilidade <a name="acessibilidade"></a>

A experiência do usuário foi cuidadosamente pensada para garantir acessibilidade. Foram adotadas medidas específicas para melhorar a experiência dos usuários com necessidades especiais, incluindo o uso do VoiceOver e Dynamic Fonts. Caso desejem, recomento fortemente que utilizem o Voice Over para verificar como foram realizadas algumas tratativas para, por exemplo, impedir que o mesmo tente ler textos dentro da imagem (o que atrapalha a descrição fornecida) ou como foi realizado o agrupamento de algumas labels porque devem ser tratadas como um único elemento.

## Suporte a Múltiplos Idiomas <a name="multilinguagem"></a>

O projeto oferece suporte a múltiplos idiomas (português e inglês.)

## Fluxo de Trabalho com GitFlow <a name="gitflow"></a>

Para o gerenciamento de branches, este projeto utiliza o GitFlow, um modelo de branching que facilita o desenvolvimento paralelo de recursos e a manutenção de releases estáveis.

## Comentários gerais sobre alguns pontos da implementação:
- O APP foi todo modularizado visando a escalabilidade e manuntenabilidade do mesmo
- Por mais que o serviço atual retorne apenas um elemento "Digio Cash", na viewModel do módulo principal eu realizo uma tratativa para transformar isso em um array, fiz isso pensando que, se novos produtos dessa categoria "Digio Cash" forem lançados e precisarmos incluir na aplicação, a mesma já lida com isso na camada de Presentation. Ou seja, a escalabilidade se tornaria mais simples. 
- O produto possui tratativas para erros na chamada principal e também para o carregamento das imagens. Eu criei uma  "imagem de erro default" com o logo da Digio e uma mensagem para ser usada nos casos de erro de carregamento de imagem.

## Licença

Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
