# LivingNote — Contexto do Produto e Diretrizes para Agents

## 1. Visão do produto

O **LivingNote 📓** é uma aplicação web pessoal de organização da vida, conhecimento, produtividade e carreira.

O projeto é construído com:

- Ruby on Rails 8.1
- PostgreSQL
- Devise
- Tailwind CSS
- Hotwire / Turbo / Stimulus
- Interface em português brasileiro (`pt-BR`)
- Tema predominantemente dark

O LivingNote nasceu como uma ferramenta pessoal, mas sua arquitetura deve permitir que, futuramente, ele possa evoluir para uma plataforma utilizada por outras pessoas.

### Ideia central

O LivingNote deve conectar:

> **Conhecimento → Anotações → Estudos → Tarefas → Foco → Carreira → Vida pessoal**

O objetivo não é criar vários aplicativos independentes dentro de um único sistema.

Os módulos devem fazer sentido juntos e compartilhar dados quando isso melhorar a experiência do usuário.

---

# 2. Público-alvo

## Usuário atual

O principal usuário é o próprio desenvolvedor do projeto.

O sistema é utilizado como:

- ferramenta pessoal;
- laboratório de desenvolvimento;
- ferramenta de organização;
- sistema de estudos;
- gerenciamento de carreira;
- espaço para registrar conhecimento.

O projeto deve resolver problemas reais do cotidiano do seu próprio desenvolvedor antes de tentar resolver problemas genéricos de terceiros.

## Futuro

Apesar de atualmente ser um sistema pessoal, o código deve evitar decisões que impeçam uma futura evolução para múltiplos usuários.

Não assumir que funcionalidades futuras serão utilizadas somente por um usuário se isso criar acoplamento desnecessário.

Entretanto:

**não implementar complexidade de SaaS antes de existir uma necessidade real.**

---

# 3. Princípio central do produto

O LivingNote não deve ser tratado como:

> "um aplicativo com várias ferramentas."

Deve ser tratado como:

> **um ambiente pessoal para organizar conhecimento, rotina, estudos, carreira e evolução pessoal.**

Cada funcionalidade deve responder a uma necessidade desse conceito.

Antes de criar uma nova feature, verificar:

1. Qual problema ela resolve?
2. Como ela se relaciona com o restante do LivingNote?
3. Ela pertence claramente a algum dos pilares do produto?
4. Ela cria valor para o usuário?
5. Existe uma solução mais simples?

Evitar funcionalidades criadas apenas porque são tecnicamente interessantes.

---

# 4. Pilares do LivingNote

O produto possui cinco grandes áreas.

## 4.1 Conhecimento 🧠

Responsável por conteúdo e conhecimento.

Inclui:

- Blog
- Artigos
- Categorias
- Tags
- Cadernos
- Anotações
- Estudos

Temas possíveis:

- tecnologia;
- programação;
- ciência;
- filosofia;
- psicologia;
- neurociência;
- produtividade;
- educação;
- carreira;
- desenvolvimento pessoal.

O conteúdo deve possuir uma linha editorial coerente.

A ideia não é publicar assuntos aleatórios.

A linha geral deve girar em torno de:

> **pensar melhor, aprender melhor, trabalhar melhor e evoluir.**

---

# 5. Blog público

O Blog é uma parte estratégica do produto.

Ele não deve ser tratado apenas como um CRUD de artigos.

Sua função é:

1. compartilhar conhecimento;
2. gerar tráfego orgânico;
3. construir autoridade;
4. atrair usuários;
5. apresentar naturalmente as ferramentas do LivingNote.

A Home pública deve funcionar como uma porta de entrada para o ecossistema.

Exemplo:

Um artigo sobre concentração pode apresentar o Pomodoro.

Um artigo sobre estudos pode apresentar Todo List, Cadernos e Anotações.

Um artigo sobre carreira pode apresentar Perfil e Currículos.

Um artigo sobre organização financeira pode apresentar Finanças.

### Fluxo esperado

```text
Google
   ↓
Artigo
   ↓
Conhecimento
   ↓
Ferramenta relacionada
   ↓
Cadastro
   ↓
Uso do LivingNote
```

O conteúdo não deve parecer propaganda agressiva.

As ferramentas devem aparecer como consequência natural do conteúdo.

---

# 6. Produtividade 🎯

