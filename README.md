# 📱 Pokedex Flutter

Uma aplicação mobile desenvolvida em Flutter que consome a **PokeAPI** para exibir os 151 Pokémon da primeira geração.

O usuário pode visualizar, pesquisar e favoritar Pokémon, com persistência de dados utilizando **Firebase Firestore**.

---

## 👨‍💻 Autor

Lucas Ramos Silva  
Estudante de Engenharia de Software  

GitHub: https://github.com/LucasRS205  

---

## 🎯 Sobre o Projeto (Trabalho do 1º Bimestre)

Este projeto foi desenvolvido como requisito de avaliação da disciplina, atendendo aos seguintes critérios:

✅ [2 pontos] Aplicação consumindo API externa (PokeAPI)  
✅ [2 pontos] Integração com Firebase (Cloud Firestore)  
✅ [2 pontos] README bem estruturado e documentado  
✅ [1 ponto] Código Dart versionado no GitHub  
✅ [1 ponto] Organização da aplicação  
✅ [1 ponto] Prints da aplicação  
✅ [1 ponto] Funcionalidades completas (lista, busca e favoritos)  

---

## 🏗️ Arquitetura da Aplicação

A aplicação foi construída com foco em simplicidade e desempenho.

- O app consome diretamente a **PokeAPI** para listagem dos Pokémon
- Os dados de favoritos são persistidos no **Firebase Firestore**
- Separação de responsabilidades por telas (screens)

Fluxo:

App Flutter → PokeAPI (dados)  
App Flutter → Firebase (favoritos)

---
lib/
├── screens/
│ ├── pokemon_list.dart # Lista principal
│ ├── pokemon_details.dart # Tela de detalhes
│ └── favorites_screen.dart # Tela de favoritos
│
├── main.dart # Inicialização do app


---

## 🚀 Tecnologias Utilizadas

- Flutter
- Dart
- PokeAPI
- Firebase
- Cloud Firestore

---

## ⚙️ Funcionalidades

### 📋 Lista de Pokémon

- Exibição dos 151 Pokémon
- Layout em grid
- Cards estilizados e responsivos

![Home](assets/images/home.png)

---

### 🔎 Pesquisa

- Busca por nome ou número
- Atualização em tempo real

![Search](assets/images/search.png)

---

### 📖 Detalhes do Pokémon

- Imagem ampliada
- Tipos
- Altura e peso
- Status (HP, Attack, Defense, Speed)

![Details](assets/images/details.png)

---

### ❤️ Favoritos

- Salvar Pokémon
- Listar favoritos
- Remover com botão

![Favorites](assets/images/favorites.png)

---

## ☁️ Firebase / Firestore

Os favoritos são armazenados no Firestore com estrutura simples:

- id
- nome do Pokémon

![Firestore](assets/images/firestore.png)

---

## 📊 Firebase Dashboard

Monitoramento de uso do app:

- Leituras
- Escritas
- Analytics

![Firebase](assets/images/firebase.png)

---

## 🔗 API Utilizada

PokeAPI  
https://pokeapi.co/

---

## ⚙️ Como Instalar e Rodar

### 1. Pré-requisitos

- Flutter instalado
- Emulador Android/iOS ou dispositivo físico

---

### 2. Clonar o projeto
git clone https://github.com/LucasRS205/pokedex_flutter.git

cd pokedex_flutter


---

### 3. Instalar dependências


flutter pub get


---

### 4. Rodar o projeto

---

## 📥 Download e Teste

(Em breve)

---

## ⭐ Melhorias Futuras

- Animações mais avançadas
- Cache de dados
- Filtros por tipo
- Modo escuro
- Melhor responsividade

## 📂 Estrutura do Projeto
