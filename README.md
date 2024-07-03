# Digio Store

## Índice

1. [Objetivo](#objetivo)
2. [Especificações](#especificacoes)
3. [Arquitetura](#arquitetura)
4. [Padrões](#padroes)
    - [Padrão Delegate](#padrao-delegate)
    - [Padrão Factory](#padrao-factory)
    - [Padrão Repository](#padrao-repository)

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

## Licença

Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