Área responsável por ajudar o usuário a executar o que precisa ser feito.

Inclui:

- Todo List
- Pomodoro
- planejamento de tarefas;
- organização de estudos.

## Pomodoro

O Pomodoro já existe e é funcional.

Características atuais:

- timer configurável;
- períodos de foco;
- períodos de descanso;
- som;
- abertura em nova aba.

O comportamento do timer deve continuar funcionando corretamente mesmo quando a aba perde foco.

Não implementar soluções que dependam exclusivamente de `setInterval` para medir o tempo real.

O tempo deve ser calculado com base em timestamps quando necessário.

---

# 7. Cadernos e Anotações 📓

O usuário poderá criar **cadernos** para organizar suas anotações.

Exemplo:

```text
Cadernos

├── Ruby on Rails
│   ├── ActiveRecord
│   ├── Controllers
│   └── RSpec
│
├── Filosofia
│   ├── Nietzsche
│   └── Estoicismo
│
├── Ideias
│   ├── Projetos
│   └── Negócios
│
└── Estudos
    ├── PostgreSQL
    └── JavaScript
```

A estrutura deve permitir evolução futura para:

- busca;
- tags;
- links entre notas;
- Markdown;
- favoritos;
- notas relacionadas;
- associação com estudos;
- associação com artigos.

Não implementar todos esses recursos antecipadamente.

Começar simples.

---

# 8. Estudos 📚

A área de estudos deve conectar conhecimento e produtividade.

Um estudo pode possuir:

- objetivo;
- tarefas;
- anotações;
- materiais;
- progresso.

Exemplo:

```text
Estudo: Ruby on Rails

Objetivo:
Aprender Rails avançado.

Tarefas:
- MVC
- ActiveRecord
- RSpec
- APIs

Anotações:
- ActiveRecord
- Callbacks
- Associations

Pomodoro:
Sessões de foco relacionadas ao estudo.
```

A ideia importante é:

> **estudo não deve ser apenas uma lista de tarefas.**

Ele deve reunir conhecimento + execução + progresso.

---

# 9. Carreira 💼

O Perfil funciona como o **banco de dados pessoal profissional**.

Ele concentra informações que podem ser utilizadas por outras partes do sistema.

Dados possíveis:

- nome;
- CPF;
- endereço;
- experiências;
- educação/formação;
- habilidades;
- idiomas;
- certificações;
- redes sociais.

Esses dados devem ser cadastrados uma vez e reutilizados quando necessário.

---

# 10. Currículos 📄

O usuário poderá criar até 3 currículos.

Um currículo não deve duplicar todos os dados do Perfil.

O Perfil contém os dados-base.

O currículo determina **quais informações serão utilizadas**.

Exemplo:

```text
Perfil
 ├── Experiência A
 ├── Experiência B
 ├── Experiência C
 ├── Educação A
 ├── Educação B
 ├── Skill A
 ├── Skill B
 └── Certificação A

Currículo Ruby on Rails
 ├── Experiência A
 ├── Experiência C
 ├── Educação A
 └── Skill A

Currículo Backend
 ├── Experiência B
 ├── Educação A
 ├── Skill A
 └── Certificação A
```

Essa separação é importante.

O usuário não deve precisar cadastrar novamente suas experiências para cada currículo.

O currículo deve funcionar como uma seleção/configuração dos dados existentes no Perfil.

---

# 11. Finanças 💰

Finanças é uma funcionalidade planejada.

Objetivo:

- registrar receitas;
- registrar despesas;
- categorizar movimentações;
- acompanhar metas;
- visualizar evolução financeira.

A implementação deve ser simples inicialmente.

Não transformar o LivingNote em um sistema bancário.

O foco é:

> **consciência e organização financeira pessoal.**

---

# 12. Dashboard autenticado

Depois do login, o usuário entra no ambiente privado do LivingNote.

O Dashboard deve funcionar como central de navegação.

Pode apresentar:

- tarefas pendentes;
- estudos ativos;
- acesso rápido ao Pomodoro;
- anotações recentes;
- progresso;
- atalhos;
- informações relevantes.

Não transformar o Dashboard em uma tela cheia de informações.

Priorizar:

**clareza > quantidade de widgets.**

---

# 13. Home pública

A Home pública é diferente do Dashboard.

### Home pública

Objetivos:

