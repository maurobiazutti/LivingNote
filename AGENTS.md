# AGENTS.md

Aplicação Rails 8.1 (Ruby 3.4.8, PostgreSQL, Tailwind + Importmap/Propshaft, Devise, Hotwire/Turbo/Stimulus). Sistema pessoal e privado com potencial de evoluir para multi-usuário.

> **Regra fundamental:** o LivingNote deve ser **simples por dentro, agradável por fora e coerente como produto.** Organizar conhecimento, rotina, estudos, carreira e evolução pessoal em um único espaço — não acumular funcionalidades.

## Visão do Produto (documento de diretrizes)
- O guia de visão e diretrizes está em `LivingNote — Contexto do Produto e Diretrizes para Agents.md`.
- O LivingNote **não é** "um app com várias ferramentas", mas um **ambiente pessoal** que conecta `Conhecimento → Anotações → Estudos → Tarefas → Foco → Carreira → Vida pessoal`.
- **5 pilares:** ① Conhecimento/Blog (público), ② Produtividade (Todo List + Pomodoro), ③ Cadernos/Anotações, ④ Estudos, ⑤ Carreira (Perfil + Currículos).
- **Cada nova feature deve responder:** qual problema resolve? como conecta aos módulos existentes? a qual pilar pertence? existe solução mais simples?
- **Home pública ≠ Dashboard.** A Home apresenta/converte; o Dashboard organiza o ambiente autenticado (clareza > quantidade de widgets).

## Importante: Realidade atual (o que EXISTE hoje)
- **Módulo Carreira** é o único totalmente implementado: `Profile` → `Address`, `Experiences`, `Educations`, `Skills`, `Languages`, `Certifications`, `SocialLinks`, `Resumes`.
- **Pomodoro** funcional (área Produtividade): timer Stimulus, presets 25/30/5min, tempo customizado, sons via Web Audio API, abre em aba nova.
- **Autenticação** Devise completa; `HomeController#index` ignora `authenticate_user!`.
- **NÃO existem:** Blog/Artigos, Cadernos/Anotações, Estudos, Todo List, Finanças, geração de PDF dos currículos. São roadmap, não código.

## Currículos (conceito-chave)
- O currículo **NÃO duplica** os dados do Perfil: ele é uma **seleção/configuração** dos dados-base (experiências, formações, skills, certificações…).
- Máximo de **3 currículos por perfil** (validação em `Resume#profile_can_have_only_three_resumes`).
- Model `Resume` existe; **CRUD/rotas ainda não integrados** (link no sidebar é placeholder).

## Testes
- **RSpec configurado:** `spec/` com `rails_helper.rb`, `spec_helper.rb`, factories em `spec/factories/` e specs de todos os models (`spec/models/`). Gems: `rspec-rails`, `factory_bot_rails`, `shoulda-matchers`.
- Rodar com `bundle exec rspec`. Não usar `bin/rails test` (o railtie `rails/test_unit/railtie` está comentado e não há dir `test/`).
- Sugerir/adicionar specs ao criar ou alterar models/validações.

## Localização / Idioma
- Interface, mensagens de validação e verificações de CPF em **Português (pt-BR)**, mesmo com o `en.yml` padrão presente.
- CPF normalizado para dígitos (`cpf.gsub(/\D/,'')`) em `Profile#normalize_cpf`; usa gem `cpf_cnpj` + `CpfValidator` (`app/services/cpf_validator.rb`).

## Banco de Dados / Variáveis de Ambiente
- Credenciais via variáveis de ambiente (`DB_USERNAME`, `DB_PASSWORD`, `DB_HOST`) lidas pelo `config/database.yml` e fornecidas pelo dotenv (`.env`).
- `.env*` e `config/*.key` estão no `.gitignore` — **nunca** commite nem versione esses valores.
- Produção usa bancos separados para Solid Queue/Cache/Cable (`db/queue_migrate`, etc.).
- Priorizar integridade no banco (FKs, índices, unique index, null constraints) além das validações Rails.

## Segurança / Privacidade
- Dados sensíveis (CPF, endereço, experiências, currículos, finanças futuras, notas) são **privados por padrão**.
- **Nunca** expor dados pessoais em páginas públicas (somente o Blog futuro é público).
- Autorizar e escopar por usuário em toda controller/query/view. Não logar CPF, senhas ou tokens.

## Comandos
- Dev: `bin/dev` (Rails + `tailwindcss:watch`).
- Setup idempotente: `bin/setup` → `bin/rails db:prepare`. Flags: `--reset`, `--skip-server`.
- CI local: `bin/ci` (`bin/setup --skip-server`, `bin/rubocop`, `bin/bundler-audit`, `bin/importmap audit`, `bin/brakeman`).
- Qualidade: `bin/rubocop` (estilo `rubocop-rails-omakase`), `bundle exec rspec`, `bin/brakeman`, `bin/bundler-audit`.

## Convenções
- **Chaves primárias UUID** (`config.generators.orm.primary_key_type = :uuid`) — novos migrations usam UUID.
- Rails "do jeito Rails": REST, ActiveRecord, validações. Service objects só p/ lógica de negócio complexa; concerns só p/ comportamento compartilhado. Evitar abstrações prematuras.
- Não adicionar gems sem justificativa; não introduzir frameworks frontend extras (React etc.).
- Executar `bin/rubocop` antes de finalizar qualquer tarefa.

## Filosofia de trabalho (pair programmer)
- Entender o objetivo → verificar arquitetura existente → procurar/reutilizar código relacionado → propor a solução **mais simples** → implementar → checar efeitos colaterais → sugerir testes → explicar decisões.
- Evoluir em camadas: problema real → modelo simples → CRUD funcional → UX → testes → refatoração → otimização. **Não** implementar features futuras antes da hora nem criar abstrações para funcionalidades que ainda não existem.

## Estado Atual / Ponto de Retomada
- Branch `documentation` (trabalho de documentação em andamento; sincronizado com `main`), working tree limpo.
- **Últimos commits:** `update_rails_8.1.3.1` (CVE-2026-66066), merge do **Pomodoro** (timer Stimulus em `app/javascript/controllers/time_controller.js`).
- **Próximos passos prováveis (placeholders em `app/views/layouts/application.html.erb`):**
  1. **Meus Currículos** — CRUD/rotas do `Resume` + seleção de dados do Perfil (link no sidebar).
  2. **Finanças** — módulo planejado, manter simples (link no sidebar).
  3. **Dashboard** — transformar a Home logada em central de navegação.