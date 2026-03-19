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

<img width="478" height="992" alt="Captura de tela 2026-03-16 115337" src="https://github.com/user-attachments/assets/578fd484-599a-4071-b649-c57bd2008250" />


---

### 🔎 Pesquisa

- Busca por nome ou número
- Atualização em tempo real

<img width="455" height="348" alt="Captura de tela 2026-03-16 115439" src="https://github.com/user-attachments/assets/280c6fef-9265-4518-b32c-7f741901ad5e" />

<img width="451" height="354" alt="Captura de tela 2026-03-16 115500" src="https://github.com/user-attachments/assets/d9daf9de-1b84-44cb-931c-d9e351def59f" />



---

### 📖 Detalhes do Pokémon

- Imagem ampliada
- Tipos
- Altura e peso
- Status (HP, Attack, Defense, Speed)

<img width="470" height="1035" alt="Captura de tela 2026-03-16 115308" src="https://github.com/user-attachments/assets/2850633c-c5e7-4646-a5ac-5642060920b4" />


---

### ❤️ Favoritos

- Salvar Pokémon
- Listar favoritos
- Remover com botão

<img width="458" height="282" alt="Captura de tela 2026-03-16 115400" src="https://github.com/user-attachments/assets/45a6882e-31ac-4749-ab62-abf25d178dbb" />


---

## ☁️ Firebase / Firestore

Os favoritos são armazenados no Firestore com estrutura simples:

- id
- nome do Pokémon

<img width="1368" height="723" alt="Captura de tela 2026-03-16 120210" src="https://github.com/user-attachments/assets/263caf14-b6b7-4259-94e0-5baa86c1c9ef" />


---

## 📊 Firebase Dashboard

Monitoramento de uso do app:

- Leituras
- Escritas
- Analytics

<img width="578" height="704" alt="Captura de tela 2026-03-16 120253" src="https://github.com/user-attachments/assets/a2e455ac-fc32-4bd3-b4d7-9f66f194ceb3" />


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


## ⭐ Melhorias Futuras

- Animações mais avançadas
- Cache de dados
- Filtros por tipo
- Modo escuro
- Melhor responsividade

