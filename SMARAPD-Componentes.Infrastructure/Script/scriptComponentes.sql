IF OBJECT_ID('Parametro') IS NOT NULL DROP TABLE Parametro
CREATE TABLE Parametro
(
   id INT PRIMARY KEY IDENTITY,
   idcomponente INT NOT NULL,
   idtipo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   descricao VARCHAR(350),
   obrigatorio BIT NOT NULL DEFAULT(0),
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

IF OBJECT_ID('ParametroMetodo') IS NOT NULL DROP TABLE ParametroMetodo
CREATE TABLE ParametroMetodo
(
   id INT PRIMARY KEY IDENTITY,
   idmetodo INT NOT NULL,
   idtipo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   descricao VARCHAR(350),
   obrigatorio BIT NOT NULL DEFAULT(0),
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

IF OBJECT_ID('ParametroEvento') IS NOT NULL DROP TABLE ParametroEvento
CREATE TABLE ParametroEvento
(
   id INT PRIMARY KEY IDENTITY,
   idevento INT NOT NULL,
   idtipo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   descricao VARCHAR(350),
   obrigatorio BIT NOT NULL DEFAULT(0),
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

IF OBJECT_ID('ComponenteTag') IS NOT NULL DROP TABLE ComponenteTag
CREATE TABLE ComponenteTag
(
   id INT PRIMARY KEY IDENTITY,
   idcomponente INT NOT NULL,
   idtag INT NOT NULL
)
GO

IF OBJECT_ID('Tag') IS NOT NULL DROP TABLE Tag
CREATE TABLE Tag
(
   id INT PRIMARY KEY IDENTITY,
   nome VARCHAR(100) NOT NULL
)
GO

IF OBJECT_ID('Metodo') IS NOT NULL DROP TABLE Metodo
CREATE TABLE Metodo
(
   id INT PRIMARY KEY IDENTITY,
   idcomponente INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   descricao VARCHAR(350),
   idtiporetorno INT NOT NULL,
   exemplo VARCHAR(MAX),
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

IF OBJECT_ID('Evento') IS NOT NULL DROP TABLE Evento
CREATE TABLE Evento
(
   id INT PRIMARY KEY IDENTITY,
   idcomponente INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   descricao VARCHAR(350),
   exemplo VARCHAR(MAX),
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

IF OBJECT_ID('Componente') IS NOT NULL DROP TABLE Componente
CREATE TABLE Componente
(
   id INT PRIMARY KEY IDENTITY,
   idusuario INT NOT NULL, 
   idframework INT NOT NULL,
   idcategoria INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   descricao VARCHAR(1000),
   exemplo VARCHAR(MAX),
   observacao VARCHAR(MAX),
   arquivo VARCHAR(150),
   publicado BIT NOT NULL DEFAULT(0),
   status VARCHAR(50) NOT NULL,
   datacriacao DATETIME NOT NULL DEFAULT GETDATE(),
   imageurl VARCHAR(500),
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

IF OBJECT_ID('Framework') IS NOT NULL DROP TABLE Framework
CREATE TABLE Framework
(
   id INT PRIMARY KEY IDENTITY,
   nome VARCHAR(100) NOT NULL,
   icone VARCHAR(150) NOT NULL DEFAULT ('fas fa-question') 
)
GO

IF OBJECT_ID('Categoria') IS NOT NULL DROP TABLE Categoria
CREATE TABLE Categoria
(
   id   INT PRIMARY KEY IDENTITY,
   nome VARCHAR(50) NOT NULL,
   icone VARCHAR(150) NOT NULL DEFAULT ('fas fa-question')
)
GO

IF OBJECT_ID('Usuario') IS NOT NULL DROP TABLE Usuario
CREATE TABLE Usuario
(
   id INT PRIMARY KEY IDENTITY,
   nome VARCHAR(100) NOT NULL,
   login VARCHAR(20) NOT NULL,
   email VARCHAR(100) NOT NULL,
   senha VARCHAR(70) NOT NULL,
   superusuario BIT NOT NULL DEFAULT(0),
   autorizado   BIT NOT NULL DEFAULT(0),
   imageurl VARCHAR(500)
)
GO

ALTER TABLE Componente
ADD FOREIGN KEY (idusuario) REFERENCES Usuario(id)
GO

ALTER TABLE Componente
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

ALTER TABLE Componente
ADD FOREIGN KEY (idcategoria) REFERENCES Categoria(id)
GO

ALTER TABLE ComponenteTag
ADD FOREIGN KEY (idcomponente) REFERENCES Componente(id) ON DELETE CASCADE
GO

ALTER TABLE ComponenteTag
ADD FOREIGN KEY (idtag) REFERENCES Tag(id) ON DELETE CASCADE
GO

ALTER TABLE Metodo
ADD FOREIGN KEY (idcomponente) REFERENCES Componente(id) ON DELETE CASCADE
GO

ALTER TABLE Metodo
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

ALTER TABLE Evento
ADD FOREIGN KEY (idcomponente) REFERENCES Componente(id) ON DELETE CASCADE
GO

ALTER TABLE Evento
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

ALTER TABLE Parametro
ADD FOREIGN KEY (idcomponente) REFERENCES Componente(id) ON DELETE CASCADE
GO

ALTER TABLE Parametro
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

ALTER TABLE ParametroMetodo
ADD FOREIGN KEY (idmetodo) REFERENCES Metodo(id) ON DELETE CASCADE
GO

ALTER TABLE ParametroMetodo
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

ALTER TABLE ParametroEvento
ADD FOREIGN KEY (idevento) REFERENCES Evento(id) ON DELETE CASCADE
GO

ALTER TABLE ParametroEvento
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

IF OBJECT_ID('Dependencia') IS NOT NULL DROP TABLE Dependencia
CREATE TABLE Dependencia
(
   id INT PRIMARY KEY IDENTITY,
   nome VARCHAR(100) NOT NULL,
   versao VARCHAR(30) NOT NULL,
   status VARCHAR(50) NOT NULL,
   url VARCHAR(1000) NULL
)
GO

IF OBJECT_ID('ComponenteDependencia') IS NOT NULL DROP TABLE ComponenteDependencia
CREATE TABLE ComponenteDependencia
(
   id INT PRIMARY KEY IDENTITY,
   iddependencia INT NOT NULL,
   idcomponente INT NOT NULL,
   idusuario_ultima_alteracao INT NOT NULL,
   data_ultima_alteracao DATETIME NOT NULL DEFAULT GETDATE()
)
GO

ALTER TABLE ComponenteDependencia
ADD FOREIGN KEY (iddependencia) REFERENCES Dependencia(id) ON DELETE CASCADE
GO

ALTER TABLE ComponenteDependencia
ADD FOREIGN KEY (idcomponente) REFERENCES Componente(id) ON DELETE CASCADE
GO

ALTER TABLE ComponenteDependencia
ADD FOREIGN KEY (idusuario_ultima_alteracao) REFERENCES Usuario(id)
GO

IF OBJECT_ID('Tipo') IS NOT NULL DROP TABLE Tipo
CREATE TABLE Tipo
(
   id INT PRIMARY KEY IDENTITY,
   nome VARCHAR(50) NOT NULL,
   tipoRetorno BIT NOT NULL DEFAULT(0),
   tipoParametro BIT NOT NULL DEFAULT(0)
)
GO

ALTER TABLE ParametroMetodo
ADD FOREIGN KEY (idtipo) REFERENCES Tipo(id)
GO

ALTER TABLE ParametroEvento
ADD FOREIGN KEY (idtipo) REFERENCES Tipo(id)
GO

ALTER TABLE Parametro
ADD FOREIGN KEY (idtipo) REFERENCES Tipo(id)
GO

ALTER TABLE Metodo
ADD FOREIGN KEY (idtiporetorno) REFERENCES Tipo(id)
GO

-- LOG

IF OBJECT_ID('dbo.ComponenteLog') IS NOT NULL DROP TABLE dbo.ComponenteLog
CREATE TABLE ComponenteLog
(
   id INT PRIMARY KEY IDENTITY(1,1),
   idcomponente INT NOT NULL,
   nomecomponente VARCHAR(100) NOT NULL, 
   [login] VARCHAR(20),
   operacao VARCHAR(20) NOT NULL,
   tabela VARCHAR(50) NOT NULL,
   [data] DATETIME NOT NULL DEFAULT(GETDATE()),
   [log] VARCHAR(MAX) NOT NULL,
)
GO

IF OBJECT_ID('dbo.Compare') IS NOT NULL DROP FUNCTION dbo.Compare
GO
CREATE FUNCTION dbo.Compare (@firstString VARCHAR(MAX), @secondString VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
   RETURN (CASE WHEN RTRIM(LTRIM(@firstString)) = RTRIM(LTRIM(@secondString)) THEN 1 ELSE 0 END)
END
GO

IF OBJECT_ID('dbo.LogComponente') IS NOT NULL DROP TRIGGER dbo.LogComponente
GO
CREATE TRIGGER LogComponente ON Componente FOR INSERT, UPDATE, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'Componente'

   IF EXISTS (SELECT 'TRUE' FROM inserted) AND 
      EXISTS (SELECT 'TRUE' FROM deleted)
   BEGIN
   
      DECLARE @houveAlteracao BIT
      
      SELECT @houveAlteracao = CASE 
                                  WHEN dbo.Compare(del.nome, ins.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 OR
                                       dbo.Compare(catIns.nome, catDel.nome) = 0 OR
                                       dbo.Compare(frameIns.nome, frameDel.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.exemplo, ''), ISNULL(ins.exemplo, '')) = 0 OR
                                       dbo.Compare(ISNULL(del.observacao, ''), ISNULL(ins.observacao, '')) = 0 OR
                                       dbo.Compare(ISNULL(del.arquivo, ''), ISNULL(ins.arquivo, '')) = 0 OR
                                       del.publicado <> ins.publicado OR
                                       dbo.Compare(del.status, ins.status) = 0 OR
                                       dbo.Compare(ISNULL(del.imageurl, ''), ISNULL(ins.imageurl, '')) = 0 OR
                                       del.datacriacao <> ins.datacriacao
                                  THEN 1
                                  ELSE 0
                               END     
        FROM inserted ins
       INNER JOIN deleted del on del.id = ins.id
       INNER JOIN Categoria catIns on catIns.id = ins.idcategoria
       INNER JOIN Framework frameIns on frameIns.id = ins.idframework
       INNER JOIN Categoria catDel on catDel.id = ins.idcategoria
       INNER JOIN Framework frameDel on frameDel.id = ins.idframework

      -- ALTEROU O COMPONENTE     
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, ins.id, ins.nome, 'UPDATE', @tabela,
      log = 'Alteração'+ CHAR(13) +
            CASE 
               WHEN dbo.Compare(del.nome, ins.nome) = 0 
               THEN 'Nome - De: ' + RTRIM(del.nome) + 
                    ' Para: ' + RTRIM(ins.nome) + CHAR(13) 
               ELSE '' 
               END + 
            CASE 
               WHEN dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 
               THEN 'Descrição - De: ' + RTRIM(ISNULL(del.descricao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.descricao, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(catIns.nome, catDel.nome) = 0 
               THEN 'Categoria - De: ' + RTRIM(catDel.nome) + 
                    ' Para: ' + RTRIM(catIns.nome) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(frameIns.nome, frameDel.nome) = 0 
               THEN 'Framework - De: ' + RTRIM(frameDel.nome) + 
                    ' Para: ' + RTRIM(frameIns.nome) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(ISNULL(del.exemplo, ''), ISNULL(ins.exemplo, '')) = 0 
               THEN 'Exemplo - De :' + RTRIM(ISNULL(del.exemplo, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.exemplo, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(ISNULL(del.observacao, ''), ISNULL(ins.observacao, '')) = 0 
               THEN 'Observação - De: ' + RTRIM(ISNULL(del.observacao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.observacao, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(ISNULL(del.arquivo, ''), ISNULL(ins.arquivo, '')) = 0 
               THEN 'Arquivo - De: ' + RTRIM(ISNULL(del.arquivo, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.arquivo, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN del.publicado <> ins.publicado 
               THEN 'Publicado - De: ' + CASE WHEN del.publicado = 1 
                                              THEN 'Sim' 
                                              ELSE 'Não' 
                                         END + 
                    ' Para: ' + CASE WHEN ins.publicado = 1 
                                     THEN 'Sim' 
                                     ELSE 'Não' 
                                     END + CHAR(13)
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(del.status, ins.status) = 0 
               THEN 'Status - De: ' + RTRIM(del.status) + 
                    ' Para: ' + RTRIM(ins.status) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN dbo.Compare(ISNULL(del.imageurl, ''), ISNULL(ins.imageurl, '')) = 0 
               THEN 'ImageUrl - De: ' + RTRIM(ISNULL(del.imageurl, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.imageurl, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN del.datacriacao <> ins.datacriacao 
               THEN 'Data de Criação - De: ' + RTRIM(del.datacriacao) + 
                    ' Para: ' + RTRIM(ins.datacriacao) + CHAR(13) 
               ELSE '' 
               END
        FROM inserted ins
       INNER JOIN deleted del ON del.id = ins.id
       INNER JOIN Categoria catIns ON catIns.id = ins.idcategoria
       INNER JOIN Framework frameIns ON frameIns.id = ins.idframework
       INNER JOIN Categoria catDel ON catDel.id = ins.idcategoria
       INNER JOIN Framework frameDel ON frameDel.id = ins.idframework
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       WHERE @houveAlteracao = 1
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM inserted)
      BEGIN      
         -- INSERIU O COMPONENTE
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, ins.id, ins.nome, 'INSERT', @tabela,
                log = 'Criação'+ CHAR(13) +
                      'Nome: ' + RTRIM(ins.nome) + CHAR(13) +
                      ISNULL('Descrição: ' + RTRIM(ins.descricao)  + CHAR(13), '') +
                      'Categoria: ' + RTRIM(cat.nome) + CHAR(13) +
                      'Framework: ' + RTRIM(frame.nome) + CHAR(13) +
                      ISNULL('Exemplo: ' + RTRIM(ins.exemplo) + CHAR(13), '') +
                      ISNULL('Observação: ' + RTRIM(ins.observacao) + CHAR(13), '') +
                      ISNULL('Arquivo: ' + RTRIM(ins.arquivo) + CHAR(13), '') +
                      'Publicado: ' + CASE 
                                         WHEN ins.publicado = 1 
                                         THEN 'Sim' 
                                         ELSE 'Não' 
                                      END + CHAR(13) +
                      'Status: ' + RTRIM(ins.status) + CHAR(13) +
                      ISNULL('ImageUrl: ' + RTRIM(ins.imageurl) + CHAR(13), '') +
                      'Data de Criação: ' + RTRIM(GETDATE())
           FROM inserted ins
          INNER JOIN Categoria cat on cat.id = ins.idcategoria
          INNER JOIN Framework frame on frame.id = ins.idframework
          INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
      END
      ELSE
      BEGIN
         IF EXISTS(SELECT 'TRUE' FROM deleted)
         BEGIN
            -- DELETOU O COMPONENTE
            INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
            SELECT usr.login, del.id, del.nome, 'DELETE', @tabela, 'Deleção do componente ' + RTRIM(del.nome)
              FROM deleted del
             INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
         END
      END
   END
END
GO

IF OBJECT_ID('dbo.LogMetodo') IS NOT NULL DROP TRIGGER dbo.LogMetodo
GO
CREATE TRIGGER LogMetodo ON Metodo FOR INSERT, UPDATE, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'Metodo'

   IF EXISTS (SELECT 'TRUE' FROM inserted) AND 
      EXISTS (SELECT 'TRUE' FROM deleted)
   BEGIN
   
      DECLARE @houveAlteracao BIT
      
      SELECT @houveAlteracao = CASE 
                                  WHEN dbo.Compare(del.nome, ins.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 OR
                                       dbo.Compare(ISNULL(del.exemplo, ''), ISNULL(ins.exemplo, '')) = 0 OR
                                       del.idtiporetorno <> ins.idtiporetorno
                                  THEN 1
                                  ELSE 0
                               END     
        FROM inserted ins
       INNER JOIN deleted del on del.id = ins.id

      -- ALTEROU O MÉTODO     
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, comp.id, comp.nome, 'UPDATE', @tabela,
      log = 'Alteração'+ CHAR(13) +
            CASE 
               WHEN dbo.Compare(del.nome, ins.nome) = 0 
               THEN 'Nome - De: ' + RTRIM(del.nome) + 
                    ' Para: ' + RTRIM(ins.nome) + CHAR(13) 
               ELSE '' 
               END + 
            CASE 
               WHEN dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 
               THEN 'Descrição - De: ' + RTRIM(ISNULL(del.descricao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.descricao, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE
               WHEN dbo.Compare(ISNULL(del.exemplo, ''), ISNULL(ins.exemplo, '')) = 0 
               THEN 'Exemplo - De :' + RTRIM(ISNULL(del.exemplo, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.exemplo, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE 
               WHEN del.idtiporetorno <> ins.idtiporetorno
               THEN 'Retorno  - De: ' + RTRIM(tipoDel.nome) + 
                    ' Para: ' + RTRIM(tipoIns.nome) + CHAR(13) 
               ELSE '' 
               END
        FROM inserted ins
       INNER JOIN deleted del ON del.id = ins.id
       INNER JOIN Tipo tipoDel ON tipoDel.id = del.idtiporetorno
       INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtiporetorno
       INNER JOIN Componente comp ON comp.id = ins.idcomponente
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       WHERE @houveAlteracao = 1
       
       UPDATE Componente
          SET data_ultima_alteracao = ins.data_ultima_alteracao
         FROM inserted ins 
        WHERE Componente.id = ins.idcomponente
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM inserted)
      BEGIN      
         -- INSERIU O MÉTODO
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, comp.id, comp.nome, 'INSERT', @tabela,
                log = 'Criação'+ CHAR(13) +
                      'Nome: ' + RTRIM(ins.nome) + CHAR(13) +
                      ISNULL('Descrição: ' + RTRIM(ins.descricao)  + CHAR(13), '') +
                      ISNULL('Exemplo: ' + RTRIM(ins.exemplo) + CHAR(13), '') +
                      'Retorno: ' + RTRIM(tipo.nome)
           FROM inserted ins
          INNER JOIN Tipo tipo ON tipo.id = ins.idtiporetorno
          INNER JOIN Componente comp ON comp.id = ins.idcomponente
          INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
          
         UPDATE Componente
            SET data_ultima_alteracao = ins.data_ultima_alteracao
          FROM inserted ins 
         WHERE Componente.id = ins.idcomponente
      END
      ELSE
      BEGIN
         IF EXISTS(SELECT 'TRUE' FROM deleted)
         BEGIN
            -- DELETOU O MÉTODO
            INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
            SELECT usr.login, comp.id, comp.nome, 'DELETE', @tabela, 'Deleção do método ' + RTRIM(del.nome)
              FROM deleted del
              INNER JOIN Componente comp ON comp.id = del.idcomponente
              INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
              
            UPDATE Componente
               SET data_ultima_alteracao = del.data_ultima_alteracao
              FROM deleted del 
             WHERE Componente.id = del.idcomponente
         END
      END
   END
END
GO

IF OBJECT_ID('dbo.LogEvento') IS NOT NULL DROP TRIGGER dbo.LogEvento
GO
CREATE TRIGGER LogEvento ON Evento FOR INSERT, UPDATE, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'Evento'

   IF EXISTS (SELECT 'TRUE' FROM inserted) AND 
      EXISTS (SELECT 'TRUE' FROM deleted)
   BEGIN
   
      DECLARE @houveAlteracao BIT
      
      SELECT @houveAlteracao = CASE 
                                  WHEN dbo.Compare(del.nome, ins.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 OR
                                       dbo.Compare(ISNULL(del.exemplo, ''), ISNULL(ins.exemplo, '')) = 0
                                  THEN 1
                                  ELSE 0
                               END     
        FROM inserted ins
       INNER JOIN deleted del on del.id = ins.id

      -- ALTEROU O EVENTO     
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, comp.id, comp.nome, 'UPDATE', @tabela,
      log = 'Alteração'+ CHAR(13) +
            CASE 
               WHEN dbo.Compare(del.nome, ins.nome) = 0 
               THEN 'Nome - De: ' + RTRIM(del.nome) + 
                    ' Para: ' + RTRIM(ins.nome) + CHAR(13) 
               ELSE '' 
               END + 
            CASE 
               WHEN dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 
               THEN 'Descrição - De: ' + RTRIM(ISNULL(del.descricao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.descricao, '')) + CHAR(13) 
               ELSE '' 
               END +
            CASE
               WHEN dbo.Compare(ISNULL(del.exemplo, ''), ISNULL(ins.exemplo, '')) = 0 
               THEN 'Exemplo - De :' + RTRIM(ISNULL(del.exemplo, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.exemplo, '')) + CHAR(13) 
               ELSE '' 
               END
        FROM inserted ins
       INNER JOIN deleted del ON del.id = ins.id
       INNER JOIN Componente comp ON comp.id = ins.idcomponente
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       WHERE @houveAlteracao = 1
       
      UPDATE Componente
         SET data_ultima_alteracao = ins.data_ultima_alteracao
        FROM inserted ins 
       WHERE Componente.id = ins.idcomponente
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM inserted)
      BEGIN      
         -- INSERIU O EVENTO
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, comp.id, comp.nome, 'INSERT', @tabela,
                log = 'Criação'+ CHAR(13) +
                      'Nome: ' + RTRIM(ins.nome) + CHAR(13) +
                      ISNULL('Descrição: ' + RTRIM(ins.descricao)  + CHAR(13), '') +
                      ISNULL('Exemplo: ' + RTRIM(ins.exemplo), '')
           FROM inserted ins
          INNER JOIN Componente comp ON comp.id = ins.idcomponente
          INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
          
         UPDATE Componente
            SET data_ultima_alteracao = ins.data_ultima_alteracao
           FROM inserted ins 
          WHERE Componente.id = ins.idcomponente
      END
      ELSE
      BEGIN
         IF EXISTS(SELECT 'TRUE' FROM deleted)
         BEGIN
            -- DELETOU O EVENTO
            INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
            SELECT usr.login, comp.id, comp.nome, 'DELETE', @tabela, 'Deleção do evento ' + RTRIM(del.nome)
              FROM deleted del
              INNER JOIN Componente comp ON comp.id = del.idcomponente
              INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
              
            UPDATE Componente
               SET data_ultima_alteracao = del.data_ultima_alteracao
              FROM deleted del 
             WHERE Componente.id = del.idcomponente
         END
      END
   END
END
GO

IF OBJECT_ID('dbo.LogParametro') IS NOT NULL DROP TRIGGER dbo.LogParametro
GO
CREATE TRIGGER LogParametro ON Parametro FOR INSERT, UPDATE, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'Parametro'

   IF EXISTS (SELECT 'TRUE' FROM inserted) AND 
      EXISTS (SELECT 'TRUE' FROM deleted)
   BEGIN
   
      DECLARE @houveAlteracao BIT
      
      SELECT @houveAlteracao = CASE 
                                  WHEN dbo.Compare(del.nome, ins.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 OR
                                       del.obrigatorio <> ins.obrigatorio OR
                                       del.idtipo <> ins.idtipo
                                  THEN 1
                                  ELSE 0
                               END     
        FROM inserted ins
       INNER JOIN deleted del on del.id = ins.id

      -- ALTEROU O PARAMETRO
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, comp.id, comp.nome, 'UPDATE', @tabela,
      log = 'Alteração'+ CHAR(13) +
            CASE 
               WHEN dbo.Compare(del.nome, ins.nome) = 0 
               THEN 'Nome - De: ' + RTRIM(del.nome) + 
                    ' Para: ' + RTRIM(ins.nome) + CHAR(13) 
               ELSE '' 
            END + 
            CASE 
               WHEN dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 
               THEN 'Descrição - De: ' + RTRIM(ISNULL(del.descricao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.descricao, '')) + CHAR(13) 
               ELSE '' 
            END +
            CASE
               WHEN del.obrigatorio <> ins.obrigatorio
               THEN 'Obrigatório - De :' + CASE 
                                              WHEN del.obrigatorio = 1 
                                              THEN 'Sim' 
                                              ELSE 'Não' 
                                           END + 
                    ' Para: ' + CASE 
                                   WHEN ins.obrigatorio = 1 
                                   THEN 'Sim' 
                                   ELSE 'Não' 
                                END + CHAR(13) 
               ELSE '' 
            END +
            CASE 
               WHEN del.idtipo <> ins.idtipo
               THEN 'Tipo - De: ' + RTRIM(tipoDel.nome) + 
                    ' Para: ' + RTRIM(tipoIns.nome)
               ELSE '' 
            END
        FROM inserted ins
       INNER JOIN deleted del ON del.id = ins.id
       INNER JOIN Componente comp ON comp.id = ins.idcomponente
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       INNER JOIN Tipo tipoDel ON tipoDel.id = del.idtipo
       INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtipo
       WHERE @houveAlteracao = 1
       
      UPDATE Componente
         SET data_ultima_alteracao = ins.data_ultima_alteracao
        FROM inserted ins 
       WHERE Componente.id = ins.idcomponente
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM inserted)
      BEGIN      
         -- INSERIU O PARAMETRO
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, comp.id, comp.nome, 'INSERT', @tabela,
                log = 'Criação'+ CHAR(13) +
                      'Nome: ' + RTRIM(ins.nome) + CHAR(13) +
                      ISNULL('Descrição: ' + RTRIM(ins.descricao)  + CHAR(13), '') +
                      'Obrigatório: ' + CASE 
                                           WHEN ins.obrigatorio = 1 
                                           THEN 'Sim' 
                                           ELSE 'Não' 
                                        END + CHAR(13) +
                      'Tipo: ' + RTRIM(tipoIns.nome)
           FROM inserted ins
          INNER JOIN Componente comp ON comp.id = ins.idcomponente
          INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
          INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtipo
          
         UPDATE Componente
            SET data_ultima_alteracao = ins.data_ultima_alteracao
           FROM inserted ins 
          WHERE Componente.id = ins.idcomponente
      END
      ELSE
      BEGIN
         IF EXISTS(SELECT 'TRUE' FROM deleted)
         BEGIN
            -- DELETOU O PARAMETRO
            INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
            SELECT usr.login, comp.id, comp.nome, 'DELETE', @tabela, 'Deleção do parâmetro ' + RTRIM(del.nome)
              FROM deleted del
              INNER JOIN Componente comp ON comp.id = del.idcomponente
              INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
              
            UPDATE Componente
               SET data_ultima_alteracao = del.data_ultima_alteracao
              FROM deleted del 
             WHERE Componente.id = del.idcomponente
         END
      END
   END
END
GO

IF OBJECT_ID('dbo.LogParametroMetodo') IS NOT NULL DROP TRIGGER dbo.LogParametroMetodo
GO
CREATE TRIGGER LogParametroMetodo ON ParametroMetodo FOR INSERT, UPDATE, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'ParametroMetodo'

   IF EXISTS (SELECT 'TRUE' FROM inserted) AND 
      EXISTS (SELECT 'TRUE' FROM deleted)
   BEGIN
   
      DECLARE @houveAlteracao BIT
      
      SELECT @houveAlteracao = CASE 
                                  WHEN dbo.Compare(del.nome, ins.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 OR
                                       del.obrigatorio <> ins.obrigatorio OR
                                       del.idtipo <> ins.idtipo
                                  THEN 1
                                  ELSE 0
                               END     
        FROM inserted ins
       INNER JOIN deleted del on del.id = ins.id

      -- ALTEROU O PARAMETRO MÉTODO
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, comp.id, comp.nome, 'UPDATE', @tabela,
      log = 'Método: ' + RTRIM(met.nome) + CHAR(13) +
	        'Alteração'+ CHAR(13) +
            CASE 
               WHEN dbo.Compare(del.nome, ins.nome) = 0 
               THEN 'Nome - De: ' + RTRIM(del.nome) + 
                    ' Para: ' + RTRIM(ins.nome) + CHAR(13) 
               ELSE '' 
            END + 
            CASE 
               WHEN dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 
               THEN 'Descrição - De: ' + RTRIM(ISNULL(del.descricao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.descricao, '')) + CHAR(13) 
               ELSE '' 
            END +
            CASE
               WHEN del.obrigatorio <> ins.obrigatorio
               THEN 'Obrigatório - De :' + CASE 
                                              WHEN del.obrigatorio = 1 
                                              THEN 'Sim' 
                                              ELSE 'Não' 
                                           END + 
                    ' Para: ' + CASE 
                                   WHEN ins.obrigatorio = 1 
                                   THEN 'Sim' 
                                   ELSE 'Não' 
                                END + CHAR(13) 
               ELSE '' 
            END +
            CASE 
               WHEN del.idtipo <> ins.idtipo
               THEN 'Tipo - De: ' + RTRIM(tipoDel.nome) + 
                    ' Para: ' + RTRIM(tipoIns.nome)
               ELSE '' 
            END
        FROM inserted ins
       INNER JOIN deleted del ON del.id = ins.id
       INNER JOIN Metodo met ON met.id = ins.idmetodo
       INNER JOIN Componente comp ON comp.id = met.idcomponente
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       INNER JOIN Tipo tipoDel ON tipoDel.id = del.idtipo
       INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtipo
       WHERE @houveAlteracao = 1
       
      UPDATE Componente
         SET data_ultima_alteracao = ins.data_ultima_alteracao
        FROM inserted ins 
       INNER JOIN Metodo met ON met.id = ins.idmetodo
       WHERE Componente.id = met.idcomponente
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM inserted)
      BEGIN      
         -- INSERIU O PARAMETRO MÉTODO
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, comp.id, comp.nome, 'INSERT', @tabela,
                log = 'Método: ' + RTRIM(met.nome) + CHAR(13) +
					  'Criação'+ CHAR(13) +
                      'Nome: ' + RTRIM(ins.nome) + CHAR(13) +
                      ISNULL('Descrição: ' + RTRIM(ins.descricao)  + CHAR(13), '') +
                      'Obrigatório: ' + CASE 
                                           WHEN ins.obrigatorio = 1 
                                           THEN 'Sim' 
                                           ELSE 'Não' 
                                        END + CHAR(13) +
                      'Tipo: ' + RTRIM(tipoIns.nome)
           FROM inserted ins
          INNER JOIN Metodo met ON met.id = ins.idmetodo
          INNER JOIN Componente comp ON comp.id = met.idcomponente
          INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
          INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtipo
          
         UPDATE Componente
            SET data_ultima_alteracao = ins.data_ultima_alteracao
           FROM inserted ins 
          INNER JOIN Metodo met ON met.id = ins.idmetodo
          WHERE Componente.id = met.idcomponente
      END
      ELSE
      BEGIN
         IF EXISTS(SELECT 'TRUE' FROM deleted)
         BEGIN
            -- DELETOU O PARAMETRO MÉTODO
            INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
            SELECT usr.login, comp.id, comp.nome, 'DELETE', @tabela, 'Deleção do parâmetro: ' + RTRIM(del.nome) + ' do método: ' + RTRIM(met.nome)
              FROM deleted del
              INNER JOIN Metodo met ON met.id = del.idmetodo
              INNER JOIN Componente comp ON comp.id = met.idcomponente
              INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
              
            UPDATE Componente
               SET data_ultima_alteracao = del.data_ultima_alteracao
              FROM deleted del 
             INNER JOIN Metodo met ON met.id = del.idmetodo
             WHERE Componente.id = met.idcomponente       
         END
      END
   END
END
GO

IF OBJECT_ID('dbo.LogParametroEvento') IS NOT NULL DROP TRIGGER dbo.LogParametroEvento
GO
CREATE TRIGGER LogParametroEvento ON ParametroEvento FOR INSERT, UPDATE, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'ParametroEvento'

   IF EXISTS (SELECT 'TRUE' FROM inserted) AND 
      EXISTS (SELECT 'TRUE' FROM deleted)
   BEGIN
   
      DECLARE @houveAlteracao BIT
      
      SELECT @houveAlteracao = CASE 
                                  WHEN dbo.Compare(del.nome, ins.nome) = 0 OR
                                       dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 OR
                                       del.obrigatorio <> ins.obrigatorio OR
                                       del.idtipo <> ins.idtipo
                                  THEN 1
                                  ELSE 0
                               END     
        FROM inserted ins
       INNER JOIN deleted del on del.id = ins.id

      -- ALTEROU O PARAMETRO EVENTO
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, comp.id, comp.nome, 'UPDATE', @tabela,
      log = 'Evento: ' + RTRIM(even.nome) + CHAR(13) +
            'Alteração'+ CHAR(13) +
            CASE 
               WHEN dbo.Compare(del.nome, ins.nome) = 0 
               THEN 'Nome - De: ' + RTRIM(del.nome) + 
                    ' Para: ' + RTRIM(ins.nome) + CHAR(13) 
               ELSE '' 
            END + 
            CASE 
               WHEN dbo.Compare(ISNULL(del.descricao, ''), ISNULL(ins.descricao, '')) = 0 
               THEN 'Descrição - De: ' + RTRIM(ISNULL(del.descricao, '')) + 
                    ' Para: ' + RTRIM(ISNULL(ins.descricao, '')) + CHAR(13) 
               ELSE '' 
            END +
            CASE
               WHEN del.obrigatorio <> ins.obrigatorio
               THEN 'Obrigatório - De :' + CASE 
                                              WHEN del.obrigatorio = 1 
                                              THEN 'Sim' 
                                              ELSE 'Não' 
                                           END + 
                    ' Para: ' + CASE 
                                   WHEN ins.obrigatorio = 1 
                                   THEN 'Sim' 
                                   ELSE 'Não' 
                                END + CHAR(13) 
               ELSE '' 
            END +
            CASE 
               WHEN del.idtipo <> ins.idtipo
               THEN 'Tipo - De: ' + RTRIM(tipoDel.nome) + 
                    ' Para: ' + RTRIM(tipoIns.nome)
               ELSE '' 
            END
        FROM inserted ins
       INNER JOIN deleted del ON del.id = ins.id
       INNER JOIN Evento even ON even.id = ins.idevento
       INNER JOIN Componente comp ON comp.id = even.idcomponente
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       INNER JOIN Tipo tipoDel ON tipoDel.id = del.idtipo
       INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtipo
       WHERE @houveAlteracao = 1
       
      UPDATE Componente
         SET data_ultima_alteracao = ins.data_ultima_alteracao
        FROM inserted ins 
       INNER JOIN Evento even ON even.id = ins.idevento
       WHERE Componente.id = even.idcomponente  
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM inserted)
      BEGIN      
         -- INSERIU O PARAMETRO EVENTO
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, comp.id, comp.nome, 'INSERT', @tabela,
                log = 'Evento: ' + RTRIM(even.nome) + CHAR(13) +
                      'Criação' + CHAR(13) +
                      'Nome: ' + RTRIM(ins.nome) + CHAR(13) +
                      ISNULL('Descrição: ' + RTRIM(ins.descricao)  + CHAR(13), '') +
                      'Obrigatório: ' + CASE 
                                           WHEN ins.obrigatorio = 1 
                                           THEN 'Sim' 
                                           ELSE 'Não' 
                                        END + CHAR(13) +
                      'Tipo: ' + RTRIM(tipoIns.nome)
           FROM inserted ins
          INNER JOIN Evento even ON even.id = ins.idevento
          INNER JOIN Componente comp ON comp.id = even.idcomponente
          INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
          INNER JOIN Tipo tipoIns ON tipoIns.id = ins.idtipo

         UPDATE Componente
            SET data_ultima_alteracao = ins.data_ultima_alteracao
           FROM inserted ins 
          INNER JOIN Evento even ON even.id = ins.idevento
          WHERE Componente.id = even.idcomponente  
      END
      ELSE
      BEGIN
         IF EXISTS(SELECT 'TRUE' FROM deleted)
         BEGIN
            -- DELETOU O PARAMETRO EVENTO
            INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
            SELECT usr.login, comp.id, comp.nome, 'DELETE', @tabela, 'Deleção do parâmetro: ' + RTRIM(del.nome) + ' do evento: ' + RTRIM(even.nome)
              FROM deleted del
              INNER JOIN Evento even ON even.id = del.idevento
              INNER JOIN Componente comp ON comp.id = even.idcomponente
              INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
              
            UPDATE Componente
               SET data_ultima_alteracao = del.data_ultima_alteracao
              FROM deleted del 
             INNER JOIN Evento even ON even.id = del.idevento
             WHERE Componente.id = even.idcomponente            
         END
      END
   END
END
GO

IF OBJECT_ID('dbo.LogComponenteDependencia') IS NOT NULL DROP TRIGGER dbo.LogComponenteDependencia
GO
CREATE TRIGGER LogComponenteDependencia ON ComponenteDependencia FOR INSERT, DELETE
AS
BEGIN

   DECLARE @tabela VARCHAR(50)
           
   SET @tabela = 'ComponenteDependencia'

   IF EXISTS(SELECT 'TRUE' FROM inserted)
   BEGIN      
      -- INSERIU O COMPONENTE DEPÊNDENCIA
      INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
      SELECT usr.login, comp.id, comp.nome, 'INSERT', @tabela,
             log = 'Criação' + CHAR(13) +
                   'Nome: ' + RTRIM(dep.nome) + CHAR(13) +
                   'Versão: ' + RTRIM(dep.versao) + CHAR(13) +
                   'Status: ' + RTRIM(dep.status)
        FROM inserted ins
       INNER JOIN Componente comp ON comp.id = ins.idcomponente
       INNER JOIN Usuario usr ON usr.id = ins.idusuario_ultima_alteracao
       INNER JOIN Dependencia dep on dep.id = ins.iddependencia
       
      UPDATE Componente
         SET data_ultima_alteracao = ins.data_ultima_alteracao
        FROM inserted ins 
       WHERE Componente.id = ins.idcomponente    
   END
   ELSE
   BEGIN
      IF EXISTS(SELECT 'TRUE' FROM deleted)
      BEGIN
         -- DELETOU O COMPONENTE DEPÊNDENCIA
         INSERT INTO ComponenteLog(login, idcomponente, nomecomponente, operacao, tabela, log)
         SELECT usr.login, comp.id, comp.nome, 'DELETE', @tabela, 'Deleção da depêndencia: ' + RTRIM(dep.nome)
           FROM deleted del
          INNER JOIN Componente comp ON comp.id = del.idcomponente
          INNER JOIN Usuario usr ON usr.id = del.idusuario_ultima_alteracao
          INNER JOIN Dependencia dep on dep.id = del.iddependencia
          
         UPDATE Componente
            SET data_ultima_alteracao = del.data_ultima_alteracao
           FROM deleted del
          WHERE Componente.id = del.idcomponente    
      END
   END
END
GO