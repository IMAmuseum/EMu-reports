USE CollectionsTest
GO

--INSERT SAMPLE VALUES INTO LOCATIONS TABLE
INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (738,FALSE,'Ac1.lv1','IMA','storage','Ac1','lv1',null,null,null,null,'2022-07-01');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (2351,FALSE,'P.63w','IMA','storage','P','63w',null,null,null,null,'2021-08-15');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (10315,FALSE,'F25.cg5.r6.lv4','IMA','Print Storage','F25','cg5','r6','lv4',null,null,'2022-05-02');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (10326,FALSE,'F25.cg5.r7.lv13','IMA','Print Storage','F25','cg5','r7','lv13',null,null,'2022-03-02');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (326,TRUE,'G','IMA','Grounds','G',null,null,null,null,null,'2021-03-03');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (87,FALSE,'On Loan','On Loan',null,null,null,null,null,null,null,'2018-07-10');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (14123,FALSE,'W303.c1.wall','IMA','Eiteljorg Suite of African and Oceanic Art','W303','c1','wall',null,null,null,'2019-08-01');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (9972,FALSE,'F25.cg6.r4.lv12','IMA','Print Storage','F25','cg6','r4','lv12',null,null,'2015-08-02');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (3674,FALSE,'P.10w','IMA','storage','P','10w',null,null,null,null,'2016-02-02');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (35,FALSE,'Ec43.lv4','IMA','storage','Ec43','lv4',null,null,null,null,'2020-09-10');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (14825,TRUE,'W202','IMA','Pulliam Family Great Hall','W202',null,null,null,null,null,'2021-03-09');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (3965,FALSE,'P.92w','IMA','storage','P','92w',null,null,null,null,'2021-10-10');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (452,TRUE,'ANP','IMA','The Virginia B. Fairbanks Art & Nature Park',null,null,null,null,null,null,'2022-03-20');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (1050,FALSE,'P.18w','IMA','storage','P','18w',null,null,null,null,'2021-09-10');

INSERT INTO [locations] (emu_irn,publish,code,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,date_modified)
VALUES (7246,FALSE,'Tc58.lv2','IMA','storage','Tc58','lv2',null,null,null,null,'2021-10-11');


--INSERT SAMPLE VALUES INTO DEPARTMENTS TABLE
INSERT INTO [departments] (department)
VALUES ('Asian Art (Chinese and other Asian)');

INSERT INTO [departments] (department)
VALUES ('American Painting and Sculpture 1800-1945');

INSERT INTO [departments] (department)
VALUES ('Asian Art (Japanese and Korean)');

INSERT INTO [departments] (department)
VALUES ('Contemporary');

INSERT INTO [departments] (department)
VALUES ('African Art');

INSERT INTO [departments] (department)
VALUES ('Prints, Drawings, and Photographs');

INSERT INTO [departments] (department)
VALUES ('European Painting and Sculpture Before 1800');

INSERT INTO [departments] (department)
VALUES ('Native Arts of the Americas');

INSERT INTO [departments] (department)
VALUES ('Lilly House');

INSERT INTO [departments] (department)
VALUES ('Textile and Fashion Arts');


--INSERT SAMPLE VALUES INTO FLAGS TABLE
INSERT INTO [flags] (flag)
VALUES ('Luce Digitization Project');

INSERT INTO [flags] (flag)
VALUES ('Approved for Off-site Use - Westerley Only');

INSERT INTO [flags] (flag)
VALUES ('Diversity Cataloging Project');

INSERT INTO [flags] (flag)
VALUES ('Male');

INSERT INTO [flags] (flag)
VALUES ('White');

INSERT INTO [flags] (flag)
VALUES ('Blanket Record');

INSERT INTO [flags] (flag)
VALUES ('Geographic Location: Africa');

INSERT INTO [flags] (flag)
VALUES ('Part Record');

INSERT INTO [flags] (flag)
VALUES ('WWII-Era Provenance Research');

INSERT INTO [flags] (flag)
VALUES ('Deaccessioned');


