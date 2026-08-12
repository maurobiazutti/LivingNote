# LivingNote 📓

O **LivingNote** é um sistema web pessoal e privado que evoluiu de um projeto aspiracional de três pilares (finanças, estudos e reflexões) para um **gerenciador de carreira e rotina de foco**. Hoje ele centraliza o meu perfil profissional completo, com dados para geração de currículos, e oferece ferramentas de produtividade como o timer Pomodoro.

O objetivo é criar uma ferramenta sob medida, focando em performance, simplicidade visual e total controle sobre os meus dados.

---

## 🛠️ Stack Tecnológica

* **Backend:** Ruby on Rails (v8.1) — Ruby 3.4.8
* **Banco de Dados:** PostgreSQL (chaves primárias `UUID`)
* **Frontend:** Tailwind CSS (via Importmap/Propshaft) + Hotwire/Turbo + Stimulus
* **Autenticação:** Devise
* **Testes:** RSpec + FactoryBot (specs de models)
* **Estilização & UI:** Clean, Dark Mode-first, focado em scannability.

---

## ✨ Funcionalidades

### 👤 Perfil Profissional
* Cadastro completo com **nome completo, username, telefone e biografia**.
* **CPF validado** (gem `cpf_cnpj` + validador customizado), normalizado para apenas dígitos e com unicidade garantida.
* **Social Links** — cadastro de plataformas e URLs (GitHub, LinkedIn, etc.) exibidos como badges no perfil.
* Ações completas: criar, editar, visualizar e deletar o perfil.

### 🎓 Formação Acadêmica
* CRUD de formações aninhado ao perfil.
* Campos: instituição, grau, curso e período (início/fim).

### 💼 Experiências Profissionais
* CRUD de experiências aninhado ao perfil.
* Campos: empresa, cargo, descrição e período (início/fim).

### 🏗️ Hub de Formação
* Central com **abas** para gerenciar, via Turbo Streams sem recarregar a página:
  * **Certificações** — nome, emissor e data de emissão.
  * **Skills** — nome e nível de proficiência.
  * **Idiomas** — nome e nível.

### 📌 Endereço
* CRUD de endereço vinculado ao perfil (rua, número, bairro, cidade, estado, CEP e país).

### 🍎 Pomodoro
* Timer com **presets** de 25 min (foco), 30 min (foco) e 5 min (pausa).
* **Tempo personalizado** (1–180 minutos).
* Controles de iniciar, pausar e reiniciar.
* **Sons de alerta** via Web Audio API ao fim do tempo.
* Link no sidebar abre em nova aba.

### 📄 Meus Currículos *(em desenvolvimento)*
* O model `Resume` já existe nesta versão — **até 3 currículos por perfil**, com título e objetivo.
* **CRUD e rotas ainda não integrados** (link no sidebar é placeholder).

---

## 🗺️ Próximos Passos

* **💰 Finanças** — módulo planejado (placeholder no sidebar).
* **Meus Currículos** — integrar CRUD/rotas e geração de PDFs dos currículos a partir dos dados do perfil.
* **Endereço** — integração com API de CEP para preencher automaticamente rua, cidade e estado.

---

## 🚀 Como Executar o Projeto Localmente

### Pré-requisitos
* Ruby instalado (gerenciado via `asdf` ou `rbenv`)
* PostgreSQL ativo
* Bundler
* Variáveis de ambiente `DB_USERNAME`, `DB_PASSWORD` e `DB_HOST` (arquivo `.env`)

### Configuração

1. Clone o repositório:
   ```bash
   git clone git@github.com:seu-usuario/living_note.git
   cd living_note
   ```

2. Instale as dependências e prepare o banco (idempotente):
   ```bash
   bin/setup
   bin/rails db:prepare
   ```

3. Rode o servidor de desenvolvimento (Rails + Tailwind watch):
   ```bash
   bin/dev
   ```

---

## ✅ Verificações de Qualidade

CI local (`bin/ci`): `bin/setup --skip-server`, `bin/rubocop`, `bin/bundler-audit`, `bin/importmap audit` e `bin/brakeman`.

* Testes: `bundle exec rspec`
* Lint: `bin/rubocop`
* Segurança: `bin/brakeman` e `bin/bundler-audit`