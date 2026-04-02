# Projeto Flutter – Splash, Login e Cadastro com Dados Mockados

## Integrantes

* Mateus Graçadio Coelho RA: 25000217

---

## Descrição do Projeto

Este projeto consiste no desenvolvimento de um aplicativo mobile em Flutter com fluxo de autenticação simulada, contendo telas de Splash, Login, Cadastro e Home.
Os dados dos usuários são armazenados em memória utilizando uma estrutura mockada (List), sem uso de banco de dados ou API externa.

---

## Objetivo

O objetivo do projeto é aplicar os conceitos de:

* Navegação entre telas
* Formulários e validação
* Organização arquitetural
* Uso de Model
* Manipulação de dados em memória

---

## Arquitetura Utilizada

O projeto segue uma estrutura organizada baseada na separação de responsabilidades:

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

### Explicação

* **views** → responsáveis pela interface (telas)
* **models** → representam os dados (UserModel)
* **data (store)** → simula armazenamento em memória (UserStore)

A lógica de autenticação não fica diretamente na interface, garantindo melhor organização do código.

---

## Dados Mockados

O projeto utiliza uma lista em memória:

```dart
static final List<UserModel> _users = [];
```

Essa lista simula um banco de dados, permitindo:

* cadastro de usuários
* validação de login

---

## Fluxo da Aplicação

### 1️⃣ Splash Screen

* Primeira tela exibida
* Apresenta layout com Container, Column e Row
* Após alguns segundos, navega automaticamente para o login

---

### 2️⃣ Tela de Login

* Campos:

  * Email
  * Senha
* Botão de entrar
* Botão para cadastro

🔍 Funcionalidade:

* Verifica se o usuário existe na lista mockada
* Se válido → navega para Home
* Se inválido → exibe mensagem de erro

---

### 3️⃣ Tela de Cadastro

* Campos:

  * Nome
  * Email
  * Senha
* Botão de cadastrar

💾 Funcionalidade:

* Cria um objeto `UserModel`
* Armazena na lista mockada (`UserStore`)
* Exibe mensagem de sucesso
* Retorna para o login

---

### 4️⃣ Retorno ao Login

Após o cadastro, o usuário volta para a tela de login para autenticação.

---

### 5️⃣ Autenticação

* O sistema compara email e senha com os dados salvos
* Caso válido, salva o usuário atual na memória

---

### 6️⃣ Tela Home

* Exibe:

  * Ícone centralizado
  * Texto centralizado
* Mostra o nome do usuário logado

Exemplo:

```
Olá Mateus,
O App ainda está em desenvolvimento
```

---

## ▶️ Demonstração

📹 **Vídeo de demonstração do funcionamento:**

> (Inserir link do vídeo aqui)

O vídeo demonstra o fluxo completo:

* Splash
* Login
* Cadastro
* Retorno ao login
* Login válido
* Navegação para Home

---

## ⚙️ Tecnologias Utilizadas

* Flutter
* Dart

---

## ✅ Requisitos Atendidos

✔ Splash Screen com navegação automática
✔ Tela de Login com validação
✔ Tela de Cadastro com armazenamento em memória
✔ Uso de Model (UserModel)
✔ Dados mockados com List
✔ Navegação entre telas
✔ Tela Home com conteúdo centralizado
✔ Organização em pastas
✔ Separação de responsabilidades

---

## 🚀 Considerações Finais

Este projeto não utiliza autenticação real, tendo como objetivo demonstrar domínio dos conceitos fundamentais de desenvolvimento mobile com Flutter, incluindo estruturação de projeto, navegação, formulários e manipulação de dados em memória.

---

## 🔗 Repositório

> (Inserir link do GitHub aqui)
