Create DataBase Aula2Ex2
Go
Use Aula2Ex2
Go

Create Table users (
id			int			Identity			not null,
name		varchar(45)						not null,
username	varchar(45)	      				not null,
password	varchar(45) Default('123mudar')	not null,
email		varchar(45)						not null
Primary Key (id)
)
Go

Create Table projects (
id			int			Identity(10001,1)		  not null,
name		varchar(45)							  not null,
description varchar(45)							      null,
date		date		Check (date > '20140901') not null
Primary Key (id)
)
Go

Create Table users_has_projects (
users_id		int		not null,
projects_id		int		not null
Primary Key (users_id, projects_id)
Foreign Key (users_id)
	References users (id),
Foreign Key (projects_id)
	References projects (id)
)
Go

Alter Table users
Alter Column username	varchar(10)		not null
Go

Alter Table users
Alter Column password	varchar(8)	not null
Go

Alter Table users 
Add Constraint FK_username Unique(username)
Go



Insert Into users (name, username, password, email) Values
('Maria', 'Rh_maria', '123mudar', 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@wmpresa.com'),
('Ana', 'Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara', 'Ti_clara', '123mudar', 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')

Insert Into projects (name, description, date) Values
('Re-folha', 'Refatoração das Folhas', '20140905'),
('Manutenção PCs', 'Manutenção PCs', '20140906'),
('Auditoria', null, '20140907')

Insert Into users_has_projects (users_id, projects_id) Values 
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)

Update projects
Set date = '20140912'
Where name Like 'Manutenção%'

Update users
Set username = ' Rh_cido'
Where name = 'Aparecido'

Update users
Set password = '888@*'
Where username = 'Rh_maria' and password = '123mudar'

Delete users_has_projects
Where  users_id = 2


Select*From users
Select*From projects
Select*From users_has_projects