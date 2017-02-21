drop database if exists jaakuu;
create database jaakuu character set utf8 collate utf8_general_ci;
use jaakuu;

ALTER DATABASE CHARACTER SET utf8 COLLATE utf8_unicode_ci;

create table korisnik (
sifra int not null primary key auto_increment,
email varchar(255) not null,
lozinka varchar(32) not null, 
ime varchar(50) not null, 
prezime varchar(50) not null,
oib char(11) not null,
datrodenja date not null,
ulica varchar(50) not null,
mjesto varchar(50) not null,
drzava varchar(50) not null,
postanskibr varchar(10) not null,
aktivan boolean not null,
slika varchar(255) null
) engine=InnoDB;

create table listic (
sifra int not null primary key auto_increment,
status boolean not null,
korisnik int not null,
uplata decimal(5,2) not null,
ukupnikoeficijent decimal(5,2) not null
) engine=InnoDB;

create table listic_ponuda (
listic int not null,
ponuda int not null,
koeficijent decimal(5,2)
) engine=InnoDB;

create table ponuda (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
video int not null,
tipponude int not null,
trajeod datetime not null,
trajedo datetime not null,
koeficijent decimal(5,2) not null
) engine=InnoDB;

create table tipponude(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
opis text null
) engine=InnoDB;

create table video (
sifra int not null primary key auto_increment,
videoid varchar(255) not null,
naziv varchar(255) not null, 
pregleda int(50) not null,
likes int not null,
dislikes int not null, 
datum datetime null
) engine=InnoDB;

create table novcanik (
sifra int not null primary key auto_increment,
korisnik int not null,
stanje decimal(5,2) not null,
valuta varchar(20) not null
) engine=InnoDB;


alter table listic_ponuda add foreign key (listic) references listic(sifra);
alter table listic_ponuda add foreign key (ponuda) references ponuda(sifra);
alter table listic add foreign key (korisnik) references korisnik(sifra);
alter table ponuda add foreign key (tipponude) references tipponude(sifra);
alter table ponuda add foreign key (video) references video(sifra);
alter table novcanik add foreign key (korisnik) references korisnik(sifra);


insert into video(sifra,videoid,naziv,pregleda,likes,dislikes,datum) values 
(null,'0d3Ke221MeU','Relaxing Love Songs with Blues Touch 2015 Vol 5 | www.RoyalTimes.org',12354968,2568965,3588,'2014-05-06'),
(null,'orBXgVMipDI','Best of 50s 60s and 70s Music | 50s Rock N Roll | 60s and 70s Rock | Vietnam War Music',5446549,546879,358,'2016-05-30'),
(null,'uFnSKD2E0Z8','John Lee Hooker - House Of The Blues (Not Now Music) [Full Album]',657485888,5457457,68594,'1998-24-03');

insert into tipponude(sifra,naziv,opis) values
(null,'Više manje pogleda','Hoće li za određeno vrijeme biti više ili manje pogleda od zadanog'),
(null,'Više manje like-ova','Hoće li za određeno vrijeme biti više ili manje like-ova od zadanog'),
(null,'Više manje dislike-ova','Hoće li za određeno vrijeme biti više ili manje dislike-ova od zadanog');

insert into korisnik(sifra,lozinka,email,ime,prezime,oib,datrodenja,aktivan,postanskibr,drzava,mjesto,ulica) values
(null,'8aa87050051efe26091a13dbfdf901c6','matejdurokovic@gmail.com','Matej','Đuroković','32489756364','1995-01-24',true,34000,'Hrvarska','Požega','Sveti Vid 19'),
(null,'0df01ae7dd51cec48fed56952f40842b','ivanhorvat@example.com','Ivan','Horvat','32669597387','1982-05-12',true,'36182', 'USA', 'Jacksonville', 'PALAU'),
(null,'d2ab2804e6ce28b54f72c3028a1b7bf6','markomaric@example.com','Marko','Marić','53659752125','1980-09-30',false, '94292', 'USA', 'New York', 'CALIFORNIA'),
(null,'c51e8ce7aca10508f845ce7f0c7a15e7','peroperic@example.com','Pero','Perić','89254816392','1990-03-05',true, '94292', 'USA', 'New York', 'CALIFORNIA');

insert into novcanik(sifra,stanje,korisnik,valuta) values
(null,50,1,'Kuna'),
(null,100,2,'Kuna'),
(null,300,3,'Kuna'),
(null,5,4,'Euro');

insert into ponuda (sifra,naziv,video,tipponude,trajeod,trajedo,koeficijent) values 
(null, 'Manje', 1,1,'2016-11-16','2016-11-25',2.00 ),
(null, 'Više', 1,1,'2016-12-10','2016-12-30',1.80 ),
(null, 'Manje', 2,2,'2016-11-16','2016-12-08',9.00 ),
(null, 'Više', 2,2,'2016-11-16','2016-12-08',9.00 );

insert into listic (sifra,status,korisnik,uplata,ukupnikoeficijent) values
(null,1,1,10,0),
(null,1,3,50,0),
(null,1,4,30,0);

