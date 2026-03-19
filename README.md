📱 Pokedex Flutter

Aplicativo mobile desenvolvido com Flutter que consome a PokeAPI para exibir informações dos primeiros 151 Pokémon da primeira geração.

O aplicativo permite:

visualizar Pokémon em formato de cards

pesquisar Pokémon por nome ou número

visualizar detalhes completos

salvar Pokémon como favoritos

armazenar favoritos no Firebase Firestore

🚀 Tecnologias Utilizadas

Flutter

Dart

PokeAPI

Firebase

Cloud Firestore

📦 Funcionalidades
📋 Lista de Pokémon

A tela principal apresenta os primeiros 151 Pokémon da Pokédex organizados em cards coloridos.

Cada card contém:

número do Pokémon

nome

sprite oficial

cores diferentes para melhor visualização
<img width="478" height="992" alt="Captura de tela 2026-03-16 115337" src="https://github.com/user-attachments/assets/cb13b573-bff0-4484-a884-887702abc51c" />


🔎 Pesquisa de Pokémon

O aplicativo permite buscar Pokémon pelo nome ou número da Pokédex.

Exemplo:

magikarp

151

<img width="455" height="348" alt="Captura de tela 2026-03-16 115439" src="https://github.com/user-attachments/assets/581a2280-cf22-4640-abe5-9776abfbf241" />

<img width="451" height="354" alt="Captura de tela 2026-03-16 115500" src="https://github.com/user-attachments/assets/170beaac-c103-43d7-94ed-82f1d6ed8516" />


📖 Tela de Detalhes

Ao clicar em um Pokémon, o aplicativo abre uma tela com informações detalhadas:

imagem ampliada

descrição da Pokédex

tipo do Pokémon

altura

peso

estatísticas base

<img width="470" height="1035" alt="Captura de tela 2026-03-16 115308" src="https://github.com/user-attachments/assets/a32e3d67-6e52-4fbd-bb2f-472036c63222" />

<img width="458" height="282" alt="Captura de tela 2026-03-16 115400" src="https://github.com/user-attachments/assets/90b9bc41-fa9e-4f4f-887c-7cbd398d3b04" />

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
 └ pokemon: bulbasaur
 └ id: 1


```
📊 Painel Firebase

O Firebase também permite acompanhar:

leituras no banco

gravações

analytics do aplicativo

<img width="578" height="704" alt="Captura de tela 2026-03-16 120253" src="https://github.com/user-attachments/assets/c671940f-e694-428d-bed7-86718ac5f33f" />

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
🎯 Objetivo do Projeto

Este projeto foi desenvolvido com o objetivo de praticar:

desenvolvimento mobile com Flutter

consumo de API REST

manipulação de dados assíncronos

criação de interfaces modernas

integração com Firebase
---

👨‍💻 Autor

Lucas Ramos Silva

Estudante de Engenharia de Software

GitHub
https://github.com/LucasRS205

⭐ Melhorias Futuras

animações de transição entre telas

cache de dados para melhorar performance

filtros por tipo de Pokémon

paginação para gerações futuras

modo escuro
---

#  Download

APK ou versão Web do aplicativo.

---
