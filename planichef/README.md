# PlaniChef

PlaniChef é uma aplicação web de planejamento de cardápio que utiliza inteligência artificial para sugerir receitas e gerar listas de compras personalizadas.

## Requisitos

- Java 11 ou superior
- Maven
- MySQL 8.0 ou superior
- Chave de API da OpenAI

## Configuração

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/planichef.git
cd planichef
```

2. Configure o banco de dados MySQL:
- Crie um banco de dados chamado `planichef`
- Configure as credenciais no arquivo `src/main/resources/application.properties`

3. Configure a chave da API OpenAI:
- Obtenha uma chave de API em https://platform.openai.com
- Configure a variável de ambiente:
```bash
export OPENAI_API_KEY=sua-chave-api
```

4. Compile e execute a aplicação:
```bash
mvn clean package
java -jar target/planichef-1.0-SNAPSHOT-runner.jar
```

## Funcionalidades

- Cadastro de usuários com preferências e restrições alimentares
- Planejamento de cardápio semanal
- Sugestões de receitas personalizadas usando IA
- Geração automática de lista de compras
- Organização de ingredientes por categoria

## Tecnologias Utilizadas

- Java EE (Jakarta EE)
- Hibernate/JPA
- MySQL
- OpenAI API (GPT-3.5)
- Maven
- Lombok

## Contribuição

Contribuições são bem-vindas! Por favor, leia o arquivo CONTRIBUTING.md para detalhes sobre nosso código de conduta e o processo para enviar pull requests.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE.md para detalhes. 