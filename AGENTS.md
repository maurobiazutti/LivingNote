# AGENTS.md

Aplicação Rails 8.1 (Ruby 3.4.8, PostgreSQL, Tailwind + Importmap/Propshaft, Devise). Sistema pessoal e privado.

## Importante: README vs. Realidade
- O README descreve uma aplicação aspiracional de "três pilares" (Financeiro/Academia/Reflexões). O **código real é um gerador de currículos**: `Profile` → `Address`, `Experiences`, `Educations`, `Skills`, `Languages`, `Certifications`, `SocialLinks`, `Resumes`.
- Confie no código/configuração e não no README. **Não existem** models de Financeiro/Academia/Reflexões.

## Localização / Idioma
- A interface (UI), mensagens de validação e verificações de CPF estão em **Português (pt-BR)**, mesmo que os arquivos de configuração venham com o `en.yml` padrão. Mantenha as strings voltadas ao usuário e as validações em português.
- O CPF é normalizado apenas para dígitos (`cpf.gsub(/\D/,'')`) no método `Profile#normalize_cpf` antes de salvar. Utiliza a gem `cpf_cnpj` + o validador customizado `CpfValidator` (`app/services/cpf_validator.rb`).

## Testes
- **Não há framework de testes configurado.** O arquivo `config/application.rb` cometa a linha `rails/test_unit/railtie`, e não existe um diretório `test/`. NÃO confie no comando `bin/rails test` nem presuma o uso de RSpec. A integração contínua (CI) não roda testes no momento.
- Há um comentário em `app/models/profile.rb` sugerindo testes em RSpec — adicionar o RSpec exigirá configurá-lo do zero.

## Banco de Dados / Variáveis de Ambiente
- As credenciais do banco vêm de variáveis de ambiente (`DB_USERNAME`, `DB_PASSWORD`, `DB_HOST`), lidas pelo `config/database.yml` e fornecidas pela gem `dotenv` através do `.env`.
- Os arquivos `.env*` e `config/*.key` estão no `.gitignore` — nunca commite esses arquivos nem adicione seus valores em arquivos versionados.
- O ambiente de produção utiliza bancos de dados separados para Solid Queue, Solid Cache e Solid Cable, com caminhos de migração distintos (`db/queue_migrate`, etc.).

## Comandos
- Servidor de desenvolvimento: `bin/dev` (inicia o rails + `tailwindcss:watch`).
- Configuração inicial (idempotente): `bin/setup` → `bin/rails db:prepare`. Flags opcionais: `--reset`, `--skip-server`.
- CI Local: `bin/ci` executa `bin/setup --skip-server`, `bin/rubocop`, `bin/bundler-audit`, `bin/importmap audit` e `bin/brakeman`.
- Análises de segurança: `bin/brakeman` e `bin/bundler-audit`. O Rubocop utiliza o estilo `rubocop-rails-omakase`.

## Estado Atual / Ponto de Retomada
- Branch `main`, sincronizado com `origin/main`, working tree limpo.
- **Últimos commits:** `update_rails_8.1.3.1` (Rails atualizado p/ CVE-2026-66066 no Active Storage) e o merge do **Pomodoro** (feature completa: timer Stimulus em `app/javascript/controllers/time_controller.js`, presets 25/30/5min, tempo customizado, sons via Web Audio API, link no sidebar abrindo em nova aba).
- **Próximos passos prováveis (placeholders no sidebar, `app/views/layouts/application.html.erb`):**
  1. **Finanças** — link `href="#`  sem rota (em breve).
  2. **Meus Currículos** — link `href="#"` sem rota. Model `Resume` existe mas ainda **sem** CRUD/rotas integradas.

## Convenções
- Os geradores do Rails estão configurados para **chaves primárias UUID** (`config.generators.orm.primary_key_type = :uuid`) — novos migrations devem utilizar IDs no formato UUID/string.
- A autenticação é gerenciada pelo Devise; o `HomeController#index` é o único controller que ignora o filtro `authenticate_user!`.
- Execute a verificação de código antes de finalizar qualquer tarefa: `bin/rubocop`.