# One for all

Neste projeto, algumas tabelas foram disponibilizadas para revisar, normalizar e popular em um banco de dados onde se possa executar queries.
Para ter acesso à está planilha, veja o arquivo no [Google Sheets](https://docs.google.com/spreadsheets/d/1wKZpqym8XZjza5AIqq-N9mjingzQS0gCn4r9nnx9Uxo/edit#gid=0).

## 🚀 Começando

> - ⚠️ É necessário ter a versão Node 16.14 ou superior instalada localmente.

<br />

<details>
  <summary><strong>🔧 Instalação</strong></summary>
<br />
  
1. Clone o repositório
  * `git clone git@github.com:Wesleyhmendes/one-for-all-back-end.git`.
  * Entre na pasta do repositório que você acabou de clonar:
    * `cd one-for-all-back-end`

2. Instale as dependências [**Caso existam**]
  * `npm install`

3. Crie uma branch a partir da branch `master`
  * Verifique que você está na branch `master`
    * Exemplo: `git branch`
  * Se não estiver, mude para a branch `master`
    * Exemplo: `git checkout master`
  * Agora crie uma branch com o nome desejado

<br />
</details>

<br />

**🐳 Iniciando a aplicação no Docker Compose**

```bash
docker-compose up -d
docker exec -it one_for_all bash
npm test # roda todos os testes
npm test -- -t "01" # rodando apenas o teste do requisito 01
```
<details>
<summary>🐳 Mais informações</summary><br>

O que cada comando faz:

- `docker-compose up -d`
  - Inicia os serviços `node` e `db`
    - Esses serviços irão inicializar um container chamado `one_for_all` e outro chamado `one_for_all_db`.
    - Ao iniciar pela primeira vez, o docker constrói a imagem do serviço `node`, instalando as dependências Node necessárias para a avaliação automatizada
- `docker exec -it one_for_all bash`
  - Acessa a linha de comando do container `one_for_all`
    - Isso dá acesso ao terminal interativo do container criado pelo compose, que está rodando em segundo plano

> As credenciais de acesso ao banco de dados estão definidas no arquivo `docker-compose.yml`, e são acessíveis no container através das variáveis de ambiente `MYSQL_USER` e `MYSQL_PASSWORD`.

</details>

<br />


**🖥️ Iniciando a aplicação localmente**

> ⚠️ **Atenção**: É necessário criar um container MySQL e passar as credenciais através de variáveis de ambiente.
>
> ⚠️ O avaliador espera que a versão do `node` utilizada seja a 16.

```bash
npm install
docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test # roda todos os testes
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test -- -t "01" # rodando apenas o teste do requisito 01
```

<details>
<summary>🖥️ Mais informações</summary><br>

O que cada comando faz:

- `npm install`
  - Instala as dependências Node necessárias para os testes do avaliador
- `docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password`
  - Cria um container MySQL com as variáveis de ambiente definidas
- `MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test`
</details>
<details>
  <summary><strong>📋 Requisitos</strong></summary>
<br />

**Desafio 1 - Normalizar essa planilha, criar as tabelas no seu banco de dados local e populá-lo;**
<br />
<br />
**Desafio 2 - Após a normalização, crie as tabelas no banco de dados**
<br />
<br />
**Desafio 3 Crie uma `QUERY` que deverá ter apenas três colunas:**
1. A primeira coluna deve possuir o alias "**pessoa_usuaria**" e exibir o nome da pessoa usuária.

2. A segunda coluna deve possuir o alias "**musicas_ouvidas**" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.

3. A terceira coluna deve possuir o alias "**total_minutos**" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.

Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.
<br />
<br />
**Desafio 4 - Crie uma `QUERY` que deve mostrar as pessoas usuárias que estavam ativas **a partir do ano de 2021**, se baseando na data mais recente no histórico de reprodução.**
1. A primeira coluna deve possuir o alias "**pessoa_usuaria**" e exibir o nome da pessoa usuária.

2. A segunda coluna deve ter o alias "**status_pessoa_usuaria**" e exibir se a pessoa usuária está ativa ou inativa.

O resultado deve estar ordenado em ordem alfabética.
<br />
<br />
**Desafio 5 - Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma `QUERY` que possua duas colunas:**
1. A primeira coluna deve possuir o alias "**cancao**" e exibir o nome da canção.

2. A segunda coluna deve possuir o alias "**reproducoes**" e exibir a quantidade de pessoas que já escutaram a canção em questão.

Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.
<br />
<br />
**Desafio 6 - Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco, queremos algumas informações sobre o faturamento da empresa. Crie uma `QUERY` que deve exibir quatro dados:**
1. A primeira coluna deve ter o alias "**faturamento_minimo**" e exibir o menor valor de plano existente para uma pessoa usuária.

2. A segunda coluna deve ter o alias "**faturamento_maximo**" e exibir o maior valor de plano existente para uma pessoa usuária.

3. A terceira coluna deve ter o alias "**faturamento_medio**" e exibir o valor médio dos planos possuídos por pessoas usuárias até o momento.

4. Por fim, a quarta coluna deve ter o alias "**faturamento_total**" e exibir o valor total obtido com os planos possuídos por pessoas usuárias.

Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando apenas duas casas decimais.
<br />
<br />
**Desafio 7 - Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, ordenada pela quantidade de seguidores que ela possui, de acordo com os detalhes a seguir. Para tal, crie uma `QUERY` com as seguintes colunas:`**
1. A primeira coluna deve exibir o nome da pessoa artista, com o alias "**artista**".

2. A segunda coluna deve exibir o nome do álbum, com o alias "**album**".

3. A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "**pessoas_seguidoras**".

Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso existam artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.
<br />
<br />
**Desafio 8 - Mostre uma relação dos álbuns produzidos por uma pessoa artista específica, neste caso `"Elis Regina"`.
Para isto crie uma `QUERY` que o retorno deve exibir as seguintes colunas:**
1. O nome da pessoa artista, com o alias "**artista**".

2. O nome do álbum, com o alias "**album**".

Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
<br />
<br />
**Desafio 9 - Crie uma `QUERY` que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico da usuária `"Barbara Liskov"` e a consulta deve retornar a seguinte coluna:**
1. O valor da quantidade, com o alias "**musicas_no_historico**".
<br />
<br />
</details>
<details>
  <summary><strong>📋 Requisitos bônus</strong></summary>
  
<br />
Você receberá uma planilha não normalizada que complementa o banco de dados do **SpotifyClone**, que é uma tabela de canções favoritas de cada pessoa usuária. O trabalho consistirá de duas partes:

1. Normalizar essa planilha, criar a tabela no seu banco de dados local e populá-lo;

2. Realizar os próximos desafios no seu banco atualizado com a tabela de canções favoritas.

<br />


**Desafio 10 - Parte 1 - Normalize a tabela da planilha SpotifyClone-fav-songs**
**Desafio 10 - Parte 2 - Após a normalização, crie a tabela no banco de dados**

- Providencie as queries necessárias para criar a tabela normalizada que atenda às regras de negócio descritas anteriormente;
- Providencie as queries necessárias para popular a tabela no banco de dados de acordo com as dados da planilha fornecida anteriormente;

- Ajuste o arquivo de configurações `desafio10.json`, que mapeará a nova tabela para a avaliação automatizada deste desafio.
<br />
<br />

**Desafio 11 - Crie uma `QUERY` que exibe o top 3 de álbuns com as músicas que mais foram favoritadas.**
O resultado deve possuir duas colunas:

1. `album`: O nome do álbum

2. `favoritadas`: Quantas vezes as músicas do álbum foram favoritadas
<br />
<br />

**Desafio 12 - Crie uma `QUERY` que exibe um ranking de artistas baseado na quantidade de favoritadas em suas músicas.**
O resultado deve possuir duas colunas:

1. `artista`: O nome da pessoa artista

2. `ranking`: Uma classificação definida pela quantidade de favoritadas as canções da pessoa artista receberam, como segue:

    | ranking | quantidade de favoritadas em canções |
    |---------|--------------------------------------|
    | A       | 5 ou mais                            |
    | B       | 3 - 4                                |
    | C       | 1 - 2                                |
    | -       | 0                                    |

Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de favoritadas. Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética.
<br />
<br />

**Desafio 13 - Crie uma `QUERY` que exibe uma relação da quantidade total de pessoas usuárias e favoritadas por faixa etária.**
O resultado deve possuir três colunas:

1. `faixa_etaria`: A faixa etária das pessoas usuárias, sendo elas:
   - `Até 30 anos`
   - `Entre 31 e 60 anos`
   - `Maior de 60 anos`

2. `total_pessoas_usuarias`: O total de pessoas usuárias na respectiva faixa etária

3. `total_favoritadas`: O total de favoritadas realizadas pelas pessoas usuárias da respectiva faixa etária

Seu resultado deve estar ordenado de acordo com a sequência das faixas etárias descritas acima.
<br />
<br />
</details>

## 🛠️ Construído com

Mencione as ferramentas que você usou para criar seu projeto

* [npm](https://www.npmjs.com/) - Gerente de Dependência

## 📌 Versão

Nós usamos [Docker](https://www.docker.com/) para controle de versão.

## ✒️ Autores

* **Wesley Mendes** - *Trabalho Inicial* - [Wesley Mendes](https://github.com/Wesleyhmendes)
