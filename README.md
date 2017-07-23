# Puppis
Sistema para gestão financeira e comercial

O **Puppis** foi desenvolvido utilizando a linguagem **Java** como *back-end* e integrado com o **PostgresQL** como banco de dados, na parte do front foi utilizado o framework **[Stilize](http://stilize.matheuscastiglioni.com.br/)** para CSS e **[Jlib](http://jlib.matheuscastiglioni.com.br/)** para JS, para geração de relatórios foi utilizadao **JasperSoftStudio**.

Pré requisítos:
- PostgresQL
- Java 8
- Tomcat(7, 8 ou 9)

Para começar a utilizar crie um banco de dados no PostgresQL:

```
su postgres
// password
createdb MEU_BANCO_DE_DADOS
```

Feito isso dentro do projeto encontra-se a pasta com a criação de todas as tabelas e inserts necessários para começar a utilizar, `src/main/dbsql`, localize o arquivo `PUPPIS_CREATE.sql`, basta copiar o seu conteúdo e rodar no banco de dados criado anteriormente.

Depois de realizar a criação e insertes necessários para começar a utilizar, devemos mudar o nome do banco de dados no arquivo `persistence.xml` localizado em `src/main/resource/META-INF`, localizar a conexo do **PostgresQL** e mudar a seguinte linha:

De:
```
<property name="javax.persistence.jdbc.url" value="jdbc:postgresql://127.0.0.1:5432/PUPPIS"/>
```

Para:
```
<property name="javax.persistence.jdbc.url" value="jdbc:postgresql://127.0.0.1:5432/MEU_BANCO_DE_DADOS"/>
```

Com as configurações do banco de dados prontas, agora precisamos apenas subir a aplicação. Para isso dentro da pasta `target` encontrase o arquivo `puppis.war`, o mesmo deve ser copiado para dentro da pasta `webapps` do **tomcat**, feito isso basta subir o container:

```
cd /PASTA_TOMCAT/bin
./catalina.sh start
```

Agora basta acessar a aplicação na porta `8080`

[http://localhost:8080/puppis](http://localhost:8080/puppis/login/formulario)

E utilizar o sistema