--INSERT SAMPLE VALUES INTO TYPES TABLE
INSERT INTO [types] (type)
VALUES ('vases');

INSERT INTO [types] (type)
VALUES ('paintings');

INSERT INTO [types] (type)
VALUES ('oil paintings');

INSERT INTO [types] (type)
VALUES ('prints');

INSERT INTO [types] (type)
VALUES ('color woodcuts');

INSERT INTO [types] (type)
VALUES ('outdoor sculpture');

INSERT INTO [types] (type)
VALUES ('earplugs');

INSERT INTO [types] (type)
VALUES ('lithographs');

INSERT INTO [types] (type)
VALUES ('costume accessories (worn)');

INSERT INTO [types] (type)
VALUES ('jewelry');

INSERT INTO [types] (type)
VALUES ('necklaces');

INSERT INTO [types] (type)
VALUES ('sculptures');

INSERT INTO [types] (type)
VALUES ('installations');

INSERT INTO [types] (type)
VALUES ('furnishings');

INSERT INTO [types] (type)
VALUES ('textiles');

INSERT INTO [types] (type)
VALUES ('bed coverings');

INSERT INTO [types] (type)
VALUES ('quilts');

INSERT INTO [types] (type)
VALUES ('appliqué quilts');


--INSERT SAMPLE VALUES INTO MEDIUMS TABLE
INSERT INTO [mediums] (medium)
VALUES ('glaze');

INSERT INTO [mediums] (medium)
VALUES ('oil paint');

INSERT INTO [mediums] (medium)
VALUES ('ink');

INSERT INTO [mediums] (medium)
VALUES ('colored ink');

INSERT INTO [mediums] (medium)
VALUES ('paint');

INSERT INTO [mediums] (medium)
VALUES ('metal');

INSERT INTO [mediums] (medium)
VALUES ('synthetic resin');

INSERT INTO [mediums] (medium)
VALUES ('pigment');

INSERT INTO [mediums] (medium)
VALUES ('plastic');


--INSERT SAMPLE VALUES INTO SUPPORTS TABLE
INSERT INTO [supports] (support)
VALUES ('stoneware');

INSERT INTO [supports] (support)
VALUES ('canvas');

INSERT INTO [supports] (support)
VALUES ('paper');

INSERT INTO [supports] (support)
VALUES ('aluminum');

INSERT INTO [supports] (support)
VALUES ('plaster');

INSERT INTO [supports] (support)
VALUES ('wood');

INSERT INTO [supports] (support)
VALUES ('panels');

INSERT INTO [supports] (support)
VALUES ('shell');

INSERT INTO [supports] (support)
VALUES ('beads');

INSERT INTO [supports] (support)
VALUES ('steel');

INSERT INTO [supports] (support)
VALUES ('paint');

INSERT INTO [supports] (support)
VALUES ('plastic');

INSERT INTO [supports] (support)
VALUES ('cotton {fabric}');


--INSERT SAMPLE VALUES INTO MARK_TYPES TABLE
INSERT INTO [mark_types] (mark_type)
VALUES ('Signature');

INSERT INTO [mark_types] (mark_type)
VALUES ('Seal');

INSERT INTO [mark_types] (mark_type)
VALUES ('Inscriptions');

INSERT INTO [mark_types] (mark_type)
VALUES ('Incised');

INSERT INTO [mark_types] (mark_type)
VALUES ('No Mark Found');

INSERT INTO [mark_types] (mark_type)
VALUES ('Stamp');

INSERT INTO [mark_types] (mark_type)
VALUES ('Date');

INSERT INTO [mark_types] (mark_type)
VALUES ('Foundry Mark');


--INSERT SAMPLE VALUES INTO RIGHTS_URIS TABLE
INSERT INTO [rights_uris] (type, uri)
VALUES ('RightsStatements.org URI','http://rightsstatements.org/vocab/NoC-US/1.0/');

INSERT INTO [rights_uris] (type, uri)
VALUES ('RightsStatements.org URI','http://rightsstatements.org/vocab/InC/1.0/');


