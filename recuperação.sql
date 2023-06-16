use formativahogwarts;

CREATE TABLE editoras (
  id bigint NOT NULL AUTO_INCREMENT,
  nome_editora varchar(200) NOT NULL,
  unidade_federetiva enum('sp','mg','bh','ac','al','ap','ce','df','es','go','ma','mt','ms','pa','pb','pr','pe','pi','rj','rn','rs','ro','rr','sc','se','to') NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE autor (
  id bigint NOT NULL AUTO_INCREMENT,
  nome_autor varchar(100) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE livros (
  id_livro bigint NOT NULL AUTO_INCREMENT,
  titulo_livro varchar(200) NOT NULL,
  ano_publicacao int NOT NULL,
  edicao_livro varchar(100) NOT NULL,
  editora_fk bigint NOT NULL,
  FOREIGN KEY (editora_fk) REFERENCES editoras (id),
  primary key(id_livro)
  );
  

CREATE TABLE autores (
  id bigint NOT NULL AUTO_INCREMENT,
  autor_fk bigint NOT NULL,
  livro_fk bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (livro_fk) REFERENCES livros (id_livro),
  FOREIGN KEY (autor_fk) REFERENCES autor (id)
);

CREATE TABLE emprestimo_livro (
  id bigint NOT NULL AUTO_INCREMENT,
  aluno bigint NOT NULL,
  funcionario bigint NOT NULL,
  data_comeco_devolucao date NOT NULL,
  data_fim_devolucao date NOT NULL,
  data_real_devolucao date,
  livro_fk bigint,
  PRIMARY KEY (id),
  FOREIGN KEY (aluno) REFERENCES usuarios (id),
  FOREIGN KEY (funcionario) REFERENCES usuarios (id),
  foreign key (livro_fk) references livros(id_livro)
);

Insert into autor(nome_autor) values ('Graciliano Ramos'),('Monteiro Lobato');
Insert into editoras(nome_editora,unidade_federetiva) value ('Moderna','sp');
Insert into livros(titulo_livro,ano_publicacao,edicao_livro,editora_fk) values ('Lua de Larvas',1923,'1',1),('Pequeno Príncipe',1237,'9',1);
Insert into autores(livro_fk,autor_fk) values (2,1),(1,2);
Insert into emprestimo_livro(aluno,funcionario,data_comeco_devolucao,data_fim_devolucao,data_real_devolucao,livro_fk)
values
(1,2,'2020-07-23','2023-08-23','2023-09-10',2),(3,4,'2023-10-01','2023-11-01',null,1);

select * from emprestimo_livro el join livros l on el.livro_fk = l.id_livro; 
select * from livros l join (select livro_fk, count(*) as quantos from autores group by livro_fk) m on l.id_livro=m.livro_fk where m.quantos>=1;
select * from livros where id_livro not in (select livro_fk from emprestimo_livro);
select a.id,count(*) from autor a join autores ae on a.id=ae.autor_fk group by a.id; 
select u.id,count(el.id) from usuarios u left join emprestimo_livro el on u.id=el.aluno where data_comeco_devolucao is not null and data_real_devolucao is null group by u.id;
select * from emprestimo_livro;