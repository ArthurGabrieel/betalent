# **BeTalent - Teste Técnico Mobile**

Uma aplicação Flutter desenvolvida como parte do processo seletivo da **BeTalent**. O objetivo do projeto é exibir uma tabela de dados de funcionários, com funcionalidades de busca, formatação de números e datas, e um layout interativo.

## **Estrutura do Projeto**

O projeto segue os princípios da **Clean Architecture**, dividindo o código em camadas bem definidas:

- **Presentation**: Componentes de UI, widgets e gerenciamento de estado (Bloc).
- **Domain**: Lógica de negócios, casos de uso e entidades.
- **Data**: Fontes de dados, repositórios e modelos.

---

## **Funcionalidades**

- **Tabela de Funcionários**: Exibição de dados de funcionários, incluindo:
  - Imagem do funcionário;
  - Nome;
  - Cargo;
  - Data de admissão (formatada);
  - Telefone (formatado).
- **Busca Dinâmica**: Filtre funcionários por nome, cargo ou telefone.
- **Formatação de Dados**:
  - Números de telefone no formato padrão nacional;
  - Datas exibidas no formato `dd/MM/yyyy`.
- **UI Interativa**: Interface responsiva e amigável com animações suaves.
- **Tratamento de Erros**: Mensagens amigáveis para problemas de rede ou entradas inválidas.

---

## **Pré-requisitos**

Para rodar este projeto, você precisará ter instalado:

- [Flutter](https://flutter.dev/) versão 3.24.5 ou superior;
- [Dart](https://dart.dev/) versão 3.5.4 ou superior;
- [json-server](https://github.com/typicode/json-server) para simular a API.

---

## **Instruções para Rodar a Aplicação**

1. **Clone o repositório**:

    ```bash
    git clone https://github.com/ArthurGabrieel/betalent.git
    ```

2. **Navegue para o diretório do projeto**:

    ```bash
    cd seuprojeto
    ```

3. **Instale as dependências do Flutter**:

    ```bash
    flutter pub get
    ```

4. **Instale as dependências do JavaScript**:
      ```bash
      npm install
      ```

5. **Inicie o servidor JSON**:
      ```bash
      npx json-server --watch database.json
      ```

    A API estará disponível em [http://localhost:3000](http://localhost:3000).

6. **Execute o aplicativo**:

    ```bash
    flutter run
    ```

    Certifique-se de que um dispositivo ou emulador está conectado.

---

## **Tecnologias Utilizadas**

- **Flutter**: Framework principal para desenvolvimento mobile.
- **Dart**: Linguagem de programação utilizada no Flutter.
- **Bloc**: Gerenciamento de estado seguindo padrões reativos.
- **json-server**: Simulação da API.

---

## **Licença**

Este projeto foi desenvolvido como parte de um teste técnico e é de uso exclusivo para avaliação. Entre em contato com o autor para mais informações.
