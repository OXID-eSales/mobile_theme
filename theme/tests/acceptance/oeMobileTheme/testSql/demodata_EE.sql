SET @@session.sql_mode = '';

# Activate en and de languages
UPDATE `oxconfig` SET `OXVARVALUE` = 0x4dba832f744c5786a371d9df33778f956ef30fb1e8bb85d97b3b5de43e6bad688dfc6f63a8af34b33290cdd6fc889c8e77cfee0e8a17ade6b94130fda30d062d03e35d8d1bda1c2dc4dd5281fcb1c9538cf114050a3e7118e16151bfe94f5a0706d2eb3d9ff8b4a24f88963788f5dd1c33c573a1ebe3f5b06c072c6a373aaecb11755d907b50a79bbac613054871af686a7d3dbe0b6e1a3e292a109e2f5bc31bcd26ebbe42dac8c9cac3fa53c6fae3c8c7c3c113a4f1a8823d13c78c27dc WHERE `OXVARNAME` = 'aLanguageParams';

# Set en as default language
UPDATE `oxconfig` SET `OXVARVALUE` = 0x07 WHERE `OXVARNAME` = 'sDefaultLang';

# Activate all coutries
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXISOALPHA2` in ('DE', 'AT', 'CH', 'GB', 'US');

# Setting shop version to 5.0.0 so that connector could be downloaded
UPDATE `oxshops` SET `OXVERSION` = '5.0.0';

#set country, username, password for default user
UPDATE oxuser
  SET
      oxcountryid = 'a7c40f631fc920687.20179984',
      oxusername = 'admin@myoxideshop.com',
      oxpassword = '6cb4a34e1b66d3445108cd91b67f98b9',
      oxpasssalt = '6631386565336161636139613634663766383538633566623662613036636539'
  WHERE oxid='oxdefaultadmin';

#Articles demodata
REPLACE INTO `oxarticles` (`OXID`,  `OXMAPID`, `OXSHOPID`, `OXPARENTID`, `OXACTIVE`, `OXARTNUM`, `OXTITLE`,                     `OXSHORTDESC`,                   `OXPRICE`, `OXPRICEA`, `OXPRICEB`, `OXPRICEC`, `OXTPRICE`, `OXUNITNAME`, `OXUNITQUANTITY`, `OXVAT`, `OXWEIGHT`, `OXSTOCK`, `OXSTOCKFLAG`, `OXSTOCKTEXT`,   `OXNOSTOCKTEXT`,     `OXDELIVERY`, `OXINSERT`,   `OXTIMESTAMP`,        `OXLENGTH`, `OXWIDTH`, `OXHEIGHT`, `OXSEARCHKEYS`, `OXISSEARCH`, `OXVARNAME`,             `OXVARSTOCK`, `OXVARCOUNT`, `OXVARSELECT`, `OXVARMINPRICE`, `OXVARMAXPRICE`, `OXVARNAME_1`,             `OXVARSELECT_1`,   `OXTITLE_1`,                 `OXSHORTDESC_1`,                        `OXSEARCHKEYS_1`, `OXSUBCLASS`, `OXSTOCKTEXT_1`,       `OXNOSTOCKTEXT_1`,        `OXSORT`, `OXVENDORID`,      `OXMANUFACTURERID`, `OXVPE`, `OXMINDELTIME`, `OXMAXDELTIME`, `OXDELTIMEUNIT`) VALUES
                         ('1000',   101,       1,           '',            1,         '1000',     '[DE 4] Test product 0 šÄßüл', 'Test product 0 short desc [DE]', 50,        35,         45,         55,         0,         'kg',          2,                NULL,    2,          15,        1,            'In stock [DE]', 'Out of stock [DE]', '0000-00-00', '2008-02-04', '2008-02-04 17:07:29', 1,          2,         2,         'search1000',    1,           '',                       0,            0,           '',             50,                0,                '',                        '',                'Test product 0 [EN] šÄßüл', 'Test product 0 short desc [EN] šÄßüл', 'šÄßüл1000',      'oxarticle',  'In stock [EN] šÄßüл', 'Out of stock [EN] šÄßüл', 0,       'testdistributor', 'testmanufacturer',  1,       1,              1,             'DAY'),
                         ('1001',   102,       1,           '',            1,         '1001',     '[DE 1] Test product 1 šÄßüл', 'Test product 1 short desc [DE]', 100,       0,          0,          0,          150,       '',            0,                10,      0,          0,         1,            '',              '',                  '2008-01-01', '2008-02-04', '2008-02-04 17:35:43', 0,          0,         0,         'search1001',    1,          '',                        0,            0,           '',             100,               0,                '',                        '',                'Test product 1 [EN] šÄßüл', 'Test product 1 short desc [EN] šÄßüл', 'šÄßüл1001',      'oxarticle',  '',                    '',                        0,       'testdistributor', 'testmanufacturer',  1,       0,              1,             'WEEK'),
                         ('1002',   103,       1,           '',            1,         '1002',     '[DE 2] Test product 2 šÄßüл', 'Test product 2 short desc [DE]', 55,        0,          0,          0,          0,         '',            0,                NULL,    0,          0,         1,            'In stock [DE]', 'Out of stock [DE]', '0000-00-00', '2008-02-04', '2008-02-04 17:27:47', 0,          0,         0,         'search1002',    1,          'variants [DE]',           10,           2,           '',             55,                67,               'variants [EN] šÄßüл',     '',                'Test product 2 [EN] šÄßüл', 'Test product 2 short desc [EN] šÄßüл', 'šÄßüл1002',      'oxarticle',  'In stock [EN] šÄßüл', 'Out of stock [EN] šÄßüл', 0,       'testdistributor', 'testmanufacturer',  1,       1,              1,             'MONTH'),
                         ('1003',   104,       1,           '',            1,         '1003',     '[DE 3] Test product 3 šÄßüл', 'Test product 3 short desc [DE]', 75,        70,         85,         0,          0,         '',            0,                NULL,    0,          5,         1,            '',              '',                  '0000-00-00', '2008-02-04', '2008-02-04 17:49:00', 0,          0,         0,         'search1003',    1,          '',                        0,            0,           '',             75,                0,                '',                        '',                'Test product 3 [EN] šÄßüл', 'Test product 3 short desc [EN] šÄßüл', 'šÄßüл1003',      'oxarticle',  '',                    '',                        0,       '',                'testmanufacturer',  1,       4,              9,             'DAY'),
                         ('1002-1', 105,       1,           '1002',        1,         '1002-1',   '',                            '',                               55,        45,         0,          0,          0,         '',            0,                NULL,    0,          5,         1,            'In stock [DE]', 'Out of stock [DE]', '0000-00-00', '2008-02-04', '2008-02-04 17:36:53', 0,          0,         0,         '',              1,          '',                        0,            0,           'var1 [DE]',    0,                 0,                '',                        'var1 [EN] šÄßüл', '',                          '',                                     '',               'oxarticle',  'In stock [EN] šÄßüл', 'Out of stock [EN] šÄßüл', 1,       '',                '',                  1,       0,              0,             ''),
                         ('1002-2', 106,       1,           '1002',        1,         '1002-2',   '',                            '',                               67,        47,         0,          0,          0,         '',            0,                NULL,    0,          5,         1,            'In stock [DE]', 'Out of stock [DE]', '0000-00-00', '2008-02-04', '2008-02-04 17:38:11', 0,          0,         0,         '',              1,          '',                        0,            0,           'var2 [DE]',    0,                 0,                '',                        'var2 [EN] šÄßüл', '',                          '',                                     '',               'oxarticle',  'In stock [EN] šÄßüл', 'Out of stock [EN] šÄßüл', 2,       '',                '',                  1,       0,              0,             ''),
                         ('10010',  107,       1,           '',            0,         '10010',    '[last] DE product šÄßüл',     '1 DE description',               1.5,       0,          0,          0,          0,         '',            0,                NULL,    0,          0,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          '',                        0,            0,           '',             1.5,               0,                '',                        '',                '1 EN product šÄßüл',        '[last] EN description šÄßüл',          '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             ''),
                         ('10011',  108,       1,           '',            0,         '10011',    '10 DE product šÄßüл',         '11 DE description',              1.8,       0,          0,          0,          0,         '',            0,                NULL,    2,          0,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          '',                        0,            0,           '',             1.8,               0,                '',                        '',                '11 EN product šÄßüл',       '10 EN description šÄßüл',              '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             ''),
                         ('10012',  109,       1,           '',            0,         '10012',    '11 DE product šÄßüл',         '12 DE description',              2.0,       0,          0,          0,          0,         '',            0,                NULL,    3,          0,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          '',                        0,            0,           '',             2.0,               0,                '',                        '',                '12 EN product šÄßüл',       '11 EN description šÄßüл',              '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             ''),
                         ('10013',  110,       1,           '',            0,         '10013',    '12 DE product šÄßüл',         '13 DE description',              1.7,       0,          0,          0,          0,         '',            0,                NULL,    20,         0,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          '',                        0,            0,           '',             1.7,               0,                '',                        '',                '13 EN product šÄßüл',       '12 EN description šÄßüл',              '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             ''),
                         ('10014',  111,       1,           '',            0,         '10014',    '13 DE product šÄßüл',         '14 DE description',              1.6,       0,          0,          0,          0,         '',            0,                NULL,    0,          0,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          'size[DE] | color | type', 0,            12,          '',             15,               25,               'size[EN] | color | type', '',                '14 EN product šÄßüл',       '13 EN description šÄßüл',              '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             ''),
                         ('10015',  112,       1,           '',            0,         '10015',    '14 DE product šÄßüл',         '15 DE description',              2.1,       0,          0,          0,          0,         '',            0,                NULL,    0,          1,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          '',                        0,            0,           '',             2.1,               0,                '',                        '',                '15 EN product šÄßüл',       '14 EN description šÄßüл',              '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             ''),
                         ('10016',  113,       1,           '',            0,         '10016',    '15 DE product šÄßüл',         '10 DE description',              1.9,       0,          0,          0,          0,         '',            0,                NULL,    0,          0,         1,            '',              '',                  '0000-00-00', '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',              1,          '',                        0,            0,           '',             1.9,               0,                '',                        '',                '10 EN product šÄßüл',       '15 EN description šÄßüл',              '',               'oxarticle',  '',                    '',                        0,       '',                '',                  1,       0,              0,             '');
REPLACE INTO `oxfiles` (`OXID`, `OXARTID`, `OXFILENAME`, `OXPURCHASEDONLY`) VALUES ('1000l', '1002-1', 'testFile3', '1');

#demodata for multidimensional variants
REPLACE INTO `oxarticles` (`OXID`,   `OXMAPID`, `OXSHOPID`, `OXPARENTID`, `OXACTIVE`, `OXARTNUM`, `OXPRICE`, `OXVAT`, `OXSTOCK`, `OXSTOCKFLAG`, `OXINSERT`,   `OXTIMESTAMP`,         `OXVARSELECT`,               `OXVARSELECT_1`,        `OXSUBCLASS`, `OXSORT`) VALUES
                         ('1001432', 114,       1,           '10014',       1,         '10014-3-2', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'M | black | material [DE]', 'L | black | material', 'oxarticle',   3002),
                         ('1001424', 115,       1,           '10014',       1,         '10014-2-4', 15,        NULL,    0,         1,            '2008-04-03', '2008-04-03 12:50:20', 'M | red [DE]',              'M | red',              'oxarticle',   2004),
                         ('1001422', 116,       1,           '10014',       1,         '10014-2-2', 15,        NULL,    0,         3,            '2008-04-03', '2008-04-03 12:50:20', 'M | black | material [DE]', 'M | black | material', 'oxarticle',   2002),
                         ('1001421', 117,       1,           '10014',       1,         '10014-2-1', 25,        NULL,    0,         2,            '2008-04-03', '2008-04-03 12:50:20', 'M | black | lether [DE]',   'M | black | lether',   'oxarticle',   2001),
                         ('1001411', 118,       1,           '10014',       1,         '10014-1-1', 25,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'S | black | lether [DE]',   'S | black | lether',   'oxarticle',   1001),
                         ('1001413', 119,       1,           '10014',       1,         '10014-1-3', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'S | white [DE]',            'S | white',            'oxarticle',   1003),
                         ('1001412', 120,       1,           '10014',       1,         '10014-1-2', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'S | black | material [DE]', 'S | black | material', 'oxarticle',   1002),
                         ('1001434', 121,       1,           '10014',       0,         '10014-3-4', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'L | red [DE]',              'L | red',              'oxarticle',   3004),
                         ('1001423', 122,       1,           '10014',       1,         '10014-2-3', 15,        NULL,    0,         1,            '2008-04-03', '2008-04-03 12:50:20', 'M | white [DE]',            'M | white',            'oxarticle',   2003),
                         ('1001414', 123,       1,           '10014',       1,         '10014-1-4', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'S | red [DE]',              'S | red',              'oxarticle',   1004),
                         ('1001431', 124,       1,           '10014',       1,         '10014-3-1', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'L | black | lether [DE]',   'L | black | lether',   'oxarticle',   3001),
                         ('1001433', 125,       1,           '10014',       1,         '10014-3-3', 15,        NULL,    3,         1,            '2008-04-03', '2008-04-03 12:50:20', 'L | white [DE]',            'L | white',            'oxarticle',   3003);

#persparam
REPLACE INTO `oxarticles` (`OXID`, `OXMAPID`, `OXSHOPID`, `OXPARENTID`, `OXACTIVE`, `OXARTNUM`, `OXTITLE`,     `OXSHORTDESC`,     `OXPRICE`, `OXVAT`, `OXSTOCKFLAG`, `OXINSERT`,   `OXTIMESTAMP`,         `OXISSEARCH`, `OXVARMINPRICE`, `OXTITLE_1`,        `OXSHORTDESC_1`,    `OXSUBCLASS`, `OXSORT`, `OXVPE`, `OXISCONFIGURABLE`) VALUES
                         ('20016', 126,       1,           '',            1,         '20016',    'perspara DE', 'perspara DE_desc', 1.9,       NULL,    1,            '2008-04-03', '2008-04-03 12:50:20',  1,            1.9,            'perspara EN_prod', 'perspara EN_desc', 'oxarticle',   0,        1,       1);

REPLACE INTO `oxarticles2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111),
  (1, 112), (1, 113), (1, 114), (1, 115), (1, 116), (1, 117), (1, 118), (1, 119), (1, 120), (1, 121), (1, 122),
  (1, 123), (1, 124), (1, 125), (1, 126);

