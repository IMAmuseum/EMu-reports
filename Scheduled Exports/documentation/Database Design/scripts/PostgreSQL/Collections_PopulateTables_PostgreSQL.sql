USE CollectionsTest
GO

--INSERT SAMPLE VALUES INTO LOCATIONS TABLE
INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (738,FALSE,'Ac1.lv1','IMA','storage','Ac1','lv1',null,null,null,null,'2022-07-01');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (2351,FALSE,'P.63w','IMA','storage','P','63w',null,null,null,null,'2021-08-15');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (10315,FALSE,'F25.cg5.r6.lv4','IMA','Print Storage','F25','cg5','r6','lv4',null,null,'2022-05-02');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (10326,FALSE,'F25.cg5.r7.lv13','IMA','Print Storage','F25','cg5','r7','lv13',null,null,'2022-03-02');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (326,TRUE,'G','IMA','Grounds','G',null,null,null,null,null,'2021-03-03');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (87,FALSE,'On Loan','On Loan',null,null,null,null,null,null,null,'2018-07-10');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (14123,FALSE,'W303.c1.wall','IMA','Eiteljorg Suite of African and Oceanic Art','W303','c1','wall',null,null,null,'2019-08-01');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (9972,FALSE,'F25.cg6.r4.lv12','IMA','Print Storage','F25','cg6','r4','lv12',null,null,'2015-08-02');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (3674,FALSE,'P.10w','IMA','storage','P','10w',null,null,null,null,'2016-02-02');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (35,FALSE,'Ec43.lv4','IMA','storage','Ec43','lv4',null,null,null,null,'2020-09-10');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (14825,TRUE,'W202','IMA','Pulliam Family Great Hall','W202',null,null,null,null,null,'2021-03-09');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (3965,FALSE,'P.92w','IMA','storage','P','92w',null,null,null,null,'2021-10-10');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (452,TRUE,'ANP','IMA','The Virginia B. Fairbanks Art & Nature Park',null,null,null,null,null,null,'2022-03-20');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (1050,FALSE,'P.18w','IMA','storage','P','18w',null,null,null,null,'2021-09-10');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (7246,FALSE,'Tc58.lv2','IMA','storage','Tc58','lv2',null,null,null,null,'2021-10-11');