--INSERT SAMPLE VALUES INTO ROLES TABLE
INSERT INTO [roles] (role)
VALUES ('artist');

INSERT INTO [roles] (role)
VALUES ('IMA Staff');

INSERT INTO [roles] (role)
VALUES ('publisher');

INSERT INTO [roles] (role)
VALUES ('printmaker');

INSERT INTO [roles] (role)
VALUES ('painter');

INSERT INTO [roles] (role)
VALUES ('designer');

INSERT INTO [roles] (role)
VALUES ('calligrapher');

INSERT INTO [roles] (role)
VALUES ('draftsman');

INSERT INTO [roles] (role)
VALUES ('marine painter');

INSERT INTO [roles] (role)
VALUES ('sculptor');

INSERT INTO [roles] (role)
VALUES ('Origin');

INSERT INTO [roles] (role)
VALUES ('manufacturer');

INSERT INTO [roles] (role)
VALUES ('author');

INSERT INTO [roles] (role)
VALUES ('Culture or People');

INSERT INTO [roles] (role)
VALUES ('printer');

INSERT INTO [roles] (role)
VALUES ('photographer');

INSERT INTO [roles] (role)
VALUES ('Maker');

INSERT INTO [roles] (role)
VALUES ('Creator');

INSERT INTO [roles] (role)
VALUES ('foundry');

INSERT INTO [roles] (role)
VALUES ('decorative artist');

INSERT INTO [roles] (role)
VALUES ('ceiling painter');

INSERT INTO [roles] (role)
VALUES ('portraitist');

INSERT INTO [roles] (role)
VALUES ('court artist');

INSERT INTO [roles] (role)
VALUES ('illustrator');

INSERT INTO [roles] (role)
VALUES ('teacher');

INSERT INTO [roles] (role)
VALUES ('writer');

INSERT INTO [roles] (role)
VALUES ('collector');

INSERT INTO [roles] (role)
VALUES ('Owner');

INSERT INTO [roles] (role)
VALUES ('collaborator');