REPLACE INTO `oxartextends` (`OXID`,  `OXLONGDESC`, `OXLONGDESC_1`, `OXTAGS`, `OXTAGS_1`) VALUES
                           ('20016', '',           '',             '',       '');

#Articles long desc
REPLACE INTO `oxartextends` (`OXID`,   `OXLONGDESC`,                                  `OXLONGDESC_1`,                                      `OXTAGS`,              `OXTAGS_1`) VALUES
                           ('1000',   '<p>Test product 0 long description [DE]</p>', '<p>Test product 0 long description [EN] šÄßüл</p>', 'tag_,0___,[DE],tag_', '[EN],0___,tag_,šÄßüл,tag_'),
                           ('1001',   '<p>Test product 1 long description [DE]</p>', '<p>Test product 1 long description [EN] šÄßüл</p>', 'tag_,1___,[DE],tag_', '[EN],1___,tag_,šÄßüл,tag_'),
                           ('1002',   '<p>Test product 2 long description [DE]</p>', '<p>Test product 2 long description [EN] šÄßüл</p>', 'tag_,2___,[DE],tag_', '[EN],2___,tag_,šÄßüл,tag_'),
                           ('1003',   '<p>Test product 3 long description [DE]</p>', '<p>Test product 3 long description [EN] šÄßüл</p>', 'tag_,3___,[DE],tag_', '[EN],3___,tag_,šÄßüл,tag_'),
                           ('1002-1', '',                                            '',                                                  '',                    ''),
                           ('1002-2', '',                                            '',                                                  '',                    ''),
                           ('10010',  '',                                            '',                                                  '',                    'tag_'),
                           ('10011',  '',                                            '',                                                  '',                    'tag_'),
                           ('10012',  '',                                            '',                                                  '',                    'tag_'),
                           ('10013',  '',                                            '',                                                  '',                    'tag_'),
                           ('10014',  '',                                            '',                                                  '',                    'tag_'),
                           ('10015',  '',                                            '',                                                  '',                    'tag_'),
                           ('10016',  '',                                            '',                                                  '',                    'tag_');

#Promotions demodata
UPDATE `oxactions2article` SET `OXSORT` = `OXSORT`+2  WHERE `OXACTIONID` = 'oxnewest';
DELETE FROM `oxactions2article` WHERE `OXACTIONID` = 'oxnewest' AND `OXSORT` > 3;
UPDATE `oxactions2article` SET `OXSORT` = `OXSORT`+1  WHERE `OXACTIONID` = 'oxbargain';
UPDATE `oxactions2article` SET `OXSORT` = `OXSORT`+1  WHERE `OXACTIONID` = 'oxtop5';
REPLACE INTO `oxactions2article` (`OXID`,                      `OXSHOPID`, `OXACTIONID`,   `OXARTID`, `OXSORT`) VALUES
                                ('bde47a81f7d268b77.84950388', 1,         'oxnewest',     '1000',     0),
                                ('bde47658oiu268b77.84950388', 1,         'oxnewest',     '1001',     1),
                                ('bde47a821c5d58153.42799552', 1,         'oxbargain',    '1001',     0),
                                ('bde47a821f9beb324.59595619', 1,         'oxtop5',       '1000',     0),
                                ('bde47a821b788c1b2.26422928', 1,         'oxcatoffer',   '1003',     5),
                                ('bde47a821df5eed47.47567551', 1,         'oxstart',      '1002',     0),
                                ('bde47a821ed25ec13.47207212', 1,         'oxtopstart',   '1001',     0);

#Promotions demodata for subshop
REPLACE INTO `oxactions2article` (`OXID`,                      `OXSHOPID`, `OXACTIONID`,   `OXARTID`,                         `OXSORT`) VALUES
                                ('bde47aw1f7d268b77.84950388', 2,         'oxnewest',     '1000',                             0),
                                ('bde47aw1wed158b77.84950388', 2,         'oxnewest',     '1001',                             1),
                                ('bde47aw21c5d58153.42799552', 2,         'oxbargain',    '1001',                             0),
                                ('38c44b65d3aqqqaa3.76581394', 2,         'oxbargain',    'dc5ffdf380e15674b56dd562a7cb6aec', 1),
                                ('bde47aw21b788c1b2.26422928', 2,         'oxcatoffer',   '1003',                             0),
                                ('bde47aw21df5eed47.47567551', 2,         'oxstart',      '1002',                             0),
                                ('bde47aw21ed25ec13.47207212', 2,         'oxtopstart',   '1001',                             0),
                                ('bde47aw21f9beb324.59595619', 2,         'oxtop5',       '1000',                             0);

#Attributes demodata
REPLACE INTO `oxattribute` (`OXID`,          `OXMAPID`, `OXSHOPID`, `OXTITLE`,                     `OXTITLE_1`,                  `OXPOS`) VALUES
                          ('testattribute1', 101,       1,           'Test attribute 1 [DE] šÄßüл', 'Test attribute 1 [EN] šÄßüл', 1),
                          ('testattribute2', 102,       1,           'Test attribute 2 [DE] šÄßüл', 'Test attribute 2 [EN] šÄßüл', 3),
                          ('testattribute3', 103,       1,           'Test attribute 3 [DE] šÄßüл', 'Test attribute 3 [EN] šÄßüл', 2),
                          ('testattr1',      104,       1,           '1 [DE] Attribute šÄßüл',      '[last] [EN] Attribute šÄßüл', 5),
                          ('testattr2',      105,       1,           '2 [DE] Attribute šÄßüл',      '3 [EN] Attribute šÄßüл',      4),
                          ('testattr3',      106,       1,           '3 [DE] Attribute šÄßüл',      '4 [EN] Attribute šÄßüл',      6),
                          ('testattr4',      107,       1,           '4 [DE] Attribute šÄßüл',      '5 [EN] Attribute šÄßüл',      7),
                          ('testattr5',      108,       1,           '5 [DE] Attribute šÄßüл',      '6 [EN] Attribute šÄßüл',      9),
                          ('testattr6',      109,       1,           '6 [DE] Attribute šÄßüл',      '7 [EN] Attribute šÄßüл',      11),
                          ('testattr7',      110,       1,           '7 [DE] Attribute šÄßüл',      '2 [EN] Attribute šÄßüл',      10),
                          ('testattr8',      111,       1,           '[last] [DE] Attribute šÄßüл', '1 [EN] Attribute šÄßüл',      8);

REPLACE INTO `oxattribute2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111);

UPDATE `oxattribute` SET `OXDISPLAYINBASKET` = 0;

#Selectlist demodata
REPLACE INTO `oxselectlist` (`OXID`,         `OXMAPID`, `OXSHOPID`, `OXTITLE`,                        `OXIDENT`,              `OXVALDESC`,                                                                      `OXTITLE_1`,                      `OXVALDESC_1`) VALUES
                           ('testsellist',   101,       1,           'test selection list [DE] šÄßüл', 'test sellist šÄßüл',   'selvar1 [DE]!P!1__@@selvar2 [DE]__@@selvar3 [DE]!P!-2__@@selvar4 [DE]!P!2%__@@', 'test selection list [EN] šÄßüл', 'selvar1 [EN] šÄßüл!P!1__@@selvar2 [EN] šÄßüл__@@selvar3 [EN] šÄßüл!P!-2__@@selvar4 [EN] šÄßüл!P!2%__@@'),
                           ('testsellist1',  102,       1,           '1 [DE] sellist šÄßüл',           '1 sellist šÄßüл',      '',                                                                               '[last] [EN] sellist šÄßüл',      ''),
                           ('testsellist2',  103,       1,           '2 [DE] sellist šÄßüл',           '6 sellist šÄßüл',      '',                                                                               '7 [EN] sellist šÄßüл',           ''),
                           ('testsellist3',  104,       1,           '3 [DE] sellist šÄßüл',           '2 sellist šÄßüл',      '',                                                                               '6 [EN] sellist šÄßüл',           ''),
                           ('testsellist4',  105,       1,           '4 [DE] sellist šÄßüл',           '9 sellist šÄßüл',      '',                                                                               '2 [EN] sellist šÄßüл',           ''),
                           ('testsellist5',  106,       1,           '5 [DE] sellist šÄßüл',           '4 sellist šÄßüл',      '',                                                                               '3 [EN] sellist šÄßüл',           ''),
                           ('testsellist6',  107,       1,           '6 [DE] sellist šÄßüл',           '8 sellist šÄßüл',      '',                                                                               '5 [EN] sellist šÄßüл',           ''),
                           ('testsellist7',  108,       1,           '7 [DE] sellist šÄßüл',           '3 sellist šÄßüл',      '',                                                                               '4 [EN] sellist šÄßüл',           ''),
                           ('testsellist8',  109,       1,           '8 [DE] sellist šÄßüл',           '[last] sellist šÄßüл', '',                                                                               '8 [EN] sellist šÄßüл',           ''),
                           ('testsellist9',  110,       1,           '9 [DE] sellist šÄßüл',           '5 sellist šÄßüл',      '',                                                                               '1 [EN] sellist šÄßüл',           ''),
                           ('testsellist10', 111,       1,           '[last] [DE] sellist šÄßüл',      '7 sellist šÄßüл',      '',                                                                               '9 [EN] sellist šÄßüл',           '');

REPLACE INTO `oxselectlist2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111);

#Vendor demodata
REPLACE INTO `oxvendor` (`OXID`,            `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXTITLE`,                     `OXSHORTDESC`,                       `OXTITLE_1`,                   `OXSHORTDESC_1`,                          `OXSHOWSUFFIX`) VALUES
                       ('testdistributor',  101,       1,            1,         'Distributor [DE] šÄßüл',      'Distributor description [DE]',      'Distributor [EN] šÄßüл',      'Distributor description [EN] šÄßüл',      1),
                       ('testdistributor1', 102,       1,            0,         '1 DE distributor šÄßüл',      '[last] DE distributor description', '[last] EN distributor šÄßüл', '1 EN distributor description šÄßüл',      1),
                       ('testdistributor8', 103,       1,            0,         '[last] DE distributor šÄßüл', '1 DE distributor description',      '1 EN distributor šÄßüл',      '[last] EN distributor description šÄßüл', 1),
                       ('testdistributor2', 104,       1,            0,         '2 DE distributor šÄßüл',      '4 DE distributor description',      '4 EN distributor šÄßüл',      '2 EN distributor description šÄßüл',      1),
                       ('testdistributor3', 105,       1,            0,         '3 DE distributor šÄßüл',      '5 DE distributor description',      '5 EN distributor šÄßüл',      '3 EN distributor description šÄßüл',      1),
                       ('testdistributor4', 106,       1,            0,         '4 DE distributor šÄßüл',      '2 DE distributor description',      '2 EN distributor šÄßüл',      '4 EN distributor description šÄßüл',      1),
                       ('testdistributor5', 107,       1,            0,         '5 DE distributor šÄßüл',      '7 DE distributor description',      '7 EN distributor šÄßüл',      '5 DE distributor description šÄßüл',      1),
                       ('testdistributor6', 108,       1,            0,         '6 DE distributor šÄßüл',      '6 DE distributor description',      '6 EN distributor šÄßüл',      '6 EN distributor description šÄßüл',      1),
                       ('testdistributor7', 109,       1,            0,         '7 DE distributor šÄßüл',      '3 DE distributor description',      '3 EN distributor šÄßüл',      '7 EN distributor description šÄßüл',      1);

REPLACE INTO `oxvendor2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109);

#Manufacturer demodata
REPLACE INTO `oxmanufacturers` (`OXID`,             `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXTITLE`,                      `OXSHORTDESC`,                        `OXTITLE_1`,                    `OXSHORTDESC_1`,                           `OXSHOWSUFFIX`) VALUES
                              ('testmanufacturer',  101,       1,            1,         'Manufacturer [DE] šÄßüл',      'Manufacturer description [DE]',      'Manufacturer [EN] šÄßüл',      'Manufacturer description [EN] šÄßüл',      1),
                              ('testmanufacturer1', 102,       1,            0,         '1 DE manufacturer šÄßüл',      '[last] DE manufacturer description', '[last] EN manufacturer šÄßüл', '1 EN manufacturer description šÄßüл',      1),
                              ('testmanufacturer8', 103,       1,            0,         '[last] DE manufacturer šÄßüл', '1 DE manufacturer description',      '1 EN manufacturer šÄßüл',      '[last] EN manufacturer description šÄßüл', 1),
                              ('testmanufacturer2', 104,       1,            0,         '2 DE manufacturer šÄßüл',      '4 DE manufacturer description',      '4 EN manufacturer šÄßüл',      '2 EN manufacturer description šÄßüл',      1),
                              ('testmanufacturer3', 105,       1,            0,         '3 DE manufacturer šÄßüл',      '5 DE manufacturer description',      '5 EN manufacturer šÄßüл',      '3 EN manufacturer description šÄßüл',      1),
                              ('testmanufacturer4', 106,       1,            0,         '4 DE manufacturer šÄßüл',      '2 DE manufacturer description',      '2 EN manufacturer šÄßüл',      '4 EN manufacturer description šÄßüл',      1),
                              ('testmanufacturer5', 107,       1,            0,         '5 DE manufacturer šÄßüл',      '7 DE manufacturer description',      '7 EN manufacturer šÄßüл',      '5 DE manufacturer description šÄßüл',      1),
                              ('testmanufacturer6', 108,       1,            0,         '6 DE manufacturer šÄßüл',      '6 DE manufacturer description',      '6 EN manufacturer šÄßüл',      '6 EN manufacturer description šÄßüл',      1),
                              ('testmanufacturer7', 109,       1,            0,         '7 DE manufacturer šÄßüл',      '3 DE manufacturer description',      '3 EN manufacturer šÄßüл',      '7 EN manufacturer description šÄßüл',      1);

REPLACE INTO `oxmanufacturers2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109);

#Categories demodata
REPLACE INTO `oxcategories` (`OXID`,         `OXMAPID`, `OXPARENTID`,   `OXLEFT`, `OXRIGHT`, `OXROOTID`,     `OXSORT`, `OXACTIVE`, `OXHIDDEN`, `OXSHOPID`, `OXTITLE`,                    `OXDESC`,                    `OXLONGDESC`,                `OXDEFSORT`, `OXDEFSORTMODE`, `OXPRICEFROM`, `OXPRICETO`, `OXACTIVE_1`, `OXTITLE_1`,                  `OXDESC_1`,                        `OXLONGDESC_1`,                   `OXVAT`, `OXSKIPDISCOUNTS`, `OXSHOWSUFFIX`) VALUES
                           ('testcategory0', 101,        'oxrootid',      1,        4,        'testcategory0', 1,        1,          0,          1,           'Test category 0 [DE] šÄßüл', 'Test category 0 desc [DE]', 'Category 0 long desc [DE]', 'oxartnum',   0,               0,             0,           1,           'Test category 0 [EN] šÄßüл', 'Test category 0 desc [EN] šÄßüл', 'Category 0 long desc [EN] šÄßüл', 5,       0,                 1),
                           ('testcategory1', 102,        'testcategory0', 2,        3,        'testcategory0', 2,        1,          0,          1,           'Test category 1 [DE] šÄßüл', 'Test category 1 desc [DE]', 'Category 1 long desc [DE]', 'oxartnum',   1,               0,             0,           1,           'Test category 1 [EN] šÄßüл', 'Test category 1 desc [EN] šÄßüл', 'Category 1 long desc [EN] šÄßüл', NULL,    0,                 1),
                           ('testcat1',      103,        'oxrootid',      1,        2,        'testcat1',      2,        0,          0,          1,           '1 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '[last] [EN] category šÄßüл', '',                                '',                                NULL,    0,                 1),
                           ('testcat2',      104,        'oxrootid',      1,        2,        'testcat2',      5,        0,          0,          1,           '2 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '3 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testcat3',      105,        'oxrootid',      1,        2,        'testcat3',      1,        0,          0,          1,           '3 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '4 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testcat4',      106,        'oxrootid',      1,        2,        'testcat4',      7,        0,          0,          1,           '4 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '5 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testcat5',      107,        'oxrootid',      1,        2,        'testcat5',      1,        0,          0,          1,           '5 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '6 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testcat7',      108,        'oxrootid',      1,        2,        'testcat7',      6,        0,          0,          1,           '7 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '8 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testcat8',      109,        'oxrootid',      1,        2,        'testcat8',      6,        0,          0,          1,           '8 [DE] category šÄßüл',      '',                          '',                          '',           0,               0,             0,           0,           '2 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testcat9',      110,        'oxrootid',      1,        2,        'testcat9',      3,        0,          0,          1,           '[last] [DE] category šÄßüл', '',                          '',                          '',           0,               0,             0,           0,           '1 [EN] category šÄßüл',      '',                                '',                                NULL,    0,                 1),
                           ('testpricecat',  111,        'oxrootid',      1,        2,        'testpricecat',  99999,    1,          0,          1,           'price šÄßüл [DE]',           'price category [DE]',       '',                          '',           0,               49,            60,          1,           'price [EN] šÄßüл',           'price category [EN] šÄßüл',       '',                                NULL,    0,                 1);


REPLACE INTO `oxcategories2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111);

#Payment demodata
REPLACE INTO `oxpayments` (`OXID`, `OXACTIVE`, `OXDESC`, `OXADDSUM`, `OXADDSUMTYPE`, `OXFROMBONI`, `OXFROMAMOUNT`, `OXTOAMOUNT`, `OXVALDESC`, `OXCHECKED`, `OXDESC_1`, `OXVALDESC_1`, `OXDESC_2`, `OXVALDESC_2`, `OXDESC_3`, `OXVALDESC_3`, `OXLONGDESC`, `OXLONGDESC_1`, `OXLONGDESC_2`, `OXLONGDESC_3`, `OXSORT`) VALUES
 ('testpayment',   1, 'Test payment method [DE] šÄßüл', 0.7, 'abs', 0, 55, 99999, 'payment field [DE]__@@', 0, 'Test payment method [EN] šÄßüл', 'payment field [EN] šÄßüл__@@', '', '', '', '', 'Short payment description [DE]', 'Short payment description [EN] šÄßüл', '', '', 0),
 ('testpayment1',  0, '1 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '[last] EN test payment šÄßüл',   '',                           '', '', '', '', '',                               '',                                   '', '', 1),
 ('testpayment2',  0, '2 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '3 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 2),
 ('testpayment3',  0, '3 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '2 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 3),
 ('testpayment4',  0, '[last] DE test payment šÄßüл',   0,   'abs', 0, 0,  0,     '',                       0, '1 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 4),
 ('testpayment5',  0, '4 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '4 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 5),
 ('testpayment6',  0, '5 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '5 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 6),
 ('testpayment7',  0, '6 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '6 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 7),
 ('testpayment8',  0, '7 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '7 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 8),
 ('testpayment9',  0, '8 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '8 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 9),
 ('testpayment10', 0, '9 DE test payment šÄßüл',        0,   'abs', 0, 0,  0,     '',                       0, '9 EN test payment šÄßüл',        '',                           '', '', '', '', '',                               '',                                   '', '', 10);

#Delivery set demodata
REPLACE INTO `oxdeliveryset` (`OXID`,      `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXTITLE`,                      `OXTITLE_1`) VALUES
                            ('testdelset', 101,       1,            1,         'Test S&H set [DE] šÄßüл',      'Test S&H set [EN] šÄßüл'),
                            ('testshset1', 102,       1,            0,         '1 DE test S&H set šÄßüл',      '[last] EN test S&H set šÄßüл'),
                            ('testshset2', 103,       1,            0,         '2 DE test S&H set šÄßüл',      '3 EN test S&H set šÄßüл'),
                            ('testshset3', 104,       1,            0,         '3 DE test S&H set šÄßüл',      '4 EN test S&H set šÄßüл'),
                            ('testshset4', 105,       1,            0,         '4 DE test S&H set šÄßüл',      '2 EN test S&H set šÄßüл'),
                            ('testshset5', 106,       1,            0,         '5 DE test S&H set šÄßüл',      '6 EN test S&H set šÄßüл'),
                            ('testshset7', 107,       1,            0,         '[last] DE test S&H set šÄßüл', '1 EN test S&H set šÄßüл'),
                            ('testshset8', 108,       1,            0,         '7 DE test S&H set šÄßüл',      '7 EN test S&H set šÄßüл');

REPLACE INTO `oxdeliveryset2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108);


#Delivery demodata
#UPDATE `oxdelivery` SET `OXTITLE_1` = `OXTITLE`;
REPLACE INTO `oxdelivery` (`OXID`,      `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXTITLE`,                           `OXTITLE_1`,                         `OXADDSUMTYPE`, `OXADDSUM`, `OXDELTYPE`, `OXPARAM`, `OXPARAMEND`, `OXFIXED`, `OXSORT`, `OXFINALIZE`) VALUES
                         ('testdel',    101,       1,            1,         'Test delivery category [DE] šÄßüл', 'Test delivery category [EN] šÄßüл', 'abs',           1.5,       'a',          1,         99999,        0,         9998,     1),
                         ('testdelart', 102,       1,            1,         'Test delivery product [DE] šÄßüл',  'Test delivery product [EN] šÄßüл',  '%',             1,         'a',          1,         99999,        0,         9999,     1),
                         ('testsh1',    103,       1,            0,         '1 DE S&H šÄßüл',                    '[last] EN S&H šÄßüл',               'abs',           10,        'w',          15,        999,          2,         4,        0),
                         ('testsh2',    104,       1,            0,         '2 DE S&H šÄßüл',                    '3 EN S&H šÄßüл',                    'abs',           1,         'w',          1,         4.99999999,   2,         1,        0),
                         ('testsh3',    105,       1,            0,         '3 DE S&H šÄßüл',                    '4 EN S&H šÄßüл',                    'abs',           0,         'a',          0,         0,            0,         999999,   0),
                         ('testsh5',    106,       1,            0,         '[last] DE S&H šÄßüл',               '1 EN S&H šÄßüл',                    'abs',           5,         'w',          5,         14.9999999,   2,         2,        0);

REPLACE INTO `oxdelivery2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106);

#Guestbook demodata
REPLACE INTO `oxgbentries` (`OXID`,          `OXSHOPID`, `OXUSERID`,       `OXCONTENT`,                       `OXCREATE`,           `OXACTIVE`, `OXVIEWED`) VALUES
                          ('testguestbook1', 1,         'testuser',       'Demo guestbook entry [EN] šÄßüл', '2008-01-01 00:00:01', 1,          1),
                          ('testguestbook2', 1,         'oxdefaultadmin', 'Demo guestbook entry [DE] šÄßüл', '2008-01-02 00:00:01', 1,          1);

#Links demodata
REPLACE INTO `oxlinks` (`OXID`,     `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXURL`,                    `OXURLDESC`,                           `OXURLDESC_1`,                               `OXINSERT`) VALUES
                      ('testlink',  101,       1,            1,         'http://www.google.com',    '<p>Demo link description [DE]</p>',   '<p>Demo link description [EN] šÄßüл</p>',   '2008-01-01 00:00:01'),
                      ('testlink1', 102,       1,            0,         'http://www.1google.com',   '<p>1 [DE] link description</p>',      '<p>4 [EN] link description šÄßüл</p>',      '2008-01-01 00:00:04'),
                      ('testlink2', 103,       1,            0,         'http://www.2google.com',   '<p>2 [DE] link description</p>',      '<p>5 [EN] link description šÄßüл</p>',      '2008-02-01 00:00:01'),
                      ('testlink3', 104,       1,            0,         'http://www.3google.com',   '<p>3 [DE] link description</p>',      '<p>6 [EN] link description šÄßüл</p>',      '2004-01-01 00:00:02'),
                      ('testlink4', 105,       1,            0,         'http://www.4google.com',   '<p>4 [DE] link description</p>',      '<p>7 [EN] link description šÄßüл</p>',      '2007-12-10 00:00:01'),
                      ('testlink5', 106,       1,            0,         'http://www.5google.com',   '<p>5 [DE] link description</p>',      '<p>8 [EN] link description šÄßüл</p>',      '2008-01-01 00:00:02'),
                      ('testlink6', 107,       1,            0,         'http://www.6google.com',   '<p>6 [DE] link description</p>',      '<p>[last] [EN] link description šÄßüл</p>', '2008-02-13 00:00:01'),
                      ('testlink7', 108,       1,            0,         'http://www.zzzgoogle.com', '<p>7 [DE] link description</p>',      '<p>1 [EN] link description šÄßüл</p>',      '2008-01-17 00:00:01'),
                      ('testlink8', 109,       1,            0,         'http://www.zzgoogle.com',  '<p>8 [DE] link description</p>',      '<p>2 [EN] link description šÄßüл</p>',      '2008-03-01 00:00:01'),
                      ('testlink9', 110,       1,            0,         'http://www.zgoogle.com',   '<p>[last] [DE] link description</p>', '<p>3 [EN] link description šÄßüл</p>',      '2008-01-01 00:00:03');

REPLACE INTO `oxlinks2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110);


#Coupons demodata
REPLACE INTO `oxvoucherseries` (`OXID`,        `OXMAPID`, `OXSHOPID`, `OXSERIENR`,           `OXSERIEDESCRIPTION`,      `OXDISCOUNT`, `OXDISCOUNTTYPE`, `OXBEGINDATE`,         `OXENDDATE`,          `OXALLOWSAMESERIES`, `OXALLOWOTHERSERIES`, `OXALLOWUSEANOTHER`, `OXMINIMUMVALUE`, `OXCALCULATEONCE`) VALUES
                              ('testcoupon1',  101,       1,           'Test coupon 1 šÄßüл', 'Test coupon 1 desc šÄßüл', 10.00,       'absolute',       '2008-01-01 00:00:00', '2020-01-01 00:00:00', 1,                   1,                    1,                   75.00,            1),
                              ('testcoupon2',  102,       1,           'Test coupon 2 šÄßüл', 'Test coupon 2 desc šÄßüл', 5.00,        'percent',        '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   75.00,            1),
                              ('testvoucher1', 103,       1,           '1 Coupon šÄßüл',      '1 Description šÄßüл',      5.00,        'absolute',       '2007-01-01 00:00:00', '2020-12-31 00:00:00', 1,                   1,                    1,                   10.00,            1),
                              ('testvoucher2', 104,       1,           '2 Coupon šÄßüл',      '2 Coupon šÄßüл',           3.00,        'absolute',       '2009-01-01 00:00:00', '2020-10-10 00:00:00', 1,                   1,                    1,                   25.00,            0),
                              ('testvoucher3', 105,       1,           '3 Coupon šÄßüл',      '3 Coupon šÄßüл',           15.00,       'percent',        '2007-12-31 00:00:00', '2019-12-31 00:00:00', 0,                   0,                    0,                   100.00,           1),
                              ('testvoucher4', 106,       1,           '4 Coupon šÄßüл',      '4 Coupon šÄßüл',           50.00,       'percent',        '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   45.00,            1),
                              ('testvoucher5', 107,       1,           '5 Coupon šÄßüл',      '5 Coupon šÄßüл',           30.00,       'percent',        '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   300.00,           1),
                              ('testvoucher6', 108,       1,           '6 Coupon šÄßüл',      '6 Coupon šÄßüл',           20.00,       'percent',        '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   300.00,           1),
                              ('testvoucher7', 109,       1,           '7 Coupon šÄßüл',      '7 Coupon šÄßüл',           25.00,       'absolute',       '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   300.00,           1),
                              ('testvoucher8', 110,       1,           '8 Coupon šÄßüл',      '8 Coupon šÄßüл',           54.00,       'absolute',       '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   300.00,           1),
                              ('testvoucher9', 111,       1,           '[last] Coupon šÄßüл', '9 Coupon šÄßüл',           64.00,       'absolute',       '2008-01-01 00:00:00', '2020-01-01 00:00:00', 0,                   0,                    0,                   300.00,           1);

REPLACE INTO `oxvoucherseries2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111);


REPLACE INTO `oxvouchers` (`OXDATEUSED`, `OXORDERID`, `OXUSERID`, `OXRESERVED`, `OXVOUCHERNR`, `OXVOUCHERSERIEID`, `OXDISCOUNT`, `OXID`) VALUES
                         ('0000-00-00', '',          '',          0,           '111111',      'testcoupon1',       NULL,        'testvoucher001'),
                         ('0000-00-00', '',          '',          0,           '111111',      'testcoupon1',       NULL,        'testvoucher002'),
                         ('0000-00-00', '',          '',          0,           '111111',      'testcoupon1',       NULL,        'testvoucher003'),
                         ('0000-00-00', '',          '',          0,           '111111',      'testcoupon1',       NULL,        'testvoucher004'),
                         ('0000-00-00', '',          '',          0,           '111111',      'testcoupon1',       NULL,        'testvoucher005'),
                         ('0000-00-00', '',          '',          0,           '222222',      'testcoupon2',       NULL,        'testvoucher006'),
                         ('0000-00-00', '',          '',          0,           '222222',      'testcoupon2',       NULL,        'testvoucher007'),
                         ('0000-00-00', '',          '',          0,           '222222',      'testcoupon2',       NULL,        'testvoucher008'),
                         ('0000-00-00', '',          '',          0,           '222222',      'testcoupon2',       NULL,        'testvoucher009'),
                         ('0000-00-00', '',          '',          0,           '222222',      'testcoupon2',       NULL,        'testvoucher010'),
                         ('0000-00-00', '',          '',          0,           '123123',      'testvoucher4',      NULL,        'testcoucher011'),
                         ('0000-00-00', '',          '',          0,           'test111',     'testvoucher1',      NULL,        'testcoucher012'),
                         ('0000-00-00', '',          '',          0,           'test222',     'testvoucher2',      NULL,        'testcoucher013');

#Gift wrapping demodata
REPLACE INTO `oxwrapping` (`OXID`,        `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXACTIVE_1`, `OXTYPE`, `OXNAME`,                        `OXNAME_1`,                      `OXPRICE`) VALUES
                         ('testwrapping', 101,       1,            1,          1,           'WRAP',   'Test wrapping [DE] šÄßüл',      'Test wrapping [EN] šÄßüл',       0.9),
                         ('testcard',     102,       1,            1,          1,           'CARD',   'Test card [DE] šÄßüл',          'Test card [EN] šÄßüл',           0.2),
                         ('testwrap2',    103,       1,            0,          0,           'WRAP',   '2 DE Gift Wrapping šÄßüл',      '4 EN Gift Wrapping šÄßüл',       2),
                         ('testwrap1',    104,       1,            0,          0,           'WRAP',   '1 DE Gift Wrapping šÄßüл',      '3 EN Gift Wrapping šÄßüл',       1),
                         ('testwrap3',    105,       1,            0,          0,           'WRAP',   '3 DE Gift Wrapping šÄßüл',      '1 EN Gift Wrapping šÄßüл',       3),
                         ('testwrap4',    106,       1,            0,          0,           'WRAP',   '4 DE Gift Wrapping šÄßüл',      '[last] EN Gift Wrapping šÄßüл',  4),
                         ('testwrap5',    107,       1,            0,          0,           'WRAP',   '[last] DE Gift Wrapping šÄßüл', '2 EN Gift Wrapping šÄßüл',       5);

REPLACE INTO `oxwrapping2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107);


#User demodata
REPLACE INTO `oxuser` (`OXID`,     `OXACTIVE`, `OXRIGHTS`, `OXSHOPID`, `OXUSERNAME`,         `OXPASSWORD`,                       `OXPASSSALT`,        `OXCUSTNR`, `OXCOMPANY`,          `OXFNAME`,        `OXLNAME`,           `OXSTREET`,        `OXSTREETNR`, `OXADDINFO`,                   `OXCITY`,            `OXCOUNTRYID`,                `OXZIP`,  `OXFON`,       `OXFAX`,       `OXSAL`, `OXBONI`, `OXCREATE`,            `OXREGISTER`,          `OXPRIVFON`,   `OXMOBFON`,    `OXBIRTHDATE`) VALUES
                     ('testuser',  1,         'user',      1,         'testuser@oxid-esales.dev', 'c9dadd994241c9e5fa6469547009328a', '7573657275736572',   8,         'UserCompany šÄßüл',  'UserNamešÄßüл',  'UserSurnamešÄßüл',  'Musterstr.šÄßüл', '1',          'User additional info šÄßüл',  'Musterstadt šÄßüл', 'a7c40f631fc920687.20179984', '79098',  '0800 111111', '0800 111112', 'Mr',     500,     '2008-02-05 14:42:42', '2008-02-05 14:42:42', '0800 111113', '0800 111114', '1980-01-01');
#News demodata
REPLACE INTO `oxnews` (`OXID`,      `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXDATE`,     `OXSHORTDESC`,                 `OXLONGDESC`,                  `OXACTIVE_1`, `OXSHORTDESC_1`,               `OXLONGDESC_1`) VALUES
                     ('testnews1',  101,       1,            1,         '2008-01-01', 'Test news 1 [DE] šÄßüл',      '<p>Test news text 1 [DE]</p>', 1,           'Test news 1 [EN] šÄßüл',      '<p>Test news text 1 [EN] šÄßüл</p>'),
                     ('testnews2',  102,       1,            1,         '2008-01-02', 'Test news 2 [DE] šÄßüл',      '<p>Test news text 2 [DE]</p>', 1,           'Test news 2 [EN] šÄßüл',      '<p>Test news text 2 [EN] šÄßüл</p>'),
                     ('testnews3',  103,       1,            0,         '2007-11-02', '1 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '[last] [EN] Test news šÄßüл', '<p>Test news text</p>'),
                     ('testnews4',  104,       1,            0,         '2008-01-05', '2 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '8 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews5',  105,       1,            0,         '2007-12-02', '3 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '1 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews6',  106,       1,            0,         '2008-01-02', '4 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '2 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews7',  107,       1,            0,         '2007-12-20', '5 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '3 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews8',  108,       1,            0,         '2008-02-03', '6 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '4 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews9',  109,       1,            0,         '2008-02-02', '7 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '5 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews10', 110,       1,            0,         '2008-01-17', '8 [DE] Test news šÄßüл',      '<p>Test news text</p>',        0,           '6 [EN] Test news šÄßüл',      '<p>Test news text</p>'),
                     ('testnews11', 111,       1,            0,         '2008-02-12', '[last] [DE] Test news šÄßüл', '<p>Test news text</p>',        0,           '7 [EN] Test news šÄßüл',      '<p>Test news text</p>');

REPLACE INTO `oxnews2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111);

#Newssubscibers demodata
REPLACE INTO `oxnewssubscribed` (`OXID`,                       `OXSHOPID`, `OXUSERID`,  `OXSAL`, `OXFNAME`,   `OXLNAME`,      `OXEMAIL`,            `OXSUBSCRIBED`) VALUES
                               ('15947a85ab4658ce7.97826445',  1,         'testuser',  'Mr',    'UserName',  'UserSurname',  'testuser@oxid-esales.dev', '2008-02-05 14:46:44');
#Discount demodata
REPLACE INTO `oxdiscount` (`OXID`,           `OXMAPID`, `OXSHOPID`, `OXACTIVE`, `OXTITLE`,                          `OXTITLE_1`,                       `OXAMOUNT`, `OXAMOUNTTO`, `OXPRICETO`, `OXPRICE`, `OXADDSUMTYPE`, `OXADDSUM`, `OXITMARTID`, `OXITMAMOUNT`, `OXITMMULTIPLE`) VALUES
                         ('testcatdiscount', 101,       1,            1,         'discount for category [DE] šÄßüл', 'discount for category [EN] šÄßüл', 1,          999999,       0,           0,        'abs',           5,         '',            0,             0),
                         ('testartdiscount', 102,       1,            1,         'discount for product [DE] šÄßüл',  'discount for product [EN] šÄßüл',  0,          0,            999999,      100,      '%',             10,        '',            0,             0),
                         ('testdiscount1',   103,       1,            1,         '1 DE test discount šÄßüл',         '[last] EN test discount šÄßüл',    0,          999999,       999999,      0,        'abs',           5,         '',            0,             0),
                         ('testdiscount2',   104,       1,            0,         '2 DE test discount šÄßüл',         '3 EN test discount šÄßüл',         0,          0,            0,           0,        'abs',           0,         '',            0,             0),
                         ('testdiscount3',   105,       1,            0,         '3 DE test discount šÄßüл',         '2 EN test discount šÄßüл',         0,          0,            0,           0,        'abs',           0,         '',            0,             0),
                         ('testdiscount4',   106,       1,            0,         '4 DE test discount šÄßüл',         '4 EN test discount šÄßüл',         0,          0,            0,           0,        'abs',           0,         '',            0,             0),
                         ('testdiscount5',   107,       1,            0,         '[last] DE test discount šÄßüл',    '1 EN test discount šÄßüл',         1,          999999,       0,           0,        'abs',           10,        '',            0,             0),
                         ('testitmdiscount', 108,       1,            1,         'Itm discount [DE] šÄßüл',          'Itm discount [EN] šÄßüл',          5,          999999,       0,           0,        'itm',           0,         '1003',        1,             0);

REPLACE INTO `oxdiscount2shop` (`OXSHOPID`, `OXMAPOBJECTID`) VALUES
  (1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108);

#Countries demodata
REPLACE INTO `oxcountry` (`OXID`,        `OXACTIVE`, `OXTITLE`,                       `OXISOALPHA2`, `OXISOALPHA3`, `OXUNNUM3`, `OXORDER`, `OXSHORTDESC`,                 `OXTITLE_1`,                     `OXSHORTDESC_1`,                    `OXVATSTATUS`) VALUES
                        ('testcountry1', 0,         '1 DE test Country šÄßüл',       '',            '111',         '',          0,        '[last] DE test Country desc', '[last] EN test Country šÄßüл',  '1 EN test Country desc šÄßüл',      1),
                        ('testcountry2', 0,         '[last] DE test Country šÄßüл',  '',            '000',         '',          0,        '1 DE test Country desc',      '1 EN test Country šÄßüл',       '[last] EN test Country desc šÄßüл', 1);

#article2selectlist
REPLACE INTO `oxobject2selectlist` (`OXID`,                       `OXOBJECTID`, `OXSELNID`,   `OXSORT`) VALUES
                                  ('15947a8577ca995c7.20909175', '1001',       'testsellist', 0);

#Delivery2DeliverySet
REPLACE INTO `oxdel2delset` (`OXID`, `OXDELID`, `OXDELSETID`) VALUES
                           ('15947a84ade618746.43436519', 'testdelart', 'testdelset'),
                           ('15947a84ade6246c1.43630378', 'testdel',    'testdelset'),
                           ('b92c5ujk28677aa8999b448d6a', 'testsh5',    'testshset7'),
                           ('b9216d4fb5poifd0e6197a6421', 'testsh2',    'testshset7'),
                           ('b9262poice9d7a202b8af3a4d8', 'testsh1',    'testshset7');

#Category2Attribute
REPLACE INTO `oxcategory2attribute` (`OXID`,                      `OXOBJECTID`,    `OXATTRID`,      `OXSORT`) VALUES
                                   ('15947a851650f5270.43233238', 'testcategory0', 'testattribute1', 1),
                                   ('15947a8516e5d3039.68063444', 'testcategory0', 'testattribute2', 3),
                                   ('15947a851772549e4.38519009', 'testcategory0', 'testattribute3', 2);

#price2article
REPLACE INTO `oxprice2article` (`OXID`,                      `OXSHOPID`, `OXARTID`, `OXADDABS`, `OXADDPERC`, `OXAMOUNT`, `OXAMOUNTTO`) VALUES
                              ('96047a7352aaea268.51406202', 1,         '1003',     75,         0,           2,          5),
                              ('96047a735319dcbe8.56525815', 1,         '1003',     0,          20,          6,          9999999);

#article2attribute
REPLACE INTO `oxobject2attribute` (`OXID`,                       `OXOBJECTID`, `OXATTRID`,       `OXVALUE`,           `OXPOS`, `OXVALUE_1`) VALUES
                                 ('15947a851058b2082.70204859', '1001',       'testattribute1', 'attr value 11 [DE]', 0,      'attr value 11 [EN] šÄßüл'),
                                 ('15947a851058bda82.26304276', '1000',       'testattribute1', 'attr value 1 [DE]',  0,      'attr value 1 [EN] šÄßüл'),
                                 ('15947a8510d0b8da1.03431546', '1001',       'testattribute2', 'attr value 12 [DE]', 0,      'attr value 12 [EN] šÄßüл'),
                                 ('15947a8510d1029d6.13172117', '1000',       'testattribute2', 'attr value 2 [DE]',  0,      'attr value 2 [EN] šÄßüл'),
                                 ('15947a85117af8781.96104704', '1001',       'testattribute3', 'attr value 3 [DE]',  0,      'attr value 3 [EN] šÄßüл'),
                                 ('15947a85117b03a35.88871161', '1000',       'testattribute3', 'attr value 3 [DE]',  0,      'attr value 3 [EN] šÄßüл');

#article2category
REPLACE INTO `oxobject2category` (`OXID`, `OXSHOPID`, `OXOBJECTID`, `OXCATNID`,     `OXPOS`, `OXTIME`) VALUES
                                ('96047a71f4d4e34d9.76958590',       1,           '1000',       'testcategory0', 0,       1202134861),
                                ('96047a72713424e14.02408995',       1,           '1001',       'testcategory0', 0,       1202136851),
                                ('bde47a82895537cd3.78346880',       1,           '1002',       'testcategory1', 0,       1202202773),
                                ('bde47a82895520cb7.01327955',       1,           '1003',       'testcategory1', 0,       1202202773);

#object2delivery
REPLACE INTO `oxobject2delivery` (`OXID`,                       `OXDELIVERYID`, `OXOBJECTID`,                 `OXTYPE`) VALUES
                                ('15947a8495c225b22.01517980', 'testdel',      'a7c40f631fc920687.20179984', 'oxcountry'),
                                ('15947a84a19d31b86.15643626', 'testdel',      'testcategory1',              'oxcategories'),
                                ('15947a84ac362af56.87649408', 'testdelart',   '1001',                       'oxarticles'),
                                ('15947a84b002905d3.97006730', 'testdelset',   'a7c40f631fc920687.20179984', 'oxdelset'),
                                ('b924aa1478381d2d5642cb1dab', 'testshset7',   'a7c40f631fc920687.20179984', 'oxdelset');

#object2group
REPLACE INTO `oxobject2group` (`OXID`,                      `OXSHOPID`, `OXOBJECTID`,  `OXGROUPSID`) VALUES
                             ('96047a71c6f049988.94873501', 1,         'testpayment', 'oxidnewcustomer'),
                             ('15947a85a7ce23451.42160470', 1,         'testuser',    'oxidnewcustomer'),
                             ('15947a86a09757b95.44672009', 1,         'testnews1',   'oxidnewcustomer'),
                             ('15947a86bb6a90e84.52663579', 1,         'testnews2',   'oxidnewcustomer'),
                             ('15947a8724f1e7720.76850239', 1,         'testcoupon2', 'oxidnewcustomer'),
                             ('15947a872542b8e72.84891394', 1,         'testcoupon1', 'oxidnewcustomer'),
                             ('eac0e868c3de82a412e153b8e5', 1,         'testvoucher1', 'oxidnewcustomer'),
                             ('ea245d14d646f7bebe9cc41138', 1,         'testvoucher2', 'oxidnewcustomer');

#object2payment
REPLACE INTO `oxobject2payment` (`OXID`,                       `OXPAYMENTID`,    `OXOBJECTID`,                 `OXTYPE`) VALUES
                               ('bde47a8223ddc3572.12628821', 'testpayment',    'a7c40f631fc920687.20179984', 'oxcountry'),
                               ('15947a84af5c69698.88858631', 'testpayment',    'testdelset',                 'oxdelset'),
                               ('15947a84af8e08906.22057468', 'oxidcreditcard', 'testdelset',                 'oxdelset'),
                               ('15947a84af8e151b6.25811193', 'oxidcashondel',  'testdelset',                 'oxdelset'),
                               ('b923b6faf8e813447fb3200e88', 'oxidinvoice',    'testshset7',                 'oxdelset'),
                               ('b928f082261122e1fdb5c43e05', 'oxidcashondel',  'testshset7',                 'oxdelset');

#object2discount
REPLACE INTO `oxobject2discount` (`OXID`,                       `OXDISCOUNTID`,    `OXOBJECTID`,                 `OXTYPE`) VALUES
                                ('bde47a823ca721245.91816191', 'testcatdiscount', 'a7c40f631fc920687.20179984', 'oxcountry'),
                                ('bde47a823db7d82f5.99715633', 'testcatdiscount', 'testcategory0',              'oxcategories'),
                                ('bde47a82573034757.65351036', 'testartdiscount', 'a7c40f631fc920687.20179984', 'oxcountry'),
                                ('bde47a825770cf916.79996031', 'testartdiscount', 'a7c40f6321c6f6109.43859248', 'oxcountry'),
                                ('bde47a825c71f8730.63312699', 'testartdiscount', '1003',                       'oxarticles'),
                                ('bde47a825c72016f1.26609305', 'testartdiscount', '1002',                       'oxarticles'),
                                ('4b847c42fa7231254.12675829', 'testitmdiscount', 'a7c40f631fc920687.20179984', 'oxcountry'),
                                ('4b847c42fbe861b89.64935625', 'testitmdiscount', '1000',                       'oxarticles'),
                                ('375b0c45fcje3de790fe539eed', 'testdiscount1',   '30e44ab85808a1f05.26160932', 'oxcategories'),
                                ('ea25b5a5a39bce8d3227038752', 'testvoucher1',    '1002',                       'oxarticles'),
                                ('ea6968eef6e9694fa3d750e0cb', 'testvoucher1',    '1003',                       'oxarticles'),
                                ('ea236aa3e1ee3cdb82cb9120e7', 'testvoucher2',    'testcategory0',              'oxcategories'),
                                ('eab1e120dd1d8be2aefbe4b1f6', 'testvoucher2',    '1003',                       'oxarticles');

#updating oxconfig settings
UPDATE `oxconfig` SET `OXVARVALUE` = 0x93ea1218   WHERE `OXVARNAME` = 'bl_perfLoadSelectLists'         AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x93ea1218   WHERE `OXVARNAME` = 'bl_perfUseSelectlistPrice'      AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x93ea1218   WHERE `OXVARNAME` = 'bl_perfLoadSelectListsInAList'  AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x7900fdf51e WHERE `OXVARNAME` = 'bl_perfShowActionCatArticleCnt' AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x7900fdf51e WHERE `OXVARNAME` = 'blShowVATForDelivery'           AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x7900fdf51e WHERE `OXVARNAME` = 'blCalcSkontoForDelivery'        AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x7900fdf51e WHERE `OXVARNAME` = 'blShowVATForPayCharge'          AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x93ea1218   WHERE `OXVARNAME` = 'blOtherCountryOrder'            AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x7900fdf51e WHERE `OXVARNAME` = 'blCheckTemplates'               AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x93ea1218   WHERE `OXVARNAME` = 'blDisableNavBars'               AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x93ea1218   WHERE `OXVARNAME` = 'blAllowUnevenAmounts'           AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x07         WHERE `OXVARNAME` = 'blConfirmAGB'                   AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0xde         WHERE `OXVARNAME` = 'iNewBasketItemMessage'          AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = ''           WHERE `OXVARNAME` = 'sShopCountry'                   AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0xb0         WHERE `OXVARNAME` = 'iTopNaviCatCount'               AND `OXSHOPID` = 1 AND `OXMODULE` = 'theme:azure';
UPDATE `oxconfig` SET `OXVARVALUE` = 0x4dbace29724a51b6af7d09aac117301142e91c3c5b7eed9a850f85c1e3d58739aa9ea92523f05320a95060d60d57fbb027bad88efdaa0b928ebcd6aacf58084d31dd6ed5e718b833f1079b3805d28203f284492955c82cea3405879ea7588ec610ccde56acede495 WHERE `OXVARNAME` = 'aInterfaceProfiles' AND `OXSHOPID` = 1;
UPDATE `oxconfig` SET `OXVARVALUE` = 0x4dba222b70e349f0c9d1aba6133981af1e8d79724d7309a19dd3eed099418943829510e114c4f6ffcb2543f5856ec4fea325d58b96e406decb977395c57d7cc79eec7f9f8dd6e30e2f68d198bd9d079dbe8b4f WHERE `OXVARNAME` = 'aNrofCatArticles' AND `OXSHOPID` = 1;

DELETE FROM `oxconfig` WHERE `OXVARNAME`='blBasketExcludeEnabled';

REPLACE INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXVARNAME`,               `OXVARTYPE`, `OXVARVALUE`) VALUES
                       ('5507',  1,         'blAllowNegativeStock',    'bool',       0x7900fdf51e),
                       ('a443',  1,         'blBidirectCross',         'bool',       0x7900fdf51e),
                       ('at74',  1,         'blDisableNavBars',        'bool',       0x93ea1218),
                       ('3583',  1,         'iMinOrderPrice',          'str',        0xfba4),
                       ('3502',  1,         'blOverrideZeroABCPrices', 'bool',       0x93ea1218),
                       /*('01f4',  1,         'blUseContentCaching',     'bool',       0x93ea1218),*/
                       ('803d',  1,         'blMallUsers',             'bool',       0x93ea1218),
                       ('2c9f',  1,         'blShowOrderButtonOnTop',  'bool',       0x93ea1218),
                       ('14c5',  1,         'bl_rssBargain',           'bool',       0x07),
                       ('24c5',  1,         'bl_rssRecommLists',       'bool',       0x07),
                       ('pge5',  1,         'bl_rssRecommListArts',    'bool',       0x07),
                       ('a6ba',  1,         'blOrderDisWithoutReg',    'bool',       ''),
                       ('5s8f',  1,         'blPerfNoBasketSaving',    'bool',       0x93ea1218),
                       ('asdf',  1,         'blBasketExcludeEnabled',  'str',         '');

#Accessories and crossselling
REPLACE INTO `oxaccessoire2article` (`OXID`,                       `OXOBJECTID`, `OXARTICLENID`, `OXSORT`) VALUES
                                   ('40847c5649f785c04.64102769', '1002',       '1000',          0);

REPLACE INTO `oxobject2article` (`OXID`,                       `OXOBJECTID`, `OXARTICLENID`, `OXSORT`) VALUES
                               ('40847c56498a5eeb5.80145793', '1003',       '1000',          0);

#review demodata
REPLACE INTO `oxreviews` (`OXID`,       `OXACTIVE`, `OXOBJECTID`, `OXTYPE`,    `OXTEXT`,                           `OXUSERID`, `OXCREATE`,           `OXLANG`, `OXRATING`) VALUES
                        ('testreview1', 0,         '10010',      'oxarticle', '1 [DE] comment for product šÄßüл', 'testuser', '2006-01-01 10:10:10', 0,        0),
                        ('testreview2', 0,         '10011',      'oxarticle', '3 [EN] product comment šÄßüл',     'testuser', '2006-02-01 08:10:10', 1,        0),
                        ('testreview3', 0,         '10012',      'oxarticle', '3 [DE] comment for product šÄßüл', 'testuser', '2005-12-01 11:11:00', 0,        0),
                        ('testreview4', 0,         '10011',      'oxarticle', '1 [EN] product comment šÄßüл',     'testuser', '2006-02-05 10:10:10', 1,        0),
                        ('testreview5', 0,         '10010',      'oxarticle', '2 [DE] comment for product šÄßüл', 'testuser', '2005-12-30 11:11:00', 0,        0),
                        ('testreview6', 0,         '10012',      'oxarticle', '2 [EN] product comment šÄßüл',     'testuser', '2005-12-05 10:10:10', 1,        0),
                        ('testreview7', 0,         '1002',       'oxarticle', 'review for parent product šÄßüл',  'testuser', '2009-01-15 14:36:19', 1,        0),
                        ('testreview8', 0,         '1002-1',     'oxarticle', 'review for var1 šÄßüл',            'testuser', '2009-01-15 14:36:55', 1,        0),
                        ('testreview9', 0,         '1002-2',     'oxarticle', 'review for var2 šÄßüл',            'testuser', '2009-01-15 14:36:56', 1,        0);

#user groups demodata
REPLACE INTO `oxgroups` (`OXID`,      `OXACTIVE`, `OXTITLE`,                 `OXTITLE_1`,              `OXRRID`) VALUES
                       ('testgroup1', 0,         '1 user Group šÄßüл',      '1 user Group šÄßüл',      16),
                       ('testgroup2', 0,         '2 user Group šÄßüл',      '2 user Group šÄßüл',      17),
                       ('testgroup3', 0,         '3 user Group šÄßüл',      '3 user Group šÄßüл',      18),
                       ('testgroup4', 0,         'Z user Group šÄßüл',      'Z user Group šÄßüл',      19),
                       ('testgroup5', 0,         '[last] user Group šÄßüл', '[last] user Group šÄßüл', 20);

#Admin and shop roles demodata
REPLACE INTO `oxroles` (`OXID`,            `OXTITLE`,                `OXSHOPID`, `OXACTIVE`, `OXAREA`) VALUES
                      ('testadminrole1',  '1 admin role šÄßüл',      1,          0,          0),
                      ('testadminrole2',  '2 admin role šÄßüл',      1,          0,          0),
                      ('testadminrole3',  '3 admin role šÄßüл',      1,          0,          0),
                      ('testadminrole4',  '4 admin role šÄßüл',      1,          0,          0),
                      ('testadminrole5',  '[last] admin role šÄßüл', 1,          0,          0),
                      ('testadminrole6',  '1 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole7',  '2 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole8',  '3 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole9',  '4 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole10', '10 shop role šÄßüл',      1,          0,          1),
                      ('testadminrole11', '9 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole12', '8 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole13', '7 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole14', '6 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole15', '5 shop role šÄßüл',       1,          0,          1),
                      ('testadminrole16', '[last] shop role šÄßüл',  1,          0,          1);

REPLACE INTO `oxfield2role` (`OXFIELDID`,                        `OXTYPE`, `OXROLEID`,      `OXIDX`) VALUES
                           ('42b44bc9934bdb406.85935627',       '',       'testadminrole6', 1),
                           ('42b44bc9941a46fd3.13180499',       '',       'testadminrole6', 1),
                           ('42b44bc99488c66b1.94059993',       '',       'testadminrole6', 1),
                           ('42b44bc9950334951.12393781',       '',       'testadminrole6', 1),
                           ('3a6a13b4820fff81c09131cf4c5afcee', '',       'testadminrole6', 1);

REPLACE INTO `oxobjectrights` (`OXID`,                             `OXOBJECTID`,    `OXGROUPIDX`, `OXOFFSET`, `OXACTION`) VALUES
                             ('3a61b34435f387b40025bb518d950380', 'testadminrole6', 512,          0,          1);

REPLACE INTO `oxrolefields` (`OXID`,                             `OXNAME`,       `OXPARAM`) VALUES
                           ('3a6a13b4820fff81c09131cf4c5afcee', 'SUGGESTCHECK', 'suggest');

#CMS pages demodata
REPLACE INTO `oxcontents` (`OXID`,         `OXLOADID`,         `OXSHOPID`, `OXSNIPPET`, `OXTYPE`, `OXACTIVE`, `OXACTIVE_1`, `OXTITLE`,                   `OXCONTENT`,                `OXTITLE_1`,                 `OXCONTENT_1`,                    `OXCATID`,                    `OXFOLDER`,           `OXTIMESTAMP`) VALUES
                         ('testcontent1', '[last]testcontent', 1,          0,           2,        0,          0,           '1 [DE] content šÄßüл',      '<p>content [DE] 1</p>',    '[last] [EN] content šÄßüл', '<p>content [EN] 1  šÄßüл</p>',   'testcategory0',              'CMSFOLDER_USERINFO', '2008-01-01 00:00:01'),
                         ('testcontent2', '1testcontent',      1,          0,           2,        0,          0,           '[last] [DE] content šÄßüл', '<p>content [DE] last</p>', '3 [EN] content šÄßüл',      '<p>content [EN] last šÄßüл</p>', 'testcategory1',              'CMSFOLDER_USERINFO', '2008-01-01 00:00:01'),
                         ('testcontent3', 't3testcontent',     1,          0,           3,        0,          0,           'T2 [DE] content šÄßüл',     '',                         'T4 [EN] content šÄßüл',     '',                               '30e44ab834ea42417.86131097', 'CMSFOLDER_USERINFO', '2008-01-01 00:00:01'),
                         ('testcontent4', 't4testcontent',     1,          0,           3,        0,          0,           'T4 [DE] content šÄßüл',     '',                         'T1 [EN] content šÄßüл',     '',                               '30e44ab834ea42417.86131097', 'CMSFOLDER_USERINFO', '2008-01-01 00:00:01'),
                         ('testcontent6', 't5testcontent',     1,          0,           3,        0,          0,           'T6 [DE] content šÄßüл',     '',                         'T5 [EN] content šÄßüл',     '',                               '30e44ab834ea42417.86131097', 'CMSFOLDER_USERINFO', '2008-01-01 00:00:01');

#Orders demodata
DELETE FROM `oxorder` WHERE `OXORDERNR` = 1;

UPDATE `oxcounters` SET oxcount = 11 WHERE oxident = 'oxOrder';

REPLACE INTO `oxorderarticles` (`OXID`,         `OXORDERID`,  `OXAMOUNT`, `OXARTID`, `OXARTNUM`, `OXTITLE`,                   `OXSHORTDESC`,                          `OXNETPRICE`,    `OXBRUTPRICE`, `OXVATPRICE`,     `OXVAT`, `OXPRICE`, `OXBPRICE`, `OXNPRICE`,       `OXWEIGHT`, `OXSTOCK`, `OXINSERT`,   `OXTIMESTAMP`,        `OXLENGTH`, `OXWIDTH`, `OXHEIGHT`, `OXSEARCHKEYS`, `OXISSEARCH`, `OXSUBCLASS`, `OXORDERSHOPID`) VALUES
                              ('testordart1',  'testorder4',  2,         '10012',   '10012',    '12 EN product šÄßüл',       '11 EN description šÄßüл',               3.3613445378151, 4,             0.63865546218487, 19,      2,         4,          3.3613445378151,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart2',  'testorder6',  5,         '10011',   '10011',    '11 EN product šÄßüл',       '10 EN description šÄßüл',               7.563025210084,  9,             1.436974789916,   19,      1.8,       9,          7.563025210084,   0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart3',  'testorder7',  2,         '1000',    '1000',     'Test product 0 [EN] šÄßüл', 'Test product 0 short desc [EN] šÄßüл',  95.238095238095, 100,           4.7619047619048,  5,       50,        50,         47.619047619048,  24,         15,       '2008-02-04', '2008-02-04 17:07:29', 1,          2,         2,         'šÄßüл1000',    1,            'oxarticle',   1 ),
                              ('testordart4',  'testorder1',  10,        '10012',   '10012',    '12 EN product šÄßüл',       '11 EN description šÄßüл',               16.806722689076, 20,            3.1932773109244,  19,      2,         20,         16.806722689076,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart5',  'testorder9',  1,         '10011',   '10011',    '11 EN product šÄßüл',       '10 EN description šÄßüл',               1.5126050420168, 1.8,           0.28739495798319, 19,      1.8,       1.8,        1.5126050420168,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart6',  'testorder10', 1,         '10011',   '10011',    '11 EN product šÄßüл',       '10 EN description šÄßüл',               1.5126050420168, 1.8,           0.28739495798319, 19,      1.8,       1.8,        1.5126050420168,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart7',  'testorder11', 3,         '10012',   '10012',    '12 EN product šÄßüл',       '11 EN description šÄßüл',               5.0420168067227, 6,             0.95798319327731, 19,      2,         6,          5.0420168067227,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart8',  'testorder3',  2,         '10010',   '10010',    '1 EN product šÄßüл',        '[last] EN description šÄßüл',           2.5210084033613, 3,             0.47899159663866, 19,      1.5,       3,          2.5210084033613,  0,          0,        '2008-04-03', '2008-04-17 17:40:02', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart9',  'testorder8',  1,         '10012',   '10012',    '12 EN product šÄßüл',       '11 EN description šÄßüл',               1.6806722689076, 2,             0.31932773109244, 19,      2,         2,          1.6806722689076,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart10', 'testorder2',  2,         '10011',   '10011',    '11 EN product šÄßüл',       '10 EN description šÄßüл',               3.0252100840336, 3.6,           0.57478991596639, 19,      1.8,       3.6,        3.0252100840336,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart11', 'testorder5',  1,         '10010',   '10010',    '1 EN product šÄßüл',        '[last] EN description šÄßüл',           1.2605042016807, 1.5,           0.23949579831933, 19,      1.5,       1.5,        1.2605042016807,  0,          0,        '2008-04-03', '2008-04-17 17:40:02', 0,          0,         0,         '',             0,            '',            1 ),
                              ('testordart12', 'testorder5',  2,         '10011',   '10011',    '11 EN product šÄßüл',       '10 EN description šÄßüл',               3.0252100840336, 3.6,           0.57478991596639, 19,      1.8,       3.6,        3.0252100840336,  0,          0,        '2008-04-03', '2008-04-03 12:50:20', 0,          0,         0,         '',             0,            '',            1 );

#recommendation lists demodata
REPLACE INTO `oxrecommlists` (`OXID`,      `OXSHOPID`, `OXUSERID`, `OXAUTHOR`,      `OXTITLE`,      `OXDESC`,            `OXRATINGCNT`, `OXRATING`) VALUES
                            ('testrecomm', 1,         'testuser', 'recomm author', 'recomm title', 'recom introduction', 0,             0);

REPLACE INTO `oxobject2list` (`OXID`,             `OXOBJECTID`, `OXLISTID`,   `OXDESC`,                   `OXTIMESTAMP`) VALUES
                            ('testrecomarticle', '1000',       'testrecomm', 'comment for product 1000', '2008-11-09 17:04:47');

REPLACE INTO `oxratings` (`OXID`,           `OXSHOPID`, `OXUSERID`, `OXTYPE`,       `OXOBJECTID`, `OXRATING`, `OXTIMESTAMP`) VALUES
                        ('testrecomrating', 1,         'testuser', 'oxrecommlist', 'testrecomm',  3,         '2009-11-10 12:18:29');

REPLACE INTO `oxreviews` (`OXID`,           `OXACTIVE`, `OXOBJECTID`, `OXTYPE`,       `OXTEXT`,                       `OXUSERID`, `OXCREATE`,           `OXLANG`, `OXRATING`) VALUES
                        ('testrecomreview', 0,         'testrecomm', 'oxrecommlist', 'recommendation for this list', 'testuser', '2009-11-10 12:18:29', 1,        3);

#updating smtp and emails data
UPDATE `oxshops` SET `OXPRODUCTIVE` = 1, `OXINFOEMAIL` = 'testuser@oxid-esales.dev', `OXORDEREMAIL` = 'testuser@oxid-esales.dev', `OXOWNEREMAIL` = 'testuser@oxid-esales.dev', `OXSMTP` = '172.18.1.67', `OXDEFCAT` = '' WHERE `OXID` = '1';

#updating Countries for not billing VAT
UPDATE `oxcountry` SET `OXVATSTATUS` = 0 WHERE `OXTITLE_1` = 'Austria';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Germany';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Austria';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Switzerland';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Liechtenstein';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Italy';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Luxembourg';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'France';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Sweden';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Finland';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'United Kingdom';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Ireland';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Netherlands';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Belgium';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Portugal';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Spain';
UPDATE `oxcountry` SET `OXACTIVE` = 1 WHERE `OXTITLE_1` = 'Greece';

#additional for features testing
#UPDATE `oxconfig` SET `OXVARVALUE` = '' WHERE `OXVARNAME` = 'blCheckForUpdates';
#UPDATE `oxconfig` SET `OXVARVALUE` = '' WHERE `OXVARNAME` = 'blLoadDynContents';

#adding states for germany
REPLACE INTO `oxstates` (`OXID`, `OXCOUNTRYID`, `OXTITLE`, `OXISOALPHA2`, `OXTITLE_1`, `OXTITLE_2`, `OXTITLE_3`) VALUES
('BB', 'a7c40f631fc920687.20179984', 'Brandenburg', 'BB', 'Brandenburg', '', ''),
('BE', 'a7c40f631fc920687.20179984', 'Berlin', 'BE', 'Berlin', '', ''),
('BW', 'a7c40f631fc920687.20179984', 'Baden-Württemberg', 'BW', 'Baden-Wurttemberg', '', ''),
('BY', 'a7c40f631fc920687.20179984', 'Bayern', 'BY', 'Bavaria', '', ''),
('HB', 'a7c40f631fc920687.20179984', 'Bremen', 'HB', 'Bremen', '', ''),
('HE', 'a7c40f631fc920687.20179984', 'Hessen', 'HE', 'Hesse', '', ''),
('HH', 'a7c40f631fc920687.20179984', 'Hamburg', 'HH', 'Hamburg', '', ''),
('MV', 'a7c40f631fc920687.20179984', 'Mecklenburg-Vorpommern', 'MV', 'Mecklenburg-Western Pomerania', '', ''),
('NI', 'a7c40f631fc920687.20179984', 'Niedersachsen', 'NI', 'Lower Saxony', '', ''),
('NW', 'a7c40f631fc920687.20179984', 'Nordrhein-Westfalen', 'NW', 'North Rhine-Westphalia', '', ''),
('RP', 'a7c40f631fc920687.20179984', 'Rheinland-Pfalz', 'RP', 'Rhineland-Palatinate', '', ''),
('SH', 'a7c40f631fc920687.20179984', 'Schleswig-Holstein', 'SH', 'Schleswig-Holstein', '', ''),
('SL', 'a7c40f631fc920687.20179984', 'Saarland', 'SL', 'Saarland', '', ''),
('SN', 'a7c40f631fc920687.20179984', 'Sachsen', 'SN', 'Saxony', '', ''),
('ST', 'a7c40f631fc920687.20179984', 'Sachsen-Anhalt', 'ST', 'Saxony-Anhalt', '', ''),
('TH', 'a7c40f631fc920687.20179984', 'Thüringen', 'TH', 'Thuringia', '', '');
