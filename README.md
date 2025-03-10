# Brasil Cripto

Brasil Cripto é um aplicativo Flutter para acompanhar o mercado de criptomoedas, exibindo informações como preço atual, variação percentual, volume de mercado e gráficos de desempenho.

## Tecnologias Utilizadas

O projeto foi desenvolvido utilizando as seguintes tecnologias:

- **Flutter 3.29.1** - Framework para desenvolvimento mobile.
- **Dart** - Linguagem de programação utilizada no Flutter.
- **Flutter Bloc** - Gerenciamento de estado reativo.
- **Get It** - Injeção de dependência.
- **Hive** - Banco de dados local leve e rápido.
- **HTTP** - Requisições para API.
- **Intl** - Formatação de números e datas.
- **FL Chart** - Exibição de gráficos.
- **Flutter Dotenv** - Gerenciamento de variáveis de ambiente.
- **Build Runner & Hive Generator** - Geração de código.

## Como Rodar o Projeto

### 1. Clonar o Repositório
```sh
  git clone https://github.com/seu-usuario/brasil_cripto.git
  cd brasil_cripto
```

### 2. Instalar as Dependências
```sh
  flutter pub get
```

### 3. Criar o Arquivo `.env`
Crie um arquivo `.env` na raiz do projeto e adicione suas credenciais:
```
API_URL=https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd
API_KEY=SEU_TOKEN_AQUI
```

### 4. Rodar o Projeto
```sh
  flutter run
```

Se estiver rodando em um emulador iOS, execute primeiro:
```sh
  cd ios && pod install && cd ..
```

### 5. Gerar Arquivos do Hive (Opcional)
Se houver mudanças no Hive, execute:
```sh
  flutter pub run build_runner build --delete-conflicting-outputs
```

## Estrutura do Projeto

```
lib/
|-- core/
|   |-- data/   # Implementação de repositórios e fontes de dados
|   |-- domain/ # Modelos e casos de uso
|   |-- enums/  # Enumerações globais
|   |-- generics/ # Estruturas genéricas
|-- view/      # Interface do usuário e widgets
|-- main.dart  # Ponto de entrada da aplicação
```

## Contato
Caso tenha dúvidas ou sugestões, entre em contato comigo pelo [GitHub](https://github.com/seu-usuario).