--INSERT SAMPLE VALUES INTO OBJECTS TABLE
INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (1032,null,TRUE,'Accessioned','60.63','TR5488/1',1960,10,10,'long-neck vase with cup mouth',null,null,'100-220',100,220,null,null,null,null,'Eastern Han dynasty','Containers','green glazed stoneware',null,null,null,'17-1/4 in.','Gift of Mr. and Mrs. Eli Lilly','Public Domain','(Jan W.A. Kleijkamp); purchased by Eli Lilly, Indianapolis, Indiana, May 1950 ( list noting 15 November 1950 $950.); given to the John Herron Art Institute, now the Indianapolis Museum of Art, in 1960.',1,FALSE,1,null,null,null,null,null,null,null,null,'2021-10-25');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (1065,null,TRUE,'Accessioned','14.55',null,1914,2,19,'The Bachelor Boudoir (Corner of the Studio)',null,null,'about 1883',1882,1883,null,null,null,null,null,'Visual Works: Paintings','oil on canvas','painting',null,'Signed, l.r.: C FISCUS','27-1/4 x 16-1/4 in. (canvas)\n34-3/4 x 24-3/4 x 4 in. (framed)','Gift of the Artist''s mother, Mrs. E.J. Fiscus','Public Domain',null,2,FALSE,2,null,null,null,null,null,null,null,null,'2022-05-16');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (21137,80085,TRUE,'Accessioned','06.137',null,1906,5,1,'Hakone','The Fifty-three Stations of the T^okaid^o',null,'1833-1834',1833,1834,null,null,null,'Edo',null,'Visual Works: Prints','ink on paper, color woodblock print','woodcutting',null,'Signed by artist: Hiroshige ga\nPublisher''s mark: Hōeidō (Takenouchi Magohachi)\nSeal with subtitle: Kosuizu\nInscribed: title and series title','9 x 13-15/16 in. (image, sheet trimmed to image on all sides)','John Herron Fund','Public Domain','Purchased by the John Herron Art Institute, Indianapolis, Indiana, now the Indianapolis Museum of Art at Newfields, in 1906.',3,FALSE,3,null,null,null,null,null,null,null,null,'2022-06-07');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (52481,null,TRUE,'Accessioned','44.91','TR4585/9ab',1944,6,20,'Spring snow on Sumida River 隅田川　春雪',null,'Amusement of the Eastern Capital  狂歌東遊  (Ehon Azuma asobi)','about 1802',1797,1807,null,null,null,'Edo',null,'Visual Works: Prints','color woodblock print',null,null,'Kyoka poem','8-3/4 x 12 in.','Gift of Charles C. Kryter','No Known Rights Holder',null,3,FALSE,4,null,null,null,null,null,null,null,null,'2022-02-22');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (82696,null,TRUE,'Accessioned','2013.443A-E.4','TR11707A-E.4',2013,12,12,'Five Brushstrokes',null,null,'fabricated 2012',2012,2012,'1983-1984',1983,1984,null,null,'Visual Works: Sculpture','painted aluminum',null,null,'rf Lichtenstein 83-84 AP <copyright> The Roy Lichtenstein Foundation, 2012','Element A) 372 x 36 x 11 in.\nElement B) 98 x 357 x 10-1/4 in.\nElement C) 104 x 271 x 12 in.\nElement D) 228 x 100 x 11 in.\nElement E.1-.4) 480 x 77 x 15 in. (assembled)','Robert L. and Marjorie J. Mann Fund, Partial Gift of the Roy Lichtenstein Foundation','© Roy Lichtenstein Foundation','(Roy Lichtenstein Foundation, New York, New York); purchased by the Indianapolis Museum of Art in 2013.',4,TRUE,5,null,null,null,null,null,null,null,null,'2021-02-11');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (47035,null,TRUE,'Accessioned','08.19',null,1908,null,null,'Statue of Augustus Caesar',null,null,'before 1908',null,1908,null,null,null,null,null,'Visual Works: Sculpture','plaster cast','casting','Roman',null,'87 in.','Gift of Mary E. Nicholson','Public Domain',null,2,FALSE,6,null,null,null,null,null,null,null,null,'2022-04-26');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (64017,null,TRUE,'Accessioned','2007.4A-B','TR10523/3A-B',2007,4,10,'pair of earplugs (for man or woman)',null,null,'mid-20th century',1920,1960,null,null,null,null,null,'Costume Accessories','wood, synthetic resin, metal tacks',null,null,null,'1/2 x 2 (diam.) in.','General Memorial Art Fund','No Known Rights Holder','Probably with (Rhoda Levinsohn, Cleveland, Ohio) by 1983;[1] (Axis Gallery, West Orange, New Jersey) in 2000; purchased by the Indianapolis Museum of Art, Indianapolis, Indiana in 2007.\n\n[1] Information provided by Gary van Wyk, Axis Gallery, New York.',5,TRUE,7,null,null,null,null,null,null,null,null,'2020-04-10');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (64018,null,FALSE,'Accessioned','2007.4A','TR10523/3A',2007,4,10,'earplug',null,null,'1950-1970',1950,1970,null,null,null,null,null,'Costume Accessories','wood, synthetic resin, metal'	null,null,null,null,'1/2 x 2 (diam.) in.','General Memorial Art Fund','No Known Rights Holder','Probably with (Rhoda Levinsohn, Cleveland) by 1983;[1] (Axis Gallery, West Orange, New Jersey) in 2000; acquired by IMA in 2007.\n\n[1] Information provided by Gary van Wyk, Axis Gallery, New York.',5,TRUE,7,7,null,null,null,null,null,null,null,'2020-04-02');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (64019,null,FALSE,'Accessioned','2007.4B','TR10523/3B',2007,4,10,'earplug (for man or woman)',null,null,'1920-1960',1920,1960,null,null,null,null,null,'Costume Accessories','wood, synthetic resin, metal tacks',null,null,null,'1/2 x 2 (diam.) in.','General Memorial Art Fund','No Known Rights Holder','Probably with (Rhoda Levinsohn, Cleveland) by 1983;[1] (Axis Gallery, West Orange, New Jersey) in 2000; acquired by IMA in 2007.\n\n[1] Information provided by Gary van Wyk, Axis Gallery, New York.',5,TRUE,7,7,null,null,null,null,null,null,null,'2020-04-02');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (21444,null,TRUE,'Accessioned','27.25','TR941/2',1927,10,18,'Souvenir de la Scheideges',null,null,'19th century',1801,1900,null,null,null,null,null,'Visual Works: Prints','lithograph on chine collé','lithography',null,'Inscribed in plate above image: Oeuvres de A. Calame\nInscribed in plate below image: Imp. Jacomme & Cie R. de Lancry, 18 Paris, du Cabinet de M. Mussard Cons. d'' Etat''. F. Delarue Editeur, rue J. J. Rousseau, 18, Paris\nSigned in plate: 1094 B. A. Calame - 7ime Livraison - 1853 - No. 7','7-1/8 x 9-1/8 in. (image)\n12 x 18 in. (sheet)','Anonymous Gift','Public Domain',null,6,FALSE,8,null,null,null,null,null,null,null,null,'2020-12-14');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (33886,null,TRUE,'Accessioned','2020.1','C10007',2020,8,27,'Temptation of St. Anthony',null,null,'1575-1600',1575,1600,null,null,null,null,null,'Visual Works: Paintings','oil on panel',null,null,'Not Inscribed','23-3/4 x 19-1/4 in.\n30-1/8 x 26 in. (framed)','The Clowes Collection','Public Domain','Gustav von Gerhardt, Budapest, Hungary, until 1911.{1} Mrs. Moric Palugyay and Mrs. Moric Tomcsanyi. Budapest, by 1927.{2} (Ivan N. Podgoursky, New York, New York); George Henry Alexander Clowes, Indianapolis, Indiana, in 1944; The Clowes Fund, Indianapolis, from 1958–2020, and on long-term loan to the Indianapolis Museum of Art, since 1971; given to the Indianapolis Museum of Art at Newfields, in 2020.\n\n{1} Sammlung des. Königl[ichen]. Ungar[ischen]. Hofrats Gustav von Gerhardt, Budapest : Zweiter Teil : Gemälde Alter Meister, sale catalogue, Rudolph Lepke’s Kunst-Auctions-Haus, Berlin, 10 November 1911, no. 61, plate 30.\n{2} Catalogue de l''Exposition Belge d''art Ancien et Moderne, Budapest: Imp. de la Société Anonyme Athenaeum, 1927, 34, no. 191.',7,FALSE,9,null,null,null,null,null,null,null,null,'2022-03-30');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (16410,null,TRUE,'Accessioned','14.231','1965.14',1914,6,1,'necklace',null,null,'before 1910',null,1910,null,null,null,null,null,'Costume Accessories','shell beads',null,null,null,'12-1/2 x 2-1/2 x 3/8 in.','Gift of Hugh McKennan Landon','No Known Rights Holder','Collected by Arthur Henn, Hugh McKennan Landon Expedition to Ecuador and Peru under the direction of Dr. Carl H. Eigenmann of Indiana University; Hugh McKennan Landon [1868-1947] Indianapolis, Indiana; given to the John Herron Art Institute, now the Indianapolis Museum of Art at Newfields, Indianapolis, Indiana in 1914.',8,FALSE,10,null,null,null,null,null,null,null,null,'2020-06-19');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (20419,null,TRUE,'Accessioned','75.174','TR8614',1975,10,2,'Love',null,null,'1970',1970,1970,null,null,null,null,null,'Visual Works: Sculpture','Cor-ten steel','welding',null,'Stamped, lower proper right edge of the \E\"" along the full length: 1 [gapped]  [copyright symbol] R INDIANA  [in stencilled font] 1970  [HF symbol for Herbert Feuerlicht, Technical Supervisor of Triad Designs] [three stacked lines of smaller text] WORK EXECUTED BY  |  Lippincott  |  NORTH HAVEN CONN""','144 x 144 x 72 in.','Gift of the Friends of the Indianapolis Museum of Art in memory of Henry F. DeBoest.  Restoration was made possible by Patricia J. and James E. LaCrosse.','© Morgan Art Foundation/Artists Rights Society (ARS), New York','(Robert Indiana, New York, New York); Purchased by the Indianapolis Museum of Art, Indinianapolis, Indiana, in 1975.',4,TRUE,11,null,null,null,null,null,null,null,null,'2022-04-26');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (14617,null,FALSE,'Deaccessioned','67.10.48',null,1967,null,null,'Matthew Prior',null,null,'late 17th - early 18th century',1675,1825,null,null,null,null,null,'Visual Works: Paintings','oil on canvas',null,null,null,'39-3/16 x 33-1/4 in. (canvas)\n45-1/8 x 39 x 2-3/8 in. (framed)','Gift of the Children of J.K. Lilly, Jr.','No Known Rights Holder','J.K. Lilly, Jr, Indianapolis, Indiana; by descent to his children; given to the John Herron Art Institute, now the Indianapolis Museum of Art at Newfields, in 1967.',9,FALSE,12,null,'Deaccession',2021,5,3,'Lilly House deaccession',17,'Lilly House reclassification','2022-02-24');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (68903,null,TRUE,'Accessioned','2010.217','TR11136',2010,9,16,'Free Basket',null,null,'2010',2010,2010,null,null,null,null,null,'Visual Works: Sculpture',null,null,null,null,'various dimensions','Commissioned by the Indianapolis Museum of Art, purchased with funds provided by the Griffith Foundation Gift, in memory of Melvin Simon','© Los Carpinteros. Courtesy Sean Kelly Gallery, New York.','Commissioned by the Indianapolis Museum of Art.',4,TRUE,13,null,null,null,null,null,null,null,null,'2020-11-13');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (29270,41696,TRUE,'Accessioned','26.189','TR835/1',1926,12,21,'The Art Jury',null,null,'1921',1921,1921,null,null,null,null,null,'Visual Works: Paintings','oil on canvas','painting',null,'Signed, l.l.: Wayman Adams','82-1/4 x 54-1/4 in. (canvas)\n86-1/2 x 59 x 2-1/2 in. (framed)','Gift to the Art Association through popular subscription','© Wayman Adams','Purchased from the artist by a group of local patrons for the museum.',2,FALSE,14,null,null,null,null,null,null,null,null,'2022-06-08');