- apresentar o LivingNote;
- apresentar sua proposta;
- apresentar conteúdo;
- atrair visitantes;
- converter visitantes em usuários.

### Dashboard

Objetivos:

- ajudar o usuário autenticado;
- mostrar sua rotina;
- facilitar acesso às ferramentas.

Não misturar os dois conceitos.

---

# 14. Arquitetura de dados

Os dados devem ser organizados de maneira que exista uma única fonte de verdade.

Exemplo:

```text
User
 │
 └── Profile
       ├── Address
       ├── Experiences
       ├── Educations
       ├── Skills
       ├── Languages
       ├── Certifications
       ├── SocialLinks
       └── Resumes
```

Outros módulos podem se relacionar com o usuário e/ou seus dados conforme necessário.

Evitar duplicação de informações.

Se uma informação já existe em um modelo apropriado, reutilizá-la em vez de criar outra cópia.

---

# 15. Privacidade

O LivingNote trabalha com dados potencialmente sensíveis.

Exemplos:

- CPF;
- endereço;
- experiências profissionais;
- currículo;
- informações financeiras;
- anotações pessoais.

Esses dados devem ser considerados privados por padrão.

Nunca expor dados pessoais em páginas públicas.

O Blog é público.

Perfil, currículos, finanças, notas, tarefas e demais dados pessoais são privados.

Sempre considerar autorização e escopo do usuário ao criar controllers, queries e views.

---

# 16. Autenticação

O projeto utiliza Devise.

Usuários autenticados podem acessar as áreas privadas.

A Home pública pode ser acessada sem autenticação.

Não criar sistemas paralelos de autenticação.

Utilizar os mecanismos do Devise sempre que possível.

---

# 17. Interface

A interface deve seguir:

- português brasileiro;
- tema dark;
- visual limpo;
- responsivo;
- foco em legibilidade;
- navegação simples;
- baixa poluição visual.

Tecnologias principais:

- Tailwind CSS;
- Hotwire;
- Turbo;
- Stimulus.

Preferir componentes simples e reutilizáveis.

Não introduzir frameworks frontend adicionais sem necessidade real.

---

# 18. Filosofia de desenvolvimento

O projeto deve evoluir em camadas.

Não tentar construir a visão completa de uma vez.

Prioridade:

```text
Problema real
    ↓
Modelo simples
    ↓
CRUD funcional
    ↓
Experiência do usuário
    ↓
Testes
    ↓
Refatoração
    ↓
Otimização
```

Evitar:

```text
Feature futura
    ↓
Arquitetura complexa
    ↓
Abstrações
    ↓
Código que ninguém precisa ainda
```

---

# 19. Rails

Seguir as convenções do Rails sempre que possível.

Preferir:

- REST;
- ActiveRecord;
- associações claras;
- validations;
- scopes;
- callbacks somente quando realmente apropriados;
- service objects quando houver lógica de negócio complexa;
- concerns somente quando houver comportamento realmente compartilhado.

Não criar abstrações prematuramente.

Rails "do jeito Rails" deve ser a primeira opção.

---

# 20. Banco de dados

O banco principal é PostgreSQL.

Priorizar integridade no banco quando apropriado:

- foreign keys;
- índices;
- constraints;
- unique indexes;
- null constraints.

Validações Rails são importantes, mas não devem ser utilizadas como substitutas de garantias que pertencem ao banco.

Considerar performance desde o início sem fazer micro-otimizações prematuras.

---

# 21. Segurança

Sempre considerar:

- autorização;
- autenticação;
- mass assignment;
- SQL injection;
- XSS;
- CSRF;
- exposição acidental de dados;
- logs contendo informações sensíveis.

Nunca colocar CPF, senhas, tokens ou dados privados diretamente em logs.

Não expor informações privadas em endpoints públicos.

---

# 22. SEO e conteúdo

O Blog deve futuramente ser preparado para aquisição orgânica.

Considerar:

- URLs amigáveis;
- títulos adequados;
- meta description;
- headings semânticos;
- conteúdo original;
- links internos;
- categorias;
- tags quando realmente úteis;
- sitemap;
- canonical URLs;
- Open Graph.

SEO não deve prejudicar a experiência do usuário.

---

# 23. Monetização futura

A monetização não é a prioridade atual.

O produto deve primeiro gerar valor real.