INSERT INTO locations (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (19,FALSE,'Disposed','IMA','Disposed',null,null,null,null,null,null,'2016-01-15');


--INSERT SAMPLE VALUES INTO DEPARTMENTS TABLE
INSERT INTO departments (department)
VALUES ('Asian Art (Chinese and other Asian)');

INSERT INTO departments (department)
VALUES ('American Painting and Sculpture 1800-1945');

INSERT INTO departments (department)
VALUES ('Asian Art (Japanese and Korean)');

INSERT INTO departments (department)
VALUES ('Contemporary');

INSERT INTO departments (department)
VALUES ('African Art');

INSERT INTO departments (department)
VALUES ('Prints, Drawings, and Photographs');

INSERT INTO departments (department)
VALUES ('European Painting and Sculpture Before 1800');

INSERT INTO departments (department)
VALUES ('Native Arts of the Americas');

INSERT INTO departments (department)
VALUES ('Lilly House');

INSERT INTO departments (department)
VALUES ('Textile and Fashion Arts');

INSERT INTO departments (department)
VALUES ('Decorative Arts');


--INSERT SAMPLE VALUES INTO FLAGS TABLE
INSERT INTO flags (flag)
VALUES ('Luce Digitization Project');

INSERT INTO flags (flag)
VALUES ('Approved for Off-site Use - Westerley Only');

INSERT INTO flags (flag)
VALUES ('Diversity Cataloging Project');

INSERT INTO flags (flag)
VALUES ('Male');

INSERT INTO flags (flag)
VALUES ('White');

INSERT INTO flags (flag)
VALUES ('Blanket Record');

INSERT INTO flags (flag)
VALUES ('Geographic Location: Africa');

INSERT INTO flags (flag)
VALUES ('Part Record');

INSERT INTO flags (flag)
VALUES ('WWII-Era Provenance Research');

INSERT INTO flags (flag)
VALUES ('Deaccessioned');

INSERT INTO flags (flag)
VALUES ('Disposed');


--INSERT SAMPLE VALUES INTO TYPES TABLE
INSERT INTO types (type)
VALUES ('vases');

INSERT INTO types (type)
VALUES ('paintings');

INSERT INTO types (type)
VALUES ('oil paintings');

INSERT INTO types (type)
VALUES ('prints');

INSERT INTO types (type)
VALUES ('color woodcuts');

INSERT INTO types (type)
VALUES ('outdoor sculpture');

INSERT INTO types (type)
VALUES ('earplugs');

INSERT INTO types (type)
VALUES ('lithographs');

INSERT INTO types (type)
VALUES ('costume accessories (worn)');

INSERT INTO types (type)
VALUES ('jewelry');

INSERT INTO types (type)
VALUES ('necklaces');

INSERT INTO types (type)
VALUES ('sculptures');

INSERT INTO types (type)
VALUES ('installations');

INSERT INTO types (type)
VALUES ('furnishings');

INSERT INTO types (type)
VALUES ('textiles');

INSERT INTO types (type)
VALUES ('bed coverings');

INSERT INTO types (type)
VALUES ('quilts');

INSERT INTO types (type)
VALUES ('appliqué quilts');

INSERT INTO types (type)
VALUES ('dinnerware');


--INSERT SAMPLE VALUES INTO MEDIUMS TABLE
INSERT INTO mediums (medium)
VALUES ('glaze');

INSERT INTO mediums (medium)
VALUES ('oil paint');

INSERT INTO mediums (medium)
VALUES ('ink');

INSERT INTO mediums (medium)
VALUES ('colored ink');

INSERT INTO mediums (medium)
VALUES ('paint');

INSERT INTO mediums (medium)
VALUES ('metal');

INSERT INTO mediums (medium)
VALUES ('synthetic resin');

INSERT INTO mediums (medium)
VALUES ('pigment');

INSERT INTO mediums (medium)
VALUES ('plastic');

INSERT INTO mediums (medium)
VALUES ('earthenware');


--INSERT SAMPLE VALUES INTO SUPPORTS TABLE
INSERT INTO supports (support)
VALUES ('stoneware');

INSERT INTO supports (support)
VALUES ('canvas');

INSERT INTO supports (support)
VALUES ('paper');

INSERT INTO supports (support)
VALUES ('aluminum');

INSERT INTO supports (support)
VALUES ('plaster');

INSERT INTO supports (support)
VALUES ('wood');

INSERT INTO supports (support)
VALUES ('panels');

INSERT INTO supports (support)
VALUES ('shell');

INSERT INTO supports (support)
VALUES ('beads');

INSERT INTO supports (support)
VALUES ('steel');

INSERT INTO supports (support)
VALUES ('paint');

INSERT INTO supports (support)
VALUES ('plastic');

INSERT INTO supports (support)
VALUES ('cotton {fabric}');

INSERT INTO supports (support)
VALUES ('earthenware');


--INSERT SAMPLE VALUES INTO MARK_TYPES TABLE
INSERT INTO mark_types (mark_type)
VALUES ('Signature');

INSERT INTO mark_types (mark_type)
VALUES ('Seal');

INSERT INTO mark_types (mark_type)
VALUES ('Inscriptions');

INSERT INTO mark_types (mark_type)
VALUES ('Incised');

INSERT INTO mark_types (mark_type)
VALUES ('No Mark Found');

INSERT INTO mark_types (mark_type)
VALUES ('Stamp');

INSERT INTO mark_types (mark_type)
VALUES ('Date');

INSERT INTO mark_types (mark_type)
VALUES ('Foundry Mark');


--INSERT SAMPLE VALUES INTO RIGHTS_URIS TABLE
INSERT INTO rights_uris (type, uri)
VALUES ('RightsStatements.org URI','http://rightsstatements.org/vocab/NoC-US/1.0/');

INSERT INTO rights_uris (type, uri)
VALUES ('RightsStatements.org URI','http://rightsstatements.org/vocab/InC/1.0/');


--INSERT SAMPLE VALUES INTO ROLES TABLE
INSERT INTO roles (role)
VALUES ('artist');

INSERT INTO roles (role)
VALUES ('IMA Staff');

INSERT INTO roles (role)
VALUES ('publisher');

INSERT INTO roles (role)
VALUES ('printmaker');

INSERT INTO roles (role)
VALUES ('painter');

INSERT INTO roles (role)
VALUES ('designer');

INSERT INTO roles (role)
VALUES ('calligrapher');

INSERT INTO roles (role)
VALUES ('draftsman');

INSERT INTO roles (role)
VALUES ('marine painter');

INSERT INTO roles (role)
VALUES ('sculptor');

INSERT INTO roles (role)
VALUES ('Origin');

INSERT INTO roles (role)
VALUES ('manufacturer');

INSERT INTO roles (role)
VALUES ('author');

INSERT INTO roles (role)
VALUES ('Culture or People');

INSERT INTO roles (role)
VALUES ('printer');

INSERT INTO roles (role)
VALUES ('photographer');

INSERT INTO roles (role)
VALUES ('Maker');

INSERT INTO roles (role)
VALUES ('Creator');

INSERT INTO roles (role)
VALUES ('foundry');

INSERT INTO roles (role)
VALUES ('decorative artist');

INSERT INTO roles (role)
VALUES ('ceiling painter');

INSERT INTO roles (role)
VALUES ('portraitist');

INSERT INTO roles (role)
VALUES ('court artist');

INSERT INTO roles (role)
VALUES ('illustrator');

INSERT INTO roles (role)
VALUES ('teacher');

INSERT INTO roles (role)
VALUES ('writer');

INSERT INTO roles (role)
VALUES ('collector');

INSERT INTO roles (role)
VALUES ('Owner');

INSERT INTO roles (role)
VALUES ('collaborator');

INSERT INTO roles (role)
VALUES ('Dealer');


--INSERT SAMPLE VALUES INTO OBJECTS TABLE
INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (1032,null,TRUE,'Accessioned','60.63','TR5488/1',1960,10,10,'long-neck vase with cup mouth',null,null,'100-220',100,220,null,null,null,null,'Eastern Han dynasty','Containers','green glazed stoneware',null,null,null,'17-1/4 in.','Gift of Mr. and Mrs. Eli Lilly','Public Domain','(Jan W.A. Kleijkamp); purchased by Eli Lilly, Indianapolis, Indiana, May 1950 ( list noting 15 November 1950 $950.); given to the John Herron Art Institute, now the Indianapolis Museum of Art, in 1960.',1,FALSE,1,null,null,null,null,null,null,null,null,'2021-10-25');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (1065,null,TRUE,'Accessioned','14.55',null,1914,2,19,'The Bachelor Boudoir (Corner of the Studio)',null,null,'about 1883',1882,1883,null,null,null,null,null,'Visual Works: Paintings','oil on canvas','painting',null,'Signed, l.r.: C FISCUS','27-1/4 x 16-1/4 in. (canvas)\n34-3/4 x 24-3/4 x 4 in. (framed)','Gift of the Artist''s mother, Mrs. E.J. Fiscus','Public Domain',null,2,FALSE,2,null,null,null,null,null,null,null,null,'2022-05-16');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (21137,80085,TRUE,'Accessioned','06.137',null,1906,5,1,'Hakone','The Fifty-three Stations of the T^okaid^o',null,'1833-1834',1833,1834,null,null,null,'Edo',null,'Visual Works: Prints','ink on paper, color woodblock print','woodcutting',null,'Signed by artist: Hiroshige ga\nPublisher''s mark: Hōeidō (Takenouchi Magohachi)\nSeal with subtitle: Kosuizu\nInscribed: title and series title','9 x 13-15/16 in. (image, sheet trimmed to image on all sides)','John Herron Fund','Public Domain','Purchased by the John Herron Art Institute, Indianapolis, Indiana, now the Indianapolis Museum of Art at Newfields, in 1906.',3,FALSE,3,null,null,null,null,null,null,null,null,'2022-06-07');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (52481,null,TRUE,'Accessioned','44.91','TR4585/9ab',1944,6,20,'Spring snow on Sumida River 隅田川　春雪',null,'Amusement of the Eastern Capital  狂歌東遊  (Ehon Azuma asobi)','about 1802',1797,1807,null,null,null,'Edo',null,'Visual Works: Prints','color woodblock print',null,null,'Kyoka poem','8-3/4 x 12 in.','Gift of Charles C. Kryter','No Known Rights Holder',null,3,FALSE,4,null,null,null,null,null,null,null,null,'2022-02-22');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (82696,null,TRUE,'Accessioned','2013.443A-E.4','TR11707A-E.4',2013,12,12,'Five Brushstrokes',null,null,'fabricated 2012',2012,2012,'1983-1984',1983,1984,null,null,'Visual Works: Sculpture','painted aluminum',null,null,'rf Lichtenstein 83-84 AP <copyright> The Roy Lichtenstein Foundation, 2012','Element A) 372 x 36 x 11 in.\nElement B) 98 x 357 x 10-1/4 in.\nElement C) 104 x 271 x 12 in.\nElement D) 228 x 100 x 11 in.\nElement E.1-.4) 480 x 77 x 15 in. (assembled)','Robert L. and Marjorie J. Mann Fund, Partial Gift of the Roy Lichtenstein Foundation','© Roy Lichtenstein Foundation','(Roy Lichtenstein Foundation, New York, New York); purchased by the Indianapolis Museum of Art in 2013.',4,TRUE,5,null,null,null,null,null,null,null,null,'2021-02-11');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (47035,null,TRUE,'Accessioned','08.19',null,1908,null,null,'Statue of Augustus Caesar',null,null,'before 1908',null,1908,null,null,null,null,null,'Visual Works: Sculpture','plaster cast','casting','Roman',null,'87 in.','Gift of Mary E. Nicholson','Public Domain',null,2,FALSE,6,null,null,null,null,null,null,null,null,'2022-04-26');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (64017,null,TRUE,'Accessioned','2007.4A-B','TR10523/3A-B',2007,4,10,'pair of earplugs (for man or woman)',null,null,'mid-20th century',1920,1960,null,null,null,null,null,'Costume Accessories','wood, synthetic resin, metal tacks',null,null,null,'1/2 x 2 (diam.) in.','General Memorial Art Fund','No Known Rights Holder','Probably with (Rhoda Levinsohn, Cleveland, Ohio) by 1983;[1] (Axis Gallery, West Orange, New Jersey) in 2000; purchased by the Indianapolis Museum of Art, Indianapolis, Indiana in 2007.\n\n[1] Information provided by Gary van Wyk, Axis Gallery, New York.',5,TRUE,7,null,null,null,null,null,null,null,null,'2020-04-10');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (64018,null,FALSE,'Accessioned','2007.4A','TR10523/3A',2007,4,10,'earplug',null,null,'1950-1970',1950,1970,null,null,null,null,null,'Costume Accessories','wood, synthetic resin, metal',null,null,null,'1/2 x 2 (diam.) in.','General Memorial Art Fund','No Known Rights Holder','Probably with (Rhoda Levinsohn, Cleveland) by 1983;[1] (Axis Gallery, West Orange, New Jersey) in 2000; acquired by IMA in 2007.\n\n[1] Information provided by Gary van Wyk, Axis Gallery, New York.',5,TRUE,7,7,null,null,null,null,null,null,null,'2020-04-02');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (64019,null,FALSE,'Accessioned','2007.4B','TR10523/3B',2007,4,10,'earplug (for man or woman)',null,null,'1920-1960',1920,1960,null,null,null,null,null,'Costume Accessories','wood, synthetic resin, metal tacks',null,null,null,'1/2 x 2 (diam.) in.','General Memorial Art Fund','No Known Rights Holder','Probably with (Rhoda Levinsohn, Cleveland) by 1983;[1] (Axis Gallery, West Orange, New Jersey) in 2000; acquired by IMA in 2007.\n\n[1] Information provided by Gary van Wyk, Axis Gallery, New York.',5,TRUE,7,7,null,null,null,null,null,null,null,'2020-04-02');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (21444,null,TRUE,'Accessioned','27.25','TR941/2',1927,10,18,'Souvenir de la Scheideges',null,null,'19th century',1801,1900,null,null,null,null,null,'Visual Works: Prints','lithograph on chine collé','lithography',null,'Inscribed in plate above image: Oeuvres de A. Calame\nInscribed in plate below image: Imp. Jacomme & Cie R. de Lancry, 18 Paris, du Cabinet de M. Mussard Cons. d'' Etat''. F. Delarue Editeur, rue J. J. Rousseau, 18, Paris\nSigned in plate: 1094 B. A. Calame - 7ime Livraison - 1853 - No. 7','7-1/8 x 9-1/8 in. (image)\n12 x 18 in. (sheet)','Anonymous Gift','Public Domain',null,6,FALSE,8,null,null,null,null,null,null,null,null,'2020-12-14');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (33886,null,TRUE,'Accessioned','2020.1','C10007',2020,8,27,'Temptation of St. Anthony',null,null,'1575-1600',1575,1600,null,null,null,null,null,'Visual Works: Paintings','oil on panel',null,null,'Not Inscribed','23-3/4 x 19-1/4 in.\n30-1/8 x 26 in. (framed)','The Clowes Collection','Public Domain','Gustav von Gerhardt, Budapest, Hungary, until 1911.{1} Mrs. Moric Palugyay and Mrs. Moric Tomcsanyi. Budapest, by 1927.{2} (Ivan N. Podgoursky, New York, New York); George Henry Alexander Clowes, Indianapolis, Indiana, in 1944; The Clowes Fund, Indianapolis, from 1958–2020, and on long-term loan to the Indianapolis Museum of Art, since 1971; given to the Indianapolis Museum of Art at Newfields, in 2020.\n\n{1} Sammlung des. Königl[ichen]. Ungar[ischen]. Hofrats Gustav von Gerhardt, Budapest : Zweiter Teil : Gemälde Alter Meister, sale catalogue, Rudolph Lepke’s Kunst-Auctions-Haus, Berlin, 10 November 1911, no. 61, plate 30.\n{2} Catalogue de l''Exposition Belge d''art Ancien et Moderne, Budapest: Imp. de la Société Anonyme Athenaeum, 1927, 34, no. 191.',7,FALSE,9,null,null,null,null,null,null,null,null,'2022-03-30');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (16410,null,TRUE,'Accessioned','14.231','1965.14',1914,6,1,'necklace',null,null,'before 1910',null,1910,null,null,null,null,null,'Costume Accessories','shell beads',null,null,null,'12-1/2 x 2-1/2 x 3/8 in.','Gift of Hugh McKennan Landon','No Known Rights Holder','Collected by Arthur Henn, Hugh McKennan Landon Expedition to Ecuador and Peru under the direction of Dr. Carl H. Eigenmann of Indiana University; Hugh McKennan Landon [1868-1947] Indianapolis, Indiana; given to the John Herron Art Institute, now the Indianapolis Museum of Art at Newfields, Indianapolis, Indiana in 1914.',8,FALSE,10,null,null,null,null,null,null,null,null,'2020-06-19');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (20419,null,TRUE,'Accessioned','75.174','TR8614',1975,10,2,'Love',null,null,'1970',1970,1970,null,null,null,null,null,'Visual Works: Sculpture','Cor-ten steel','welding',null,'Stamped, lower proper right edge of the \E\"" along the full length: 1 [gapped]  [copyright symbol] R INDIANA  [in stencilled font] 1970  [HF symbol for Herbert Feuerlicht, Technical Supervisor of Triad Designs] [three stacked lines of smaller text] WORK EXECUTED BY  |  Lippincott  |  NORTH HAVEN CONN""','144 x 144 x 72 in.','Gift of the Friends of the Indianapolis Museum of Art in memory of Henry F. DeBoest.  Restoration was made possible by Patricia J. and James E. LaCrosse.','© Morgan Art Foundation/Artists Rights Society (ARS), New York','(Robert Indiana, New York, New York); Purchased by the Indianapolis Museum of Art, Indinianapolis, Indiana, in 1975.',4,TRUE,11,null,null,null,null,null,null,null,null,'2022-04-26');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (14617,null,FALSE,'Deaccessioned','67.10.48',null,1967,null,null,'Matthew Prior',null,null,'late 17th - early 18th century',1675,1825,null,null,null,null,null,'Visual Works: Paintings','oil on canvas',null,null,null,'39-3/16 x 33-1/4 in. (canvas)\n45-1/8 x 39 x 2-3/8 in. (framed)','Gift of the Children of J.K. Lilly, Jr.','No Known Rights Holder','J.K. Lilly, Jr, Indianapolis, Indiana; by descent to his children; given to the John Herron Art Institute, now the Indianapolis Museum of Art at Newfields, in 1967.',9,FALSE,12,null,'Deaccession',2021,5,3,17,'Lilly House reclassification',null,'2022-02-24');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (68903,null,TRUE,'Accessioned','2010.217','TR11136',2010,9,16,'Free Basket',null,null,'2010',2010,2010,null,null,null,null,null,'Visual Works: Sculpture',null,null,null,null,'various dimensions','Commissioned by the Indianapolis Museum of Art, purchased with funds provided by the Griffith Foundation Gift, in memory of Melvin Simon','© Los Carpinteros. Courtesy Sean Kelly Gallery, New York.','Commissioned by the Indianapolis Museum of Art.',4,TRUE,13,null,null,null,null,null,null,null,null,'2020-11-13');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (29270,41696,TRUE,'Accessioned','26.189','TR835/1',1926,12,21,'The Art Jury',null,null,'1921',1921,1921,null,null,null,null,null,'Visual Works: Paintings','oil on canvas','painting',null,'Signed, l.l.: Wayman Adams','82-1/4 x 54-1/4 in. (canvas)\n86-1/2 x 59 x 2-1/2 in. (framed)','Gift to the Art Association through popular subscription','© Wayman Adams','Purchased from the artist by a group of local patrons for the museum.',2,FALSE,14,null,null,null,null,null,null,null,null,'2022-06-08');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (19677,null,TRUE,'Deaccessioned','S4344.81.1','TR4344/1',1981,null,null,'quilt (Star of Bethlehem)',null,null,'about 1930',1927,1933,null,null,null,null,null,'Furnishings','cotton, appliquéd and quilted','quilting',null,null,'84 x 86 in.','Gift of Edgar B. Howard','No Known Rights Holder','Edgar B. Howard, New York; given to the Indianapolis Museum of Art, Indianapolis, Indiana, 17 December 1981.',10,FALSE,15,null,'Deaccession',2021,11,16,null,null,null,'2022-02-03');

INSERT INTO objects (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department_id,on_view,location_id,parent_id,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,recipient_id,transfer_notes,sale_price,date_modified)
VALUES (18078,null,TRUE,'Deaccessioned','73.74.1','TR0077/1',1973,null,null,'plate',null,null,null,null,null,null,null,null,null,null,'Containers','dinnerware','earthenware',null,null,'D: 9-1/4 in.','Gift of Mrs. C. W. Weathers from the Hazel H. Force Estate','No Known Rights Holder',null,11,FALSE,16,null,'Deaccession',2011,9,15,22,'Transferred to Susanin''s Premiere Auctions; Sold on 5/12/2012 in Premiere Sale 111 (lot 2082)',2.22,'2022-02-03');


--INSERT SAMPLE VALUES INTO PARTIES TABLE
INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (733,TRUE,'Registration Verified','Charles J. Fiscus',null,'Charles','J.','Fiscus',null,'Male','American','1861',null,'1884',null,null,null,null,null,null,'2022-02-18');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (9711,FALSE,'IMA Staff','Leslie Anderson-Perkins',null,'Leslie',null,'Anderson-Perkins',null,'Female',null,null,null,null,null,null,null,null,null,null,'2022-03-02');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (592,TRUE,'Person','Utagawa Hiroshige',null,null,null,'Utagawa Hiroshige 歌川広重',null,'Male','Japanese','1797',null,'1858',null,null,null,null,null,null,'2022-06-08');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (2515,TRUE,'Registration Verified',null,null,null,null,'H^oeid^o',null,'Unknown',null,null,null,null,null,null,null,null,null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (2514,TRUE,'Registration Verified','Takenouchi Magohachi',null,null,null,'Takenouchi Magohachi',null,null,null,null,null,null,null,null,null,null,null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (11362,FALSE,'Person','Katsushika Hokusai 葛飾北斎',null,null,null,'Katsushika Hokusai 葛飾北斎',null,'Male','Japanese','1760',null,'1849',null,null,null,null,null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (613279,TRUE,'Place Holder','Roy Lichtenstein',null,'Roy',null,'Lichtenstein',null,'Male','American','1923',null,'1997',null,null,null,null,null,null,'2022-06-08');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (2741,TRUE,'Registration Verified','Unknown',null,null,null,'Unknown',null,null,null,null,null,null,null,null,null,null,null,null,'2019-05-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (601,TRUE,'Place Holder','Alexandre Calame',null,'Alexandre',null,'Calame',null,'Male','Swiss','1810',null,'1864',null,null,null,null,null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (14044,FALSE,'Organisation','Jacomme & Cie',null,null,null,null,null,null,null,null,null,null,null,'Jacomme & Cie',null,null,null,null,'2020-12-14');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (12095,TRUE,'Person','François Delarue',null,'François',null,'Delarue',null,'Male','French',null,null,null,null,null,'circa 1850''s','circa 1860''s',null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (600739,TRUE,'Place Holder','Hieronymus Bosch',null,'Hieronymus',null,'Bosch',null,'Male','Netherlandish','1450',null,'1516',null,null,null,null,null,null,'2022-06-08');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (615130,TRUE,'Person','Robert Indiana',null,'Robert',null,'Indiana',null,'Male','American','1928','New Castle, Indiana','2018','Vinalhaven, Maine',null,null,null,null,null,'2022-06-08');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (10433,TRUE,'Organisation','Lippincott, LLC',null,null,null,null,null,'Unknown','American',null,null,null,null,'Lippincott, LLC','1966',null,null,null,'2019-02-18');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (610521,TRUE,'Place Holder','James Thornhill',null,'James',null,'Thornhill',null,'Male','British','1675',null,'1734',null,null,null,null,null,null,'2016-08-17');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (619988,TRUE,'Place Holder','Jonathan Richardson the elder',null,'Jonathan',null,'Richardson','the elder','Male','British','1665',null,'1745',null,null,null,null,null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (14152,FALSE,'Organisation','Lilly House and Gardens',null,null,null,null,null,null,null,null,null,null,null,'Lilly House and Gardens',null,null,null,null,'2021-07-19');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (7052,FALSE,'Collaboration','Los Carpinteros',null,null,null,null,null,null,'Cuban',null,null,null,null,null,'1992',null,'Los Carpinteros',null,'2021-06-23');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (7051,TRUE,'Registration Verified','Dagoberto Rodríguez Sánchez',null,'Dagoberto',null,'Rodríguez Sánchez',null,'Male','Cuban','1969','Cuba',null,null,null,null,null,null,null,'2019-01-09');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (7050,TRUE,'Registration Verified','Marco A. Castillo Valdés',null,'Marco','Antonio','Castillo Valdés',null,'Male','Cuban','1971','Cuba',null,null,null,null,null,null,null,'2019-01-10');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (620,TRUE,'Place Holder','Wayman Adams',null,'Wayman',null,'Adams',null,'Male','American','1883','Muncie, Indiana','1959','Austin, Texas',null,null,null,null,null,'2022-02-18');

INSERT INTO parties (emu_irn,publish,party_type,full_name,title,first_name,middle_name,last_name,suffix,gender,nationality,birth_date,birth_place,death_date,death_place,organization_name,commencement_date,completion_date,collaboration_name,acronym,date_modified)
VALUES (4656,TRUE,'Organisation','Susanin''s Premier Auctions',null,null,null,null,null,null,null,null,null,null,null,'Susanin''s Premiere Auctions',null,null,null,null,'2019-01-10');


--INSERT SAMPLE VALUES INTO NARRATIVES TABLE
INSERT INTO narratives (emu_irn,publish,title,purpose,date_year,date_month,date_day,narrative,date_modified)
VALUES (6633,TRUE,'14.55_v01','Exhibition Label',2015,12,18,'<UL>\n<LI>The contents of Fiscus’s well-appointed workspace—leather-bound books, ceramic <EM>objets d’art,</EM> and a fur throw—provide the motif for this composition and demonstrate his ability to depict various textures. His range of subject matter is suggested by the charcoal portrait sketch, the fruit still-life painting, and the complex figural scene.<BR></LI>\n<LI>The teenaged artist thrived under the tutelage of Love and Gookins. A writer of the period observed: “Charles Fiscus was among the most talented pupils of [the] early school….”<BR></LI>\n<LI>After the Indiana School of Art shuttered its doors, Fiscus continued his studies under Gookins in Terre Haute and Chicago. Later, he participated in Indianapolis’s sketching groups until his untimely death at age 22.</LI></UL>','2017-01-09');

INSERT INTO narratives (emu_irn,publish,title,purpose,date_year,date_month,date_day,narrative,date_modified)
VALUES (2598,TRUE,'75.174_v01','Object Label',null,null,null,'<p>Over the past four years, Robert Indiana''s LOVE sculpture has undergone a major overhaul to secure its structural integrity. With the structural repairs now successfully completed, the IMA is taking the final steps to restore its surface appearance.</p> <p>Technicians recently used a fine air abrasive system to blast the sculpture''s surface in order to remove the original textured, dark purple and rust corrosion, which had been marred as a result of the structural repairs. Over the next few years, the clean, freshly exposed Cor-ten steel will re-weather outside and the smooth steel will transform from silver to a variegated purplish brown patina with iridescent overtones. The first stage of this process may surprise viewers because the sculpture will turn birth orange due to rusting which results from the steel being exposed to repeated wet and dry cycles outdoors. The pace of the change in patina will depend on weather conditions, but eventually the object will turn brown and then continue darkening to its popular, recognizable appearance.</p>','2015-08-06');

INSERT INTO narratives (emu_irn,publish,title,purpose,date_year,date_month,date_day,narrative,date_modified)
VALUES (1665,TRUE,'2007.4A-B_v01','Object Label',null,null,null,'<p>In former times an ear piercing ceremony was performed on every child before puberty. The earlobe was pierced with a sharp piece of iron. Pieces of corn stalk were placed in the holes, and as the ear healed larger and larger pieces were put into the hole until it was large enough to accommodate earplugs.</p> <p>The distended earlobes were adorned in early times with circular plugs of wood, sometimes decorated with metal studs. From about 1950 to 1970 pieces of synthetic floor covering were applied in mosaic fashion to one or both sides of the earplugs. The colors relate to those of traditional Zulu beadwork, and some color combinations may indicate clan affiliation or other aspects of an individual.</p> <p>The long standing Zulu practice of wearing earplugs is associated with both men and women. Today, people increasingly relate the stretching of earlobes with a lack of sophistication, and the wearing of earplugs is falling out of fashion.</p>','2015-08-04');


--INSERT SAMPLE VALUES INTO ALT_TITLES TABLE
INSERT INTO alt_titles (object_id,alt_title,sort_order)
VALUES (3,'subtitle: The Lake',1);


--INSERT SAMPLE VALUES INTO OBJECT_CULTURES TABLE
INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (1,null,null,'Chinese',1);

INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (7,null,'Zulu People',null,1);

INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (8,null,'Zulu People',null,1);

INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (9,null,'Zulu People',null,1);

INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (12,'possibly','Pueblo People',null,1);

INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (17,null,null,'American',1);

INSERT INTO object_cultures (object_id,attribution,culture,nationality,sort_order)
VALUES (18,null,null,'Italian',1);


--INSERT SAMPLE VALUES INTO OBJECT_PLACES TABLE
INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (1,'China',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (2,'United States',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (3,'Japan',null,null,'Edo',1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (4,'Japan',null,null,'Edo',1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (7,'South Africa',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (8,'South Africa',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (9,'South Africa',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (11,'Flanders',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (12,'United States','New Mexico',null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (13,'United States',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (14,'England',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (16,'United States',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (17,'United States',null,null,null,1);

INSERT INTO object_places (object_id,country,state,district,city,sort_order)
VALUES (18,'Italy',null,null,null,1);


--INSERT SAMPLE VALUES INTO OBJECT_DIMENSIONS TABLE
INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (1,'Dimensions',17.2500,null,null,null,'in.',null,null,'Metric: 43.8 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (2,'Unframed Dimensions',27.2500,16.2500,null,null,'in.',null,null,'Metric: 69.2 x 41.2 cm. (canvas)',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (2,'Framed Dimensions',34.7500,24.7500,4.0000,null,'in.',null,null,'Metric: 88.2 x 62.8 x 10.1 cm. (framed)',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (3,'Image Dimensions',9.0000,13.9375,null,null,'in.',null,null,'Metric: 22.7 x 35.4 cm. (image)',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (4,'Sheet Dimensions',22.3000,null,null,null,'cm.',null,null,'sheet',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (5,'Dimensions A',372.0000,36.0000,11.0000,null,'in.',null,null,'A) Metric: 944.8 x 91.4 x 27.9',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (5,'Dimensions B',98.0000,357.0000,10.2500,null,'in.',null,null,'B) Metric: 248.9 x 906.7 x 26.03',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (5,'Dimensions C',104.0000,271.0000,12.0000,null,'in.',null,null,'C) Metric: 264.1 x 688.3 x 30.4',3);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (5,'Dimensions D',228.0000,100.0000,11.0000,null,'in.',null,null,'D) Metric: 579.1 x 254 x 27.9',4);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (5,'Dimensions E',480.0000,77.0000,15.0000,null,'in.',null,null,'E) Metric: 1219.2 x 195.5 x 38.1 (assembled)',5);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (6,'Dimensions',87.0000,null,null,null,'in.',null,null,null,1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (7,'Dimensions',0.5000,null,null,2.0000,'in.',null,null,'Metric: 1.3 x 5.1 (diam.) cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (8,'Dimensions',0.5000,null,null,2.0000,'in.',null,null,'Metric: 1.3 x 5.1',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (9,'Dimensions',0.5000,null,null,2.0000,'in.',null,null,'Metric: 1.3 x 5.1 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (10,'Image Dimensions',7.1250,9.1250,null,null,'in.',null,null,'Metric: 18.1 x 23.2 (image)',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (10,'Sheet Dimensions',12.0000,18.0000,null,null,'in.',null,null,'Metric: 30.5 x 45.7 (sheet)',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (11,'Dimensions',23.7500,19.2500,null,null,'in.',null,null,'Metric: 60.3 x 48.9 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (11,'Framed Dimensions',30.1250,26.0000,null,null,'in.',null,null,'Metric: 76.5 x 66 cm. (framed)',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (12,'Dimensions',12.5000,2.5000,0.3800,null,'in.',null,null,'Metric: 31.8 x 6.4 x 0.9 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (13,'Dimensions',144.0000,144.0000,72.0000,null,'in.',null,null,'Metric: 365.8 x 365.8 x 182.9 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (13,'Weight',null,null,null,null,null,9200.0000,'lbs.','total weight',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (13,'Weight',null,null,null,null,null,4100.0000,'lbs.','weight of LV',3);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (13,'Weight',null,null,null,null,null,2300.0000,'lbs.','weight of O',4);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (13,'Weight',null,null,null,null,null,2800.0000,'lbs.','weight of E',5);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (14,'Dimensions',39.1880,33.2500,null,null,'in.',null,null,'Metric: 99.5 x 84.5 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (14,'Framed Dimensions',45.1250,39,2.3750,null,'in.',null,null,'Metric: 114.6 x 99.1 x 6 cm. (framed)',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (16,'Framed Dimensions',86.5000,59.0000,2.5000,null,'in.',null,null,'Metric: 219.8 x 149.9 x 6.4 (framed)',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (16,'Unframed Dimensions',82.2500,54.2500,null,null,'in.',null,null,'Metric: 209.6 x 137.7 (canvas)',2);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (17,'Dimensions',84.0000,86.0000,null,null,'in.',null,null,'Metric: 213.4 x 218.4 cm.',1);

INSERT INTO object_dimensions (object_id,type,height,width,depth,diameter,length_unit,weight,weight_unit,notes,sort_order)
VALUES (18,'Dimensions',null,null,9.2500,null,'in.',null,null,null,1);


--INSERT SAMPLE VALUES INTO OBJECT_GUIDS TABLE
INSERT INTO object_guids (object_id,preferred,type,guid,sort_order)
VALUES (16,FALSE,'Wikidata QID','Q27897460',1);


--INSERT SAMPLE VALUES INTO RELATED_OBJECTS TABLE
INSERT INTO related_objects (object_id_1,object_id_2,relationship,sort_order)
VALUES (8,7,'blanket record',1);

INSERT INTO related_objects (object_id_1,object_id_2,relationship,sort_order)
VALUES (8,9,'pair (one of)',2);

INSERT INTO related_objects (object_id_1,object_id_2,relationship,sort_order)
VALUES (9,7,'blanket record',1);

INSERT INTO related_objects (object_id_1,object_id_2,relationship,sort_order)
VALUES (9,8,'pair (one of)',2);


--INSERT SAMPLE VALUES INTO PARTY_OTHER_NAMES TABLE
INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (1,'Fiscus, Charles Joseph',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (2,'Leslie Anne Anderson',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (3,'Hiroshige',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (3,'Hiroshige Utagawa',2);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (3,'Ando Hiroshige',3);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (3,'Utagawa Hir^oshige',4);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (3,'Andō Hiroshige  安藤広重',5);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (4,'Hoeido',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Hokusai, Katsushika',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Hokusai',2);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Shunro',3);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Sori',4);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Kako',5);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Tatsumasa',6);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Gakyojin',7);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Taito',8);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Tichi',9);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Manji',10);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Tokitaro',11);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (6,'Katsushika Hokusai',12);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (11,'Francois Delarue',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (13,'Robert Clark',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (13,'Bob Indiana',2);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (13,'Bob Clark',3);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (14,'Lippincott Foundry',1);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (14,'Lippincott''s, LLC',2);

INSERT INTO party_other_names (party_id,other_name,sort_order)
VALUES (21,'Wayman Elbridge Adams',1);


--INSERT SAMPLE VALUES INTO PARTY_IDENTITIES TABLE
INSERT INTO party_identities (party_id,[identity],sort_order)
VALUES (1,'Caucasian',1);

INSERT INTO party_identities (party_id,[identity],sort_order)
VALUES (1,'White',2);

INSERT INTO party_identities (party_id,[identity],sort_order)
VALUES (21,'Caucasian',1);

INSERT INTO party_identities (party_id,[identity],sort_order)
VALUES (21,'White',2);


--INSERT SAMPLE VALUES INTO PARTY_ROLES TABLE
INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (1,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (2,2,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (3,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (4,3,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (5,3,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,4,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,5,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,6,4);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,7,5);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,8,6);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (6,9,7);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (7,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (7,5,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (7,4,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (7,10,4);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,6,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,11,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,12,4);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,3,5);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,13,6);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,14,7);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,15,8);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,16,9);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,17,10);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (8,18,11);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (9,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (10,15,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (11,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (11,15,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (11,3,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (12,5,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (13,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (13,5,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (13,10,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (14,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (14,19,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,5,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,8,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,20,4);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,21,5);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,22,6);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,23,7);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,24,8);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,6,9);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (15,25,10);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (16,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (16,5,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (16,22,3);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (16,26,4);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (16,13,5);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (16,27,6);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (17,28,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (19,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (19,29,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (20,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (20,29,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (21,1,1);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (21,5,2);

INSERT INTO party_roles (party_id,role_id,sort_order)
VALUES (22,30,1);


--INSERT SAMPLE VALUES INTO PARTY_GUIDS TABLE
INSERT INTO party_guids (party_id,preferred,type,guid,sort_order)
VALUES (3,FALSE,'ULAN ID','500019641',1);

INSERT INTO party_guids (party_id,preferred,type,guid,sort_order)
VALUES (3,FALSE,'Wikidata QID','Q200798',2);

INSERT INTO party_guids (party_id,preferred,type,guid,sort_order)
VALUES (7,FALSE,'ULAN ID','500013596',1);

INSERT INTO party_guids (party_id,preferred,type,guid,sort_order)
VALUES (12,FALSE,'ULAN ID','500000759',1);

INSERT INTO party_guids (party_id,preferred,type,guid,sort_order)
VALUES (12,FALSE,'Wikidata QID','Q130531',2);

INSERT INTO party_guids (party_id,preferred,type,guid,sort_order)
VALUES (13,FALSE,'ULAN ID','500015478',1);


--INSERT SAMPLE VALUES INTO COLLABORATORS TABLE
INSERT INTO collaborators (party_id,collaborator_id,sort_order)
VALUES (18,19,1);

INSERT INTO collaborators (party_id,collaborator_id,sort_order)
VALUES (18,20,2);


--INSERT SAMPLE VALUES INTO OBJECT_FLAGS TABLE
INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (2,1,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (2,2,2);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (2,3,3);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (2,4,4);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (2,5,5);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (5,6,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (7,6,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (7,7,2);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (8,7,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (8,8,2);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (9,7,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (9,8,2);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (11,9,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (12,1,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (14,10,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (18,10,1);

INSERT INTO object_flags (object_id,flag_id,sort_order)
VALUES (18,11,2);


--INSERT SAMPLE VALUES INTO OBJECT_CREATORS TABLE
INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (2,1,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (3,3,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (4,6,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (5,7,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (6,8,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (10,9,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (11,12,'After','Artist, after',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (13,13,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (13,14,null,'Foundry',2);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (14,15,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (14,16,'After','Artist, after',2);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (15,18,null,'Artist',1);

INSERT INTO object_creators (object_id,party_id,attribution,role,sort_order)
VALUES (16,21,null,'Artist',1);


--INSERT SAMPLE VALUES INTO OBJECT_PRINTERS TABLE
INSERT INTO object_printers (object_id,party_id,sort_order)
VALUES (10,10,1);


--INSERT SAMPLE VALUES INTO OBJECT_PUBLISHERS TABLE
INSERT INTO object_publishers (object_id,party_id,sort_order)
VALUES (3,4,1);

INSERT INTO object_publishers (object_id,party_id,sort_order)
VALUES (3,5,2);

INSERT INTO object_publishers (object_id,party_id,sort_order)
VALUES (10,11,1);


--INSERT SAMPLE VALUES INTO OBJECT_TYPES TABLE
INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (1,1,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (2,2,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (2,3,2);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (3,4,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (3,5,2);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (5,6,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (7,7,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (8,7,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (9,7,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (10,4,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (10,8,2);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (11,3,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (12,9,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (12,10,2);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (12,11,3);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (13,12,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (14,3,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (15,13,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (16,2,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (16,3,2);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (17,14,1);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (17,15,2);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (17,16,3);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (17,17,4);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (17,18,5);

INSERT INTO object_types (object_id,type_id,sort_order)
VALUES (18,19,1);


--INSERT SAMPLE VALUES INTO OBJECT_MEDIUMS TABLE
INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (1,1,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (2,2,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (3,3,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (3,4,2);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (4,3,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (5,5,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (7,6,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (8,7,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (8,6,2);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (9,8,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (10,3,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (11,2,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (14,2,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (15,9,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (15,5,2);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (16,2,1);

INSERT INTO object_mediums (object_id,medium_id,sort_order)
VALUES (18,10,1);


--INSERT SAMPLE VALUES INTO OBJECT_SUPPORTS TABLE
INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (1,1,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (2,2,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (3,3,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (4,3,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (5,4,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (6,5,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (7,6,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (8,6,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (9,6,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (10,3,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (11,7,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (12,8,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (12,9,2);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (13,10,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (14,2,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (15,10,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (15,11,2);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (15,12,3);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (16,2,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (17,13,1);

INSERT INTO object_supports (object_id,support_id,sort_order)
VALUES (18,14,1);


--INSERT SAMPLE VALUES INTO OBJECT_MARKS TABLE
INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (2,1,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (3,1,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (3,2,2);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (3,3,3);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (4,3,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (5,4,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (10,1,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (10,3,2);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (11,5,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (13,6,1);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (13,1,2);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (13,7,3);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (13,8,4);

INSERT INTO object_marks (object_id,mark_type_id,sort_order)
VALUES (16,1,1);


--INSERT SAMPLE VALUES INTO OBJECT_RIGHTS_URIS TABLE
INSERT INTO object_rights_uris (object_id,rights_uri_id,sort_order)
VALUES (2,1,1);

INSERT INTO object_rights_uris (object_id,rights_uri_id,sort_order)
VALUES (11,1,1);

INSERT INTO object_rights_uris (object_id,rights_uri_id,sort_order)
VALUES (13,2,1);


--INSERT SAMPLE VALUES INTO NARRATIVE_OBJECTS TABLE
INSERT INTO narrative_objects (narrative_id,object_id,sort_order)
VALUES (1,2,1);

INSERT INTO narrative_objects (narrative_id,object_id,sort_order)
VALUES (2,13,1);

INSERT INTO narrative_objects (narrative_id,object_id,sort_order)
VALUES (3,7,1);


--INSERT SAMPLE VALUES INTO NARRATIVE_PARTIES TABLE
INSERT INTO narrative_parties (narrative_id,party_id,sort_order)
VALUES (1,1,1);

INSERT INTO narrative_parties (narrative_id,party_id,sort_order)
VALUES (2,13,1);

INSERT INTO narrative_parties (narrative_id,party_id,sort_order)
VALUES (2,14,2);


--INSERT SAMPLE VALUES INTO NARRATIVE_AUTHORS TABLE
INSERT INTO narrative_authors (narrative_id,party_id,sort_order)
VALUES (1,2,1);

