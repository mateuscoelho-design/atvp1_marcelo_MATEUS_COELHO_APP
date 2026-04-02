# Projeto Flutter – Splash, Login e Cadastro com Dados Mockados

## Integrantes

* Mateus Graçadio Coelho – RA: 25000217

---

## Descrição do Projeto

Este projeto consiste no desenvolvimento de um aplicativo mobile utilizando Flutter, com fluxo de autenticação simulada. A aplicação possui as telas de Splash, Login, Cadastro e Home.

Os dados dos usuários são armazenados em memória por meio de uma estrutura mockada utilizando List, sem uso de banco de dados ou API externa.

---

## Objetivo

O objetivo do projeto é aplicar os conceitos fundamentais de desenvolvimento mobile, incluindo:

* Navegação entre telas
* Construção de formulários
* Validação de dados
* Organização arquitetural
* Uso de Model
* Manipulação de dados em memória

---

## Arquitetura Utilizada

O projeto foi estruturado com base na separação de responsabilidades, conforme trabalhado em aula:

```
lib/
├── app/
│   ├── app_widget.dart
│   └── data/
│       └── user_store.dart
│
├── features/
│   ├── auth/
│   │   ├── model/
│   │   │   └── user_model.dart
│   │   └── view/
│   │       ├── login_page.dart
│   │       └── register_page.dart
│   │
│   ├── home/
│   │   └── view/
│   │       └── home_page.dart
│   │
│   └── splash/
│       └── view/
│           └── splash_page.dart
│
└── main.dart
```

### Explicação da Arquitetura

* Views: responsáveis pela interface do usuário (telas)
* Models: representam os dados da aplicação (UserModel)
* Data (Store): responsável pelo armazenamento em memória (UserStore)

A lógica de autenticação foi separada da interface, garantindo melhor organização e manutenção do código.

---

## Uso de Model

Foi implementado o model `UserModel`, responsável por representar os dados do usuário:

* Nome
* Email
* Senha

Arquivo:
features/auth/model/user_model.dart

---

## Dados Mockados

O armazenamento de dados é realizado em memória através de uma lista:

```dart
static final List<UserModel> _users = [];
```

Essa estrutura simula um banco de dados durante a execução do aplicativo, permitindo:

* Cadastro de usuários
* Validação de login
* Controle do usuário autenticado

---

## Navegação

A navegação do aplicativo é realizada por rotas nomeadas definidas no arquivo `app_widget.dart`.

Rotas utilizadas:

* / → Splash
* /login → Login
* /register → Cadastro
* /home → Home

---

## Fluxo da Aplicação

### 1. Splash Screen

* Primeira tela exibida ao abrir o aplicativo
* Utiliza Container, Column e Row para construção da interface
* Após alguns segundos, navega automaticamente para a tela de Login

---

### 2. Tela de Login

* Campos:

  * Email
  * Senha

* Botão de login

* Botão para acessar o cadastro

Funcionalidade:

* Verifica se o usuário existe na lista mockada
* Se válido → navega para a Home
* Se inválido → exibe mensagem de erro

---

### 3. Tela de Cadastro

* Campos:

  * Nome
  * Email
  * Senha

* Botão de cadastro

Funcionalidade:

* Cria um objeto `UserModel`
* Armazena o usuário na lista mockada (`UserStore`)
* Exibe mensagem de sucesso
* Retorna para a tela de login

---

### 4. Retorno ao Login

Após o cadastro, o usuário é redirecionado para a tela de Login para realizar a autenticação.

---

### 5. Autenticação

* O sistema compara email e senha com os dados armazenados
* Caso válido, o usuário é salvo como usuário atual

---

### 6. Tela Home

* Exibe:

  * Ícone centralizado
  * Texto centralizado

* Apresenta o nome do usuário logado

Exemplo:

```
Olá Mateus,
O App do Mateus ainda está em desenvolvimento :/
```

---

## Validação de Formulários

Foram utilizados:

* Form
* TextFormField
* Validators

Validações implementadas:

* Campos obrigatórios
* Formato de email válido
* Senha com tamanho mínimo

---

## Demonstração

Vídeo demonstrando o funcionamento da aplicação:

https://drive.google.com/file/d/1sGCDo0nq9pI3C_pQpeRYKGHO-AM29-dD/view?usp=sharing

Fluxo apresentado:

* Splash
* Login
* Cadastro
* Retorno ao Login
* Autenticação válida
* Navegação para Home

---

## Tecnologias Utilizadas

* Flutter
* Dart

---

## Requisitos Atendidos

* Splash Screen com navegação automática
* Tela de Login com validação
* Tela de Cadastro com armazenamento em memória
* Uso de Model (UserModel)
* Dados mockados com List
* Navegação por rotas
* Tela Home com conteúdo centralizado
* Organização em pastas
* Separação de responsabilidades

---

## Considerações Finais

O projeto atende aos requisitos propostos e demonstra o funcionamento de um fluxo completo de autenticação simulada utilizando dados em memória.

O foco principal foi a aplicação dos conceitos de organização arquitetural, navegação, formulários e manipulação de dados, sem a utilização de banco de dados ou serviços externos.

---

## Repositório

https://github.com/mateuscoelho-design/atvp1_marcelo_MATEUS_COELHO_APP.git