insert into listic_ponuda (listic,ponuda) values
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3);
/*
select a.ime,b.prezime 
from korisnik a inner join listic b on a.sifra=b.korisnik
inner join statuslistica c on c.sifra=b.statuslistica
where c.aktivan is 1;
*/
insert into video (videoid,naziv,pregleda,likes,dislikes,datum) values 
('PT2_F-1esPk','The Chainsmokers - Closer (Lyric) ft. Halsey', 89235755, 543909, 53503, '2005-01-14 18:16:59'),
('AeGfss2vsZg','Martin Garrix & Bebe Rexha - In The Name Of Love (Official Audio)', 1045956178, 799133, 53411, '2005-08-27 17:51:6'),
('O4irXQhgMqg','The Rolling Stones - Paint It, Black (Official Lyric Video)', 79472213, 716428, 93991, '2010-02-16 04:45:33'),
('-Du-CWASm20','Sweet Home Alabama Lynyrd Skynyrd', 1248619913, 771130, 96985, '2008-04-07 01:7:15'),
('PT2_F-1esPk','The Chainsmokers - Closer (Lyric) ft. Halsey', 42262447, 462686, 26494, '2015-03-29 08:52:48'),
('IXdNnw99-Ic','Pink Floyd - Wish You Were Here', 713081089, 549412, 66556, '2007-05-26 04:26:36'),
('j7leQB_Oe_k','The Rolling Stones - You Cant Always Get What You Want (lyrics)', 673134541, 464473, 47375, '2009-09-05 06:47:29'),
('O4irXQhgMqg','The Rolling Stones - Paint It, Black (Official Lyric Video)', 635129710, 984310, 10726, '2013-01-31 21:20:39'),
('vjW8wmF5VWc','Silentó - Watch Me (Whip/Nae Nae) (Official)', 998033488, 804952, 17774, '2003-08-16 06:41:24'),
('b4Bj7Zb-YD4','Calvin Harris - My Way (Official Video)', 1394508255, 594862, 34978, '2006-03-29 08:9:33'),
('IcrbM1l_BoI','Avicii - Wake Me Up (Official Video)', 1117320747, 384209, 78794, '2011-08-27 15:28:41'),
('vjW8wmF5VWc','Silentó - Watch Me (Whip/Nae Nae) (Official)', 766478999, 797343, 81891, '2006-03-24 11:30:20'),
('K6S4O-VtZBI','Eagles -- Hotel California Lyrics song', 1029133648, 32272, 84165, '2004-10-13 15:40:40'),
('PT2_F-1esPk','The Chainsmokers - Closer (Lyric) ft. Halsey', 607516720, 910046, 74139, '2015-03-21 17:25:29'),
('j7leQB_Oe_k','The Rolling Stones - You Cant Always Get What You Want (lyrics)', 328648498, 513265, 71289, '2007-04-19 11:23:1'),
('cHHLHGNpCSA','Avicii - Waiting For Love', 450612951, 410265, 60737, '2013-10-21 02:59:58'),
('PT2_F-1esPk','The Chainsmokers - Closer (Lyric) ft. Halsey', 742994086, 297196, 69383, '2015-11-18 08:28:18'),
('K6S4O-VtZBI','Eagles -- Hotel California Lyrics song', 264708346, 183848, 8475, '2007-08-03 02:49:45'),
('IXdNnw99-Ic','Pink Floyd - Wish You Were Here', 725215866, 426104, 3435, '2011-02-04 09:43:25'),
('AeGfss2vsZg','Martin Garrix & Bebe Rexha - In The Name Of Love (Official Audio)', 33269737, 30418, 42868, '2005-04-18 20:24:6'),
('E2PglxuFtUg','The Best of Ray Charles (full album)', 385061097, 531555, 68694, '2004-08-20 19:1:10'),
('cHHLHGNpCSA','Avicii - Waiting For Love', 1330529972, 472510, 43275, '2008-04-21 02:7:54'),
('PT2_F-1esPk','The Chainsmokers - Closer (Lyric) ft. Halsey', 7050944, 999486, 53229, '2003-12-18 07:29:50'),
('RgKAFK5djSk','Wiz Khalifa - See You Again ft. Charlie Puth [Official Video] Furious 7 Soundtrack', 140288489, 440048, 84594, '2016-02-18 20:36:52'),
('cHHLHGNpCSA','Avicii - Waiting For Love', 722293701, 331906, 58684, '2009-01-08 19:52:14'),
('b4Bj7Zb-YD4','Calvin Harris - My Way (Official Video)', 799050020, 161468, 80732, '2015-07-22 16:56:54'),
('b4Bj7Zb-YD4','Calvin Harris - My Way (Official Video)', 593890811, 431487, 97966, '2005-12-09 09:8:20'),
('IXdNnw99-Ic','Pink Floyd - Wish You Were Here', 382371921, 810555, 93872, '2003-09-28 04:31:30'),
('KCy7lLQwToI','Journey - Dont Stop Believing Lyrics', 760662873, 380243, 57079, '2004-12-25 13:47:21'),
('E2PglxuFtUg','The Best of Ray Charles (full album)', 65119771, 257069, 57073, '2011-03-25 20:4:46'),
('j7leQB_Oe_k','The Rolling Stones - You Cant Always Get What You Want (lyrics)', 852160060, 549003, 17059, '2008-01-23 20:30:6'),
('IXdNnw99-Ic','Pink Floyd - Wish You Were Here', 233295241, 985400, 91031, '2013-12-22 08:13:29'),
('IcrbM1l_BoI','Avicii - Wake Me Up (Official Video)', 1181974145, 435279, 14335, '2008-11-18 20:11:32'),
('b4Bj7Zb-YD4','Calvin Harris - My Way (Official Video)', 617492741, 412733, 13695, '2012-03-09 00:21:9'),
('KCy7lLQwToI','Journey - Dont Stop Believing Lyrics', 691247062, 787900, 74308, '2005-06-23 13:17:29'),
('AeGfss2vsZg','Martin Garrix & Bebe Rexha - In The Name Of Love (Official Audio)', 1399122503, 970764, 52462, '2014-03-06 07:18:20'),
('b4Bj7Zb-YD4','Calvin Harris - My Way (Official Video)', 1041073167, 778251, 58421, '2015-02-27 17:25:29'),
('vjW8wmF5VWc','Silentó - Watch Me (Whip/Nae Nae) (Official)', 1397764653, 886696, 16453, '2012-02-29 09:14:57'),
('j7leQB_Oe_k','The Rolling Stones - You Cant Always Get What You Want (lyrics)', 482564355, 362408, 18346, '2014-01-22 10:17:29'),
('79vCiXg3njY','Blues Brothers - Sweet Home Chicago', 354555304, 91183, 62861, '2007-08-07 05:46:52'),
('AeGfss2vsZg','Martin Garrix & Bebe Rexha - In The Name Of Love (Official Audio)', 552393597, 268987, 18357, '2016-01-02 07:45:1'),
('KCy7lLQwToI','Journey - Dont Stop Believing Lyrics', 413336424, 702324, 81057, '2015-03-24 09:55:44'),
('RgKAFK5djSk','Wiz Khalifa - See You Again ft. Charlie Puth [Official Video] Furious 7 Soundtrack', 796914330, 875850, 99371, '2012-12-30 16:35:24'),
('RgKAFK5djSk','Wiz Khalifa - See You Again ft. Charlie Puth [Official Video] Furious 7 Soundtrack', 743754607, 143293, 41015, '2011-12-24 14:36:39'),
('PT2_F-1esPk','The Chainsmokers - Closer (Lyric) ft. Halsey', 575110327, 206748, 88320, '2013-01-24 00:35:26'),
('RgKAFK5djSk','Wiz Khalifa - See You Again ft. Charlie Puth [Official Video] Furious 7 Soundtrack', 902668847, 519070, 28864, '2014-03-26 14:22:22'),
('b4Bj7Zb-YD4','Calvin Harris - My Way (Official Video)', 315170554, 131741, 99856, '2005-02-13 05:42:18');
insert into tipponude (naziv,opis) values 
('tip ponude4', 'ponuda tipa4' ),
('tip ponude5', 'ponuda tipa5' ),
('tip ponude6', 'ponuda tipa6' ),
('tip ponude7', 'ponuda tipa7' ),
('tip ponude8', 'ponuda tipa8' ),
('tip ponude9', 'ponuda tipa9' ),
('tip ponude10', 'ponuda tipa10' ),
('tip ponude11', 'ponuda tipa11' ),
('tip ponude12', 'ponuda tipa12' ),
('tip ponude13', 'ponuda tipa13' ),
('tip ponude14', 'ponuda tipa14' ),
('tip ponude15', 'ponuda tipa15' );
insert into korisnik (email,lozinka,ime,prezime,oib,datrodenja,aktivan,postanskibr,drzava,mjesto,ulica) values 
('FayDuran@gmail.com', '8a0d015c3e085a3de255f8eb41b58fe5', 'Fay', 'Duran', '34544994514', '1986-03-23 03:30:14', 0, 77666, 'USA', 'Dover', 'PALAU'),
('BretFarley@hotmail.com', '5f185603993e99481c78fb22060b13d8', 'Bret', 'Farley', '12166758704', '1991-11-20 06:31:26', 1, 65517, 'USA', 'McKinney', 'MINNESOTA'),
('ErinFarley@gmail.com', 'cd77fd839b89e465e263c491d47e649c', 'Erin', 'Farley', '78926112859', '1989-02-05 00:41:2', 0, 16632, 'USA', 'Ridgewood', 'DELAWARE'),
('GustavDudley@hotmail.com', 'e8834b2aceb845ba30e5d5ae3bc26473', 'Gustav', 'Dudley', '53525161689', '1989-03-28 00:44:38', 1, 82184, 'USA', 'Fort Worth', 'GUAM GU'),
('DeanHatfield@yaahoo.com', 'fe9ad4254f02d78bd7bc229ffaa5c89a', 'Dean', 'Hatfield', '38194349628', '1990-04-15 20:21:33', 1, 26526, 'USA', 'McKinney', 'IOWA'),
('DennisBaker@mail.to', '08fc08b6d736cbd03a04fcfeb36a67df', 'Dennis', 'Baker', '18896583995', '1989-03-20 01:50:54', 0, 69847, 'USA', 'Chester', 'HAWAII'),
('ClaudetteHays@net.com', 'e3a50187f5067f740b75afa2cf4fea6a', 'Claudette', 'Hays', '19501951842', '1990-05-15 11:22:39', 0, 22053, 'USA', 'Sarasota', 'RHODE ISLAND'),
('ErnestoFields@gmail.com', 'c4d3ee667f20707ad7735660beb544ff', 'Ernesto', 'Fields', '43198977468', '1986-07-04 10:53:7', 1, 50903, 'USA', 'Nazareth', 'TEXAS'),
('FranklinMcguire@net.com', 'f0963945c58ab12b1c9bd419f0847dc1', 'Franklin', 'Mcguire', '64579221851', '1987-06-08 16:55:2', 0, 38841, 'USA', 'Chester', 'OREGON'),
('ErinCervantes@mail.to', '3b7964d56bcfc6d12cfc7c9f0e24c464', 'Erin', 'Cervantes', '65207954677', '1987-09-23 23:29:29', 1, 16097, 'USA', 'Nacogdoches', 'WISCONSIN'),
('ArleneFarmer@live.com', '2dfd4e2a331aec74b432397f35e465db', 'Arlene', 'Farmer', '51078567806', '1986-03-08 08:39:42', 1, 14448, 'USA', 'Nashville', 'NEW HAMPSHIRE'),
('ErinFarmer@mail.to', '1b3a1abccbdcbb8bcd6a478e3f1f1879', 'Erin', 'Farmer', '12351467345', '1991-05-03 18:40:31', 0, 54530, 'USA', 'Buffalo', 'MISSISSIPPI'),
('ChantalEdwards@yaahoo.com', '71b85a11a94d1cd453b4bc7dcd5efb37', 'Chantal', 'Edwards', '18090409407', '1989-07-03 13:23:33', 1, 77760, 'USA', 'Arvada', 'TENNESSEE'),
('AlexDudley@net.com', '4a680c6a7ab884d45d6892cbe5194d17', 'Alex', 'Dudley', '15067949503', '1985-05-09 06:29:8', 0, 80241, 'USA', 'Sarasota', 'MISSOURI'),
('ChantalBaker@mail.to', 'ef4de43b5b94b50b1c894e42c6a23937', 'Chantal', 'Baker', '30101763213', '1986-02-13 15:28:36', 1, 72931, 'USA', 'Fort Worth', 'ALABAMA'),
('DennisDuke@live.com', 'fbb2853877fda103b9040bb26c4bf423', 'Dennis', 'Duke', '19086512799', '1985-01-06 17:12:35', 0, 34422, 'USA', 'Northbrook', 'CALIFORNIA'),
('GastonHeath@net.com', '62dea37d7699dd9dc92d9b77e49fb761', 'Gaston', 'Heath', '58856438940', '1986-03-02 22:53:4', 1, 18543, 'USA', 'Tomball', 'VIRGINIA'),
('DollyDuffy@example.com', '7dbb79179a2fd9ac8a4ef7bb212cc147', 'Dolly', 'Duffy', '21090217767', '1989-12-09 12:13:6', 0, 32455, 'USA', 'Crofton', 'ALABAMA'),
('DollyEllis@net.com', '9ca9c847adf51eb979437ba2cdcbd175', 'Dolly', 'Ellis', '24405122934', '1990-10-28 21:24:53', 1, 87216, 'USA', 'Crofton', 'NORTHERN MARIANA ISLANDS'),
('GabielleHawkins@mail.to', '66f68dc89cea2ade00e41ca79b2b6287', 'Gabielle', 'Hawkins', '25806146523', '1989-07-16 22:38:59', 1, 96860, 'USA', 'Utica', 'FLORIDA'),
('GordonDyer@live.com', 'cd59a5ac51cc5ba25603bc5aef33148e', 'Gordon', 'Dyer', '43690856944', '1984-11-02 15:14:18', 1, 18097, 'USA', 'Clinton', 'OKLAHOMA'),
('ArthurDuffy@mail.to', 'da21907d1e4a535b764a07cf1a88ced8', 'Arthur', 'Duffy', '62034256567', '1985-11-09 16:21:44', 1, 37079, 'USA', 'Brecksville', 'SOUTH DAKOTA'),
('FelixFarley@hotmail.com', '18cab60c4b0546a7e326689e48695451', 'Felix', 'Farley', '29948563633', '1989-11-01 20:21:51', 0, 93893, 'USA', 'Richmond', 'LOUISIANA'),
('FlorenceChambers@live.com', '30986c3f2a69c9b714cd19784bc7a325', 'Florence', 'Chambers', '69299104347', '1987-10-29 15:56:50', 0, 16155, 'USA', 'Jacksonville', 'MARYLAND'),
('DennisMcgowan@net.com', 'b11e053bcd304e04ea7de9db33e1e666', 'Dennis', 'Mcgowan', '29220759934', '1990-08-25 22:51:43', 1, 81640, 'USA', 'Fort Worth', 'AMERICAN SAMOA'),
('EdouardHayes@hotmail.com', '3307861a770ce3e82521d7dfe9b5bdb9', 'Edouard', 'Hayes', '54256260472', '1992-05-11 12:12:40', 0, 65573, 'USA', 'Brecksville', 'OKLAHOMA'),
('BonnieDunn@net.com', 'ac2d30563be6b2d0f90798b99bcee6aa', 'Bonnie', 'Dunn', '32505535099', '1990-07-26 15:44:51', 0, 65055, 'USA', 'Halethorpe', 'TENNESSEE'),
('CharleyAyers@net.com', 'efbc0cbcfd6103c47bcc7d203b3bb6e8', 'Charley', 'Ayers', '69447570296', '1985-09-04 11:17:26', 1, 35725, 'USA', 'Chester', 'MARYLAND'),
('GertMcintosh@net.com', '8ef153f217f576afadd84e752cc300b0', 'Gert', 'Mcintosh', '88646825428', '1991-02-22 09:40:54', 0, 39197, 'USA', 'Ponte Vedra Beach', 'GEORGIA'),
('FlorenceMcgee@example.com', 'cf4f0c7ed736e4fe90d0452c493cbad5', 'Florence', 'Mcgee', '56030519709', '1988-04-23 09:35:28', 1, 54024, 'USA', 'Kissimmee', 'KENTUCKY'),
('FlorenceFerguson@yaahoo.com', 'a94197a49839ee551af75b8ad8829a3d', 'Florence', 'Ferguson', '58454283759', '1987-02-15 20:35:46', 0, 48276, 'USA', 'Utica', 'FEDERATED STATES OF MICRONESIA'),
('AlexHead@mail.to', '8f70f40ac95f3807d2e02589c9259e35', 'Alex', 'Head', '36758861157', '1985-03-20 18:58:33', 0, 42011, 'USA', 'Port Washington', 'INDIANA'),
('DebbyAyers@hotmail.com', '0644724fd023311f7a3bec7596b1ba1f', 'Debby', 'Ayers', '24606897547', '1988-03-21 08:27:7', 0, 78618, 'USA', 'Dover', 'ARIZONA'),
('DebbyHays@gmail.com', '5d0a2c0fd6e5078d8aca7c7505091ec9', 'Debby', 'Hays', '86542780095', '1985-11-21 17:18:25', 1, 59902, 'USA', 'Jacksonville', 'ARMED FORCES AMERICA (EXCEPT CANADA)'),
('DeanBailey@yaahoo.com', '7973a06e52099e20d283df11d9d43f76', 'Dean', 'Bailey', '46138157810', '1989-04-07 09:14:57', 0, 81023, 'USA', 'Brecksville', 'VERMONT'),
('EmilyMcintosh@gmail.com', '65048372529f19c105ab2b9a49e0e080', 'Emily', 'Mcintosh', '66960966843', '1984-09-30 19:7:55', 0, 37615, 'USA', 'New York', 'PENNSYLVANIA'),
('DollyFarrell@hotmail.com', '7bd8e71f762ee5844da7499df862e0a7', 'Dolly', 'Farrell', '43863806426', '1991-02-02 03:59:5', 0, 18514, 'USA', 'Port Washington', 'GEORGIA'),
('FrancesEngland@hotmail.com', 'babc9ada13e5c438fc284ca3db7274fd', 'Frances', 'England', '83961510534', '1984-10-18 23:32:56', 1, 34330, 'USA', 'Redwood City', 'NEW HAMPSHIRE'),
('DollyBlevins@live.com', '8aa5efdb38b317dad96b659592f9bb8c', 'Dolly', 'Blevins', '98617303541', '1986-01-18 05:10:39', 1, 73396, 'USA', 'Palatine', 'OHIO'),
('FelixHaynes@live.com', 'f7c13d1da79349c3c5700e07a9d90e46', 'Felix', 'Haynes', '99602684422', '1986-02-09 20:43:30', 1, 98484, 'USA', 'Utica', 'ARMED FORCES AMERICA (EXCEPT CANADA)'),
('ChrisHays@gmail.com', '7cee98d1ef4d123a72cb6968c1992cc0', 'Chris', 'Hays', '44344739986', '1991-01-17 13:9:10', 0, 15576, 'USA', 'Halethorpe', 'OREGON'),
('ErinDurham@net.com', '4323e110998869e25218ea610ece5539', 'Erin', 'Durham', '79091228980', '1986-04-23 14:9:7', 0, 48024, 'USA', 'Crofton', 'ARMED FORCES AFRICA \ CANADA \ EUROPE \ MIDDLE EAST'),
('ChantalDunlap@live.com', '7263824ada6741a8184fe72d52781759', 'Chantal', 'Dunlap', '26299600161', '1985-06-24 01:30:55', 1, 82869, 'USA', 'Northbrook', 'NEW YORK'),
('DennisFarley@gmail.com', '3ed9a28eac9fd5136f7ad09de8176a0c', 'Dennis', 'Farley', '52265497589', '1986-12-14 18:2:59', 1, 58956, 'USA', 'Port Washington', 'WISCONSIN'),
('GastonAyers@yaahoo.com', 'c0333f973feb16e8bc5226d3dbf7da4a', 'Gaston', 'Ayers', '73971221953', '1987-02-22 04:21:9', 0, 85041, 'USA', 'Jackson', 'KANSAS'),
('FayHaynes@live.com', '676524525876ef8c09e68ded9e4fa133', 'Fay', 'Haynes', '35824369191', '1986-01-26 18:23:46', 0, 45867, 'USA', 'Halethorpe', 'MISSOURI');
insert into novcanik (korisnik,stanje,valuta) values 
(30, 492.09, 'Jaakuu'),
(45, 109.91, 'Jaakuu'),
(22, 537.27, 'Jaakuu'),
(47, 891.69, 'Jaakuu'),
(5, 361.92, 'Jaakuu'),
(27, 767.95, 'Jaakuu'),
(8, 665.76, 'Jaakuu'),
(38, 891.91, 'Jaakuu'),
(38, 656.79, 'Jaakuu'),
(19, 425.76, 'Jaakuu'),
(19, 218.73, 'Jaakuu'),
(30, 850.51, 'Jaakuu'),
(30, 604.52, 'Jaakuu'),
(32, 527.23, 'Jaakuu'),
(21, 983.48, 'Jaakuu'),
(2, 444.77, 'Jaakuu'),
(19, 135.14, 'Jaakuu'),
(19, 472.86, 'Jaakuu'),
(43, 993.53, 'Jaakuu'),
(2, 728.3, 'Jaakuu'),
(26, 256.77, 'Jaakuu'),
(15, 124.8, 'Jaakuu'),
(18, 201.67, 'Jaakuu'),
(44, 326.61, 'Jaakuu'),
(46, 501.88, 'Jaakuu'),
(33, 967.91, 'Jaakuu'),
(6, 694.86, 'Jaakuu'),
(3, 827.57, 'Jaakuu'),
(41, 487.01, 'Jaakuu'),
(41, 23.05, 'Jaakuu'),
(7, 973.07, 'Jaakuu'),
(6, 453.67, 'Jaakuu'),
(44, 825.79, 'Jaakuu'),
(21, 336.36, 'Jaakuu'),
(29, 720.16, 'Jaakuu'),
(45, 116.04, 'Jaakuu'),
(31, 373.82, 'Jaakuu'),
(43, 564.91, 'Jaakuu'),
(46, 425.82, 'Jaakuu'),
(37, 240.45, 'Jaakuu'),
(49, 306.49, 'Jaakuu'),
(11, 529.56, 'Jaakuu'),
(35, 651.58, 'Jaakuu'),
(13, 425.7, 'Jaakuu'),
(3, 793.59, 'Jaakuu'),
(46, 216.18, 'Jaakuu'),
(5, 299.18, 'Jaakuu'),
(16, 857.54, 'Jaakuu'),
(49, 702.53, 'Jaakuu'),
(2, 472.53, 'Jaakuu'),
(11, 111.79, 'Jaakuu'),
(3, 592.05, 'Jaakuu'),
(20, 186.46, 'Jaakuu'),
(45, 956.13, 'Jaakuu'),
(1, 530.17, 'Jaakuu'),
(38, 715.84, 'Jaakuu'),
(9, 230.72, 'Jaakuu'),
(26, 993.04, 'Jaakuu'),
(17, 671.52, 'Jaakuu'),
(31, 296.14, 'Jaakuu'),
(15, 182.57, 'Jaakuu'),
(46, 212.15, 'Jaakuu'),
(24, 14.93, 'Jaakuu'),
(31, 371, 'Jaakuu'),
(33, 363.5, 'Jaakuu'),
(18, 976.65, 'Jaakuu');
insert into listic (status,korisnik,uplata,ukupnikoeficijent) values 
(1, 10, 25.22, 927.22),
(1, 23, 48.41, 876.35),
(1, 22, 31.24, 109.44),
(1, 30, 81.12, 642.08),
(1, 23, 44.27, 16.08),
(1, 14, 56.14, 253.22),
(1, 15, 1.99, 738.08),
(1, 24, 3.29, 973.92),
(1, 29, 53.3, 995.53),
(1, 28, 66.58, 895.41),
(1, 9, 21.93, 186.39),
(1, 21, 34.22, 227.16),
(1, 17, 97.34, 511.87),
(1, 48, 88.34, 685.58),
(1, 36, 52.47, 74.94),
(1, 29, 61.44, 189),
(1, 23, 80.14, 477.75),
(1, 21, 94.7, 53.75),
(1, 9, 82.45, 950.37),
(1, 11, 83.72, 196.19),
(1, 1, 72.01, 283.72),
(1, 10, 57.39, 499.23),
(1, 29, 21.78, 174.7),
(1, 20, 31.03, 335.16),
(1, 48, 36.27, 798.96),
(1, 24, 72.65, 403.47),
(1, 35, 87.19, 268.65),
(1, 45, 58.38, 696.8),
(1, 27, 22.48, 573.08),
(1, 5, 3.07, 292.58),
(1, 33, 75.61, 731.9),
(1, 41, 76.03, 333.11),
(1, 6, 40.22, 811.06),
(1, 34, 93.65, 861.81),
(1, 23, 89.98, 617.09),
(1, 24, 94.63, 427.22),
(1, 45, 95.88, 372.95),
(1, 46, 67.32, 46.29),
(1, 23, 49.48, 890.78),
(1, 13, 71.72, 451.58),
(1, 24, 99.1, 607.35),
(1, 29, 38.07, 270.04),
(1, 25, 22.85, 752.71),
(1, 20, 73.1, 582.9),
(1, 22, 28.43, 561.33),
(1, 12, 24.88, 822.23),
(1, 13, 75.37, 799.69),
(1, 25, 39.23, 951.8),
(1, 14, 96.98, 921),
(1, 11, 77.69, 104.09),
(1, 38, 38.45, 843.32),
(1, 4, 2.25, 46.8),
(1, 1, 5.54, 497.32),
(1, 29, 84.61, 933.02),
(1, 34, 25.93, 587.55),
(1, 9, 5.33, 321.69),
(1, 35, 75.68, 687.54),
(1, 27, 98.85, 48.31),
(1, 35, 21.91, 682.88),
(1, 49, 40.03, 804.03),
(1, 13, 91.77, 249.96),
(1, 36, 13.18, 496.99),
(1, 6, 3.56, 120.95),
(1, 17, 21.19, 215.86),
(1, 38, 64.37, 863.02),
(1, 18, 98.77, 675.18),
(1, 7, 30.36, 71.08),
(1, 50, 1.93, 657.65),
(1, 44, 66.18, 950.83),
(1, 50, 85.91, 654.36),
(1, 31, 71.51, 918.16),
(1, 6, 47.66, 113.53),
(1, 19, 49.96, 543.98),
(1, 43, 26.46, 143.54),
(1, 12, 8.5, 240.27),
(1, 48, 96.75, 340.34),
(1, 37, 78.84, 371.71),
(1, 9, 52.94, 212.05),
(1, 19, 29.11, 910.01),
(1, 24, 49.06, 551.12),
(1, 22, 28.45, 997.96),
(1, 22, 12.51, 122.12),
(1, 50, 11.48, 172.44),
(1, 33, 88.29, 551.58),
(1, 39, 43.97, 447.21),
(1, 28, 43.62, 424.72),
(1, 26, 18.05, 277.12),
(1, 8, 88.18, 140.01),
(1, 23, 46.61, 346.55),
(1, 32, 91.99, 714.57),
(1, 5, 90.55, 447.8),
(1, 46, 48.81, 563.05),
(1, 28, 33.98, 111.84),
(1, 8, 10.32, 397.36),
(1, 6, 21.3, 668.49),
(1, 46, 63.68, 689.14),
(1, 35, 94.8, 990.9),
(1, 18, 97.98, 125.64),
(1, 43, 89.49, 176.37),
(1, 20, 26.72, 967.48),
(1, 47, 57.34, 390.1),
(1, 10, 16.02, 644.29),
(1, 44, 50.83, 220.89),
(1, 42, 7.11, 487.17),
(1, 17, 16.16, 817.59),
(1, 10, 58.97, 292.36),
(1, 36, 88.62, 121.5),
(1, 15, 95.46, 786.88),
(1, 25, 55.37, 176.3),
(1, 6, 49.21, 352.9),
(1, 22, 18.32, 645.41),
(1, 21, 36.08, 28.77),
(1, 15, 27.15, 578.36),
(1, 14, 96.71, 716.53),
(1, 3, 1.15, 178.2),
(1, 21, 28.53, 273.03),
(1, 36, 9.26, 200.72),
(1, 36, 12.31, 46.56),
(1, 20, 36.18, 882.57),
(1, 12, 68.9, 986.83),
(1, 33, 27.51, 762.46),
(1, 21, 75.99, 748.44),
(1, 20, 19.46, 292.06),
(1, 26, 10.82, 427.7),
(1, 42, 84.47, 530.47),
(1, 3, 77.21, 745.89),
(1, 6, 76.14, 774.78),
(1, 13, 64.41, 811.09),
(1, 17, 28.69, 832.94),
(1, 42, 74.27, 884.48),
(1, 2, 64.3, 254.97),
(1, 21, 82.47, 306.63),
(1, 11, 50.78, 575.94),
(1, 34, 65.3, 373.01),
(1, 3, 74.03, 503.6),
(1, 30, 65.08, 985.6),
(1, 32, 0.77, 311.86),
(1, 35, 90.22, 977.64),
(1, 12, 50.11, 334.3),
(1, 34, 66.3, 507.75),
(1, 13, 13.85, 74.52),
(1, 41, 81.75, 193.47),
(1, 19, 87.19, 176.34),
(1, 20, 23.33, 467.09),
(1, 14, 48.5, 331.81),
(1, 41, 42.67, 503.45),
(1, 30, 74.8, 564.44),
(1, 48, 24.55, 622.88),
(1, 33, 92.4, 966.19),
(1, 50, 21.62, 339.13),
(1, 38, 9.6, 783.41),
(1, 2, 34.05, 144.67),
(1, 23, 44.03, 23.39),
(1, 32, 55.76, 980.51),
(1, 25, 19.55, 758.9),
(1, 3, 14.6, 812.72),
(1, 24, 4.84, 465.69),
(1, 21, 51.55, 379.08),
(1, 21, 77.11, 220.11),
(1, 31, 15.12, 537.16),
(1, 25, 1.01, 646.42),
(1, 47, 33.1, 516.98),
(1, 44, 3.39, 493.54),
(1, 43, 89.61, 916),
(1, 19, 64.83, 647.08),
(1, 21, 7.09, 825.9),
(1, 46, 40.4, 672.87),
(1, 11, 88.47, 878.15),
(1, 2, 92.86, 578.72),
(1, 27, 61.45, 210.9),
(1, 24, 56.99, 698.22),
(1, 12, 86.03, 184.4),
(1, 9, 99.04, 807.44),
(1, 50, 22.88, 531.83),
(1, 15, 84.41, 754.87),
(1, 23, 51.37, 76),
(1, 43, 23.22, 700.49),
(1, 22, 74.62, 346.85),
(1, 26, 77.41, 900.3),
(1, 15, 59.32, 157.79),
(1, 25, 16.66, 459.37),
(1, 46, 65.06, 904.71),
(1, 19, 63.61, 409.36),
(1, 36, 52.83, 995.91),
(1, 6, 26.68, 339.87),
(1, 29, 11.81, 569.88),
(1, 38, 2.3, 106.99),
(1, 30, 59.56, 73.7),
(1, 16, 21.5, 857.69),
(1, 11, 25.39, 149.44),
(1, 24, 75.5, 209.73),
(1, 17, 46.41, 497.35),
(1, 39, 93.86, 220.38),
(1, 12, 93.66, 15.06),
(1, 6, 81.28, 75.74),
(1, 26, 3.02, 840.51),
(1, 43, 64.41, 90.21),
(1, 11, 45.45, 579.07),
(1, 30, 75.83, 402.37),
(1, 22, 11.6, 457.69),
(1, 48, 51.63, 405.9),
(1, 11, 79.29, 50.82),
(1, 28, 5.09, 824.53),
(1, 6, 74.1, 121.65),
(1, 47, 51.59, 165.76),
(1, 46, 91.58, 289.74),
(1, 32, 94.54, 636.55),
(1, 26, 70.01, 619.99),
(1, 36, 22.16, 207.15),
(1, 26, 66.27, 419.06),
(1, 37, 24.53, 183.03),
(1, 49, 81, 494.89),
(1, 36, 83.65, 204.29),
(1, 22, 81.75, 116.49),
(1, 12, 38.19, 430.9),
(1, 20, 63.27, 270.75),
(1, 36, 92.97, 899.45),
(1, 41, 73.89, 855.42),
(1, 46, 24.14, 623.62),
(1, 30, 51.45, 426.99),
(1, 9, 4.9, 987.99),
(1, 32, 34.07, 909.01),
(1, 44, 88.22, 438.7),
(1, 33, 37.37, 451.03),
(1, 23, 20.18, 729.05),
(1, 33, 11.37, 931.86),
(1, 40, 21.02, 199.63),
(1, 49, 69.38, 754.54),
(1, 20, 12.2, 983.55),
(1, 30, 36.38, 22.08),
(1, 42, 42.25, 496.76),
(1, 36, 81.16, 827.73),
(1, 20, 10.45, 115.38),
(1, 6, 87.22, 913.76),
(1, 43, 28.03, 806.55),
(1, 45, 79.97, 654.65),
(1, 35, 19.37, 552.4),
(1, 11, 40.16, 647.56),
(1, 5, 58.56, 936.94),
(1, 10, 67.15, 694.9),
(1, 37, 0.16, 744.42),
(1, 5, 28.7, 367.35),
(1, 22, 82.3, 929.23),
(1, 42, 59.36, 429.77),
(1, 31, 66.61, 238.42),
(1, 18, 7.57, 842.99),
(1, 21, 17.08, 681.25),
(1, 19, 5.51, 142.53),
(1, 25, 98.38, 23.66),
(1, 43, 70.99, 84.91),
(1, 1, 48.21, 88.26),
(1, 40, 71.14, 268.41),
(1, 3, 30.46, 395.84),
(1, 7, 22.41, 824.17),
(1, 46, 52.99, 197),
(1, 50, 24.15, 893.63),
(1, 25, 71.44, 46.04),
(1, 39, 90.28, 687.46),
(1, 31, 42.17, 696.65),
(1, 5, 33.22, 811.21),
(1, 16, 7.47, 16.27),
(1, 16, 59.96, 660.87),
(1, 9, 86.02, 430.82),
(1, 15, 28.09, 164.5),
(1, 39, 16.04, 73.81),
(1, 29, 41.56, 391.57),
(1, 18, 79.81, 325.32),
(1, 48, 0.66, 100.33),
(1, 21, 91.18, 991.25),
(1, 47, 54.46, 670.51),
(1, 5, 64.9, 430.61),
(1, 50, 37.06, 823.95),
(1, 1, 73.92, 176.49),
(1, 33, 76.6, 992.93),
(1, 7, 26.28, 396.63),
(1, 35, 25.99, 211.34),
(1, 40, 43.83, 993.3),
(1, 28, 39.8, 169.86),
(1, 28, 15.57, 601.39),
(1, 22, 29.38, 242.09),
(1, 20, 17.05, 365.19),
(1, 11, 94.48, 850.14),
(1, 31, 71.09, 705.13),
(1, 8, 53.17, 0.68),
(1, 28, 9.16, 358.21),
(1, 22, 75.97, 324.85),
(1, 3, 93.51, 357.38),
(1, 41, 68.46, 849.4),
(1, 25, 47.7, 661.4),
(1, 10, 94.67, 253.83),
(1, 39, 93.26, 274.7),
(1, 13, 83.11, 531.13),
(1, 49, 86.12, 12.86),
(1, 42, 2.95, 300.29),
(1, 4, 33.68, 79.47),
(1, 8, 20.91, 869.42),
(1, 14, 35.63, 260.36),
(1, 10, 69.2, 393.98),
(1, 18, 64.43, 486.94),
(1, 20, 54.36, 125.15),
(1, 42, 48.53, 475.08),
(1, 12, 62.95, 430.96),
(1, 26, 7.55, 344.27),
(1, 7, 91.91, 776.22),
(1, 13, 35.22, 728.8),
(1, 11, 20.02, 639.18),
(1, 6, 72.22, 770.1),
(1, 28, 51.89, 958.35),
(1, 46, 60.34, 869.52),
(1, 37, 7.79, 78.05),
(1, 40, 56.95, 314.06),
(1, 7, 12.2, 998.29),
(1, 24, 19.48, 454.45),
(1, 6, 28.88, 374.47),
(1, 37, 65.66, 807.74),
(1, 1, 82.61, 372.17),
(1, 16, 4.93, 592.38),
(1, 13, 52.65, 22.67),
(1, 17, 14.63, 44.85),
(1, 26, 51.9, 808.54),
(1, 9, 53.54, 849.51),
(1, 3, 28.23, 960.51),
(1, 22, 45.28, 373.53),
(1, 41, 0.3, 431.57),
(1, 16, 17.98, 782.04),
(1, 30, 5.35, 932.5),
(1, 3, 88.68, 998.87),
(1, 17, 26.12, 349.59),
(1, 14, 99.65, 388.69),
(1, 41, 37.21, 597.47),
(1, 29, 88.64, 666.11),
(1, 40, 51.26, 353.64),
(1, 5, 42.89, 547.68),
(1, 26, 1.06, 736.87),
(1, 34, 44.27, 937.71),
(1, 35, 31.57, 665.16),
(1, 34, 49.58, 2.61),
(1, 37, 23.22, 591.97),
(1, 28, 4.73, 21.98),
(1, 12, 72.31, 124.69),
(1, 37, 28.55, 947.67),
(1, 44, 97.36, 571.12),
(1, 45, 87.39, 991.43),
(1, 43, 48.19, 527.44),
(1, 43, 30.8, 780.47),
(1, 32, 37.64, 500.66),
(1, 2, 89.13, 884.42),
(1, 39, 68.19, 342.56),
(1, 43, 68.33, 259.79),
(1, 50, 40.91, 201.48),
(1, 34, 63.88, 517.64),
(1, 35, 36, 314.7),
(1, 25, 50.04, 95.43),
(1, 34, 71.84, 560.02),
(1, 49, 95.47, 802.77),
(1, 23, 54.84, 840.94),
(1, 23, 33.36, 609.42),
(1, 16, 53.65, 239.73),
(1, 41, 91.71, 75.15),
(1, 44, 39.29, 922.34),
(1, 32, 28.68, 806.91),
(1, 26, 16.25, 476.74),
(1, 36, 30.38, 765.75),
(1, 9, 34.23, 59.89),
(1, 30, 57.4, 298.03),
(1, 21, 13.96, 178.67),
(1, 15, 76.58, 60.67),
(1, 50, 34.69, 122.31),
(1, 20, 60.12, 726.88),
(1, 48, 65.19, 428.22),
(1, 20, 28.2, 373.5),
(1, 29, 69.29, 339.71),
(1, 18, 64.58, 527.13),
(1, 38, 92.92, 304.2),
(1, 31, 89.52, 466.46),
(1, 29, 95.11, 512.86),
(1, 38, 86.58, 487.99),
(1, 29, 78.53, 472.04),
(1, 10, 90.52, 32.18),
(1, 36, 19.46, 114.79),
(1, 50, 87.44, 764.43),
(1, 35, 30.29, 116.88),
(1, 22, 30.94, 740.41),
(1, 10, 12.14, 444.63),
(1, 50, 13.5, 6.17),
(1, 18, 27.4, 600.07),
(1, 20, 60.35, 645.05),
(1, 9, 81.95, 931.67),
(1, 47, 85.15, 288.52),
(1, 17, 52.94, 960.33),
(1, 46, 72.15, 597.23),
(1, 28, 54.17, 806.15),
(1, 47, 10.51, 127.36),
(1, 2, 26.36, 538.09),
(1, 35, 83.55, 112.47),
(1, 50, 85.62, 234.02),
(1, 5, 31.44, 189.09),
(1, 1, 81.77, 594.43),
(1, 48, 46.36, 589.68),
(1, 7, 53.02, 264.73),
(1, 36, 54.58, 566.26),
(1, 40, 38.9, 899.02),
(1, 8, 2.69, 4.09),
(1, 12, 50.73, 458.3),
(1, 21, 92.23, 617.76),
(1, 26, 69.21, 230.17),
(1, 2, 46.19, 898.01),
(1, 9, 96.23, 24.67),
(1, 26, 57.99, 549.49),
(1, 47, 4.14, 987.98),
(1, 38, 76.93, 906.4),
(1, 37, 73.6, 852),
(1, 19, 20.58, 171.42),
(1, 27, 67.8, 240.01),
(1, 48, 45.93, 27.92),
(1, 49, 51.4, 662.37),
(1, 40, 53.48, 315.44),
(1, 39, 46.28, 80.32),
(1, 12, 39.08, 984.59),
(1, 25, 99.74, 954.11),
(1, 12, 32.77, 680.62),
(1, 15, 95.57, 779.08),
(1, 42, 47.04, 163.06),
(1, 18, 36.17, 931.65),
(1, 36, 59, 627.57),
(1, 42, 75.09, 205.91),
(1, 8, 67.46, 948.97),
(1, 45, 80.87, 660.24),
(1, 7, 19.84, 319.2),
(1, 6, 43.88, 221.45),
(1, 22, 60.81, 70.86),
(1, 11, 93.15, 439.78),
(1, 10, 22.89, 765.13),
(1, 13, 63.26, 609.58),
(1, 34, 3.57, 148.43),
(1, 3, 18.51, 712.89),
(1, 48, 63, 692.96),
(1, 28, 75.62, 940.13),
(1, 3, 65.65, 607.26),
(1, 30, 22.44, 578.83),
(1, 24, 75.96, 635.22),
(1, 25, 19.08, 287.85),
(1, 41, 5.36, 228.01),
(1, 50, 68.18, 821.35),
(1, 42, 39.77, 114.07),
(1, 2, 87.77, 799.03),
(1, 10, 97.8, 861.15),
(1, 16, 81.64, 452.19),
(1, 40, 8.84, 364.5),
(1, 29, 38.95, 430.78),
(1, 8, 83.31, 964.22),
(1, 33, 29.34, 501.48),
(1, 10, 32.24, 974.04),
(1, 6, 27.5, 161.25),
(1, 30, 28.14, 528.25),
(1, 33, 12.99, 964.5),
(1, 20, 56.98, 307.42),
(1, 28, 68.83, 992.79),
(1, 25, 59.79, 688.24),
(1, 31, 32.79, 699.72),
(1, 38, 59.27, 814.83),
(1, 22, 88.03, 42.21),
(1, 48, 44.99, 615.33),
(1, 3, 19.98, 292.16),
(1, 47, 33.46, 536.15),
(1, 47, 19.4, 700.5),
(1, 38, 40.92, 460.63),
(1, 28, 63.65, 66.83),
(1, 29, 68.6, 651.55),
(1, 42, 91.42, 268.22),
(1, 34, 12.84, 243.25),
(1, 40, 1.26, 965.57),
(1, 47, 12.76, 276.46),
(1, 30, 35.44, 540.32),
(1, 20, 46.36, 234.05),
(1, 45, 69.28, 524.43),
(1, 34, 69.19, 733.79),
(1, 37, 6.06, 763.1),
(1, 42, 72.47, 414.14),
(1, 48, 30.41, 959.72),
(1, 48, 82.74, 906.42),
(1, 21, 73.25, 554.09),
(1, 22, 66.86, 841.28),
(1, 13, 52.54, 293.07),
(1, 24, 16.71, 594.91),
(1, 29, 61.9, 752.68),
(1, 22, 26.46, 832.79),
(1, 35, 45.94, 216.93),
(1, 9, 79.14, 730.97),
(1, 46, 88.7, 113.37),
(1, 26, 50.72, 879.72),
(1, 26, 54.52, 107.5),
(1, 39, 6.33, 943.65),
(1, 9, 92.48, 570.21),
(1, 9, 46.25, 857.1),
(1, 25, 96.21, 53.69),
(1, 19, 84.87, 558.24);
