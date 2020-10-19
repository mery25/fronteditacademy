select * from ulleres;
select * from client;
select * from adreça;

insert into adreça ( carrer, numero, pis, porta, ciutat, codi_postal, pais) values ( 'Lleida', 1, 1, 'B', 'Barcelona', '08001', 'Espanya');
insert into adreça ( carrer, numero, pis, porta, ciutat, codi_postal, pais) values ( 'Sta Carme', 2, 3, '3', 'Igualada', '08700', 'Espanya');
insert into adreça ( carrer, numero, pis, porta, ciutat, codi_postal, pais) values ( 'Aribau', 12, 2, 'A', 'Barcelona', '08002', 'Espanya');
insert into adreça ( carrer, numero, pis, porta, ciutat, codi_postal, pais) values ( 'Odena', 5, 0, 'B', 'Igualada', '08700', 'Espanya');
insert into adreça ( carrer, numero, pis, porta, ciutat, codi_postal, pais) values ( 'Sant Antoni Abat', 26, 6, 'C', 'Barcelona', '08020', 'Espanya');

select * from adreça;

insert into proveidor (nom, telefon, fax, nif, id_adreça) values ('monica', '6000000', '2232343', '47111111X', 1);
insert into proveidor (nom, telefon, fax, nif, id_adreça) values ('andorrana', '6000001', '2232343', '51111111Y', 2);

select * from proveidor;

insert into marca (nom, id_proveidor) values ('Ray ban', 1);
insert into marca (nom, id_proveidor) values ('Ralph Lauren', 2);
insert into marca (nom, id_proveidor) values ('Nike', 2);

select * from marca;

insert into ulleres (graduacio_esquerre, graduacio_dret, tipus_muntura, color_muntura, color_vidre_esquerre, color_vidre_dret, preu, id_marca, empleat_compra) 
values ('– 1 +075 70° Ad 225', '– 125 +075 135° Ad 225', 'completa', 'blau', 'blanc', 'blanc', 300,  1, 'Anna');
insert into ulleres (graduacio_esquerre, graduacio_dret, tipus_muntura, color_muntura, color_vidre_esquerre, color_vidre_dret, preu, id_marca, empleat_compra) 
values ('– 1 +075 70° Ad 225', '– 125 +075 135° Ad 225', 'invisible', 'rosa', 'blanc', 'blanc', 150, 2, 'Carles');
insert into ulleres (graduacio_esquerre, graduacio_dret, tipus_muntura, color_muntura, color_vidre_esquerre, color_vidre_dret, preu, id_marca, empleat_compra) 
values ('– 1 +075 70° Ad 225', '– 125 +075 135° Ad 225', 'parcial inferior', 'vermell', 'groc', 'groc', 80 , 3, null);
insert into ulleres (graduacio_esquerre, graduacio_dret, tipus_muntura, color_muntura, color_vidre_esquerre, color_vidre_dret, preu, id_marca, empleat_compra) 
values ('– 1 +075 70° Ad 225', '– 125 +075 135° Ad 225', 'parcial superior', 'negre', 'blanc', 'blanc', 120, 3, 'Josep');

select * from ulleres;

insert into client (nom, telefon, correu_electronic, id_client_recomanacio, id_adreça)
values ('Carolina', '938033456', 'carol@gmail.com', null, 3);
insert into client (nom, telefon, correu_electronic, id_client_recomanacio, id_adreça)
values ('Ramon', '607789654', 'rmt@gmail.com', 1, 4);
insert into client (nom, telefon, correu_electronic, id_client_recomanacio, id_adreça)
values ('Roser', '677123456', 'rus12@gmail.com', 2, 5);

select * from client;

