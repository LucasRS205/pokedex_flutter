#  Pokédex Flutter

Aplicação desenvolvida em **Flutter** que consome dados da **PokéAPI** e utiliza **Firebase Firestore** para armazenar Pokémons favoritos.

Este projeto foi desenvolvido como trabalho acadêmico para demonstrar o consumo de APIs e integração com Firebase.

---

#  Funcionalidades

✔ Listagem dos **151 primeiros Pokémon**
✔ Pesquisa por nome
✔ Tela de detalhes do Pokémon
✔ Exibição de:

* imagem
* descrição
* tipo
* altura
* peso
* estatísticas

✔ Sistema de **favoritos usando Firebase Firestore**
✔ Tela de Pokémons favoritos
✔ Cards estilizados por tipo de Pokémon
✔ Animação de transição entre telas

---

#  Tecnologias utilizadas

* **Flutter**
* **Dart**
* **PokéAPI**
* **Firebase Firestore**
* **HTTP package**

---

#  API utilizada

PokéAPI

https://pokeapi.co/

---

#  Firebase

O projeto utiliza **Firebase Firestore** para armazenar os Pokémons marcados como favoritos.

Estrutura da coleção:

```
favoritos
 └ pokemon
 └ id
```

---

#  Estrutura do projeto

```
lib/
│
├── screens/
│   ├── pokemon_list.dart
│   ├── pokemon_details.dart
│   └── favorites_screen.dart
│
├── services/
│   └── firebase_service.dart
│
└── main.dart
```

---

# ▶ Como executar o projeto

### 1️ Clonar o repositório

```
git clone https://github.com/SEU_USUARIO/pokedex_flutter.git
```

### 2️ Entrar na pasta

```
cd pokedex_flutter
```

### 3️ Instalar dependências

```
flutter pub get
```

### 4️ Executar o projeto

```
flutter run
```

---

#  Prints da aplicação

## Tela inicial

(lista de Pokémon)

## Tela de detalhes

(informações do Pokémon)

## Tela de favoritos

---

#  Arquitetura da aplicação

O aplicativo segue a seguinte estrutura:

```
Flutter App
    │
    ├── PokéAPI
    │      └ dados dos Pokémon
    │
    └── Firebase Firestore
           └ favoritos
```

---

#  Download

APK ou versão Web do aplicativo.

---