INSERT INTO [objects] (emu_irn,dagwood_id,publish,status,accession_number,previous_id,date_accessioned_year,date_accessioned_month,date_accessioned_day,title,series_title,portfolio_title,date_created,date_created_earliest,date_created_latest,date_designed,date_designed_earliest,date_designed_latest,period,dynasty,record_type,medium_support,technique,style,mark_description,dimensions,credit_line,rights_acknowledgement,provenance,department,on_view,location_id,parent_irn,deaccession_method,deaccession_date_year,deaccession_date_month,deaccession_date_day,deaccession_notes,recipient,transfer_notes,date_modified)
VALUES (19677,null,TRUE,'Deaccessioned','S4344.81.1','TR4344/1',1981,null,null,'quilt (Star of Bethlehem)',null,null,'about 1930',1927,1933,null,null,null,null,null,'Furnishings','cotton, appliquéd and quilted','quilting',null,null,'84 x 86 in.','Gift of Edgar B. Howard','No Known Rights Holder','Edgar B. Howard, New York; given to the Indianapolis Museum of Art, Indianapolis, Indiana, 17 December 1981.',10,FALSE,15,null,'Deaccession',2021,11,16,'Niloo Paydar, Curator of Textile and Fashion Arts, recommends this piece for deaccession because it is not museum quality.',null,null,'2022-02-03');