Possibilidades futuras:

### Freemium

Recursos básicos gratuitos e recursos avançados pagos.

### Premium

Possíveis recursos:

- mais currículos;
- templates profissionais;
- exportações avançadas;
- recursos avançados de estudos;
- recursos avançados de organização;
- estatísticas;
- IA;
- backups;
- recursos financeiros avançados.

### Afiliados

Principalmente relacionados a conteúdo:

- livros;
- cursos;
- ferramentas;
- educação;
- tecnologia.

### Patrocínio

Pode existir futuramente quando houver audiência relevante.

Não inserir publicidade de maneira que prejudique a experiência.

---

# 24. Estratégia de crescimento

O Blog é o principal candidato a funcionar como canal de aquisição orgânica.

Fluxo desejado:

```text
Conteúdo
   ↓
Visitante
   ↓
Ferramenta gratuita
   ↓
Cadastro
   ↓
Uso recorrente
   ↓
Relacionamento
   ↓
Premium / outros modelos
```

O produto não deve depender inicialmente de anúncios.

O objetivo é criar uma base de usuários que realmente utiliza as ferramentas.

---

# 25. Relação entre os módulos

Sempre procurar conexões naturais.

Exemplos:

```text
Artigo
   ↓
Estudo relacionado
   ↓
Anotação
   ↓
Tarefa
   ↓
Pomodoro
```

Outro exemplo:

```text
Perfil
   ↓
Experiências
   ↓
Currículo
   ↓
PDF
```

Outro:

```text
Estudo
   ↓
Tarefas
   ↓
Pomodoro
   ↓
Progresso
```

Outro:

```text
Artigo
   ↓
Anotação
   ↓
Caderno
```

Essas conexões são uma das principais características que diferenciam o LivingNote de ferramentas isoladas.

---

# 26. Princípio UX

O usuário não deve precisar entender a arquitetura interna do sistema.

Ele deve pensar em coisas simples:

> Quero estudar.

> Quero anotar isso.

> Preciso fazer essa tarefa.

> Quero focar agora.

> Quero montar meu currículo.

> Quero organizar minhas finanças.

A aplicação deve esconder a complexidade técnica.

---

# 27. Priorização

Quando houver dúvida sobre qual funcionalidade implementar primeiro, utilizar:

### Prioridade alta

Funcionalidades que:

- resolvem problema real;
- conectam módulos existentes;
- melhoram o fluxo principal;
- aumentam o uso recorrente.

### Prioridade média

Funcionalidades que:

- melhoram UX;
- melhoram organização;
- melhoram conteúdo;
- melhoram desempenho.

### Prioridade baixa

Funcionalidades que:

- são apenas interessantes tecnicamente;
- são extremamente específicas;
- ainda não possuem necessidade real.

---

# 28. Não fazer

O Agent NÃO deve:

- transformar o projeto em SaaS complexo prematuramente;
- criar abstrações sem necessidade;
- adicionar gems sem justificativa;
- introduzir React ou outro framework frontend sem necessidade;
- duplicar dados existentes;
- expor dados privados;
- criar funcionalidades apenas por modismo;
- implementar funcionalidades futuras antes da hora;
- modificar arquitetura importante sem explicar o motivo;
- substituir uma solução Rails simples por uma solução excessivamente sofisticada.

---

# 29. Como trabalhar comigo

O Agent deve atuar como **pair programmer**.

Ao receber uma tarefa:

1. entender o objetivo;
2. verificar a arquitetura existente;
3. procurar código relacionado antes de criar algo novo;
4. reutilizar padrões já existentes;
5. propor a solução mais simples que resolva o problema;
6. implementar;
7. verificar possíveis efeitos colaterais;
8. sugerir testes quando apropriado;
9. explicar decisões arquiteturais relevantes.

Não assumir que "mais código" significa "melhor solução".

---

# 30. Regra fundamental

Antes de implementar qualquer coisa, lembrar:

> **O LivingNote deve ser simples por dentro, agradável por fora e coerente como produto.**

Cada nova funcionalidade deve fortalecer a ideia central:

> **organizar conhecimento, rotina, estudos, carreira e evolução pessoal em um único espaço.**

O objetivo não é construir o maior número possível de funcionalidades.

O objetivo é construir um sistema que o usuário realmente queira abrir todos os dias.