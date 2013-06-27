-- set shop id
SET @sShopId = 1;

-- data for new mobile theme
INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`) VALUES
('1ec4235c2aee774aa45d772875435922', @sShopId, 'theme:mobile', 'sIconsize', 'str', 0x8064a213b1),
('12642dfaa1dee77488b1b22948593022', @sShopId, 'theme:mobile', 'sThumbnailsize', 'str', 0x170a3340d372be),
('12642dfaa1dee77487d0644506753922', @sShopId, 'theme:mobile', 'aDetailImageSizes', 'aarr',0x4dba326a73d2cdcb471b9533d7800b4b898873f7ae9dc29ed9e0e4f6bc678f00ea1438810efd6c1fe338a39dc20247d3a63beec4852106b7a1dd7cb1451f56975c3fd6159579cd2cab97104f17ae6c45a38a41e9a5bc59ceee828bfd6883e282aef2e55d00fb7ee9abb79b63c74cb7ba3fa76665f6a9294d8bf365bf7d3d0d56faf2355df145b02498b144bc6b0ab9fc9f74d2e1dd0ac7a4989184f58b7e2c58400bb4b92c9468f3d8ca7170cde789d6c1282016056e51005091e19803a859992a5549080378f64fff88ce4c1cbdf4afd32943b63877831b221ca302652eabe106a93f9f4d1ed363f2f33c1e29716b95b8541d2f79ec8a7a1d821a46270a1bb5f32622a06655b85a31d7ee2f52dbf963fd4426a6047b0e2bc4896143076e8dbc7dd8a7448ba2a5233ec8d166b611c288134420559cc4a6f4eec2835336d4f71df0ac899e314365a321d1d774bdb9),
('15342e4cab0ee774acb3905838384982', @sShopId, 'theme:mobile', 'blShowBirthdayFields', 'bool', 0x07),
('1ec42a395d0595ee7741091898848424', @sShopId, 'theme:mobile', 'iNewBasketItemMessage', 'select', 0x07),
('1ec42a395d0595ee7741091898848982', @sShopId, 'theme:mobile', 'sDefaultListDisplayType', 'select', 0x83cd10b7f09064ed),
('1ec42a395d0595ee7741091898848922', @sShopId, 'theme:mobile', 'sStartPageListDisplayType', 'select', 0x83cd10b7f09064ed),
('1545423fe8ce213a0435345552230292', @sShopId, 'theme:mobile', 'aNrofCatArticles', 'arr', 0x4dba322c77e44ef7ced6aca1143e86a8198a16),
('1ec42a395d0595ee774109189884898a', @sShopId, 'theme:mobile', 'sCatPromotionsize', 'str', 0xb06fb441c2bd94);

# --------------------------------------------------------
INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`) VALUES
('1ec4235c2aee774aa45d772875435922', 'theme:mobile', 'sIconsize', 'images', '', 1),
('12642dfaa1dee77488b1b22948593022', 'theme:mobile', 'sThumbnailsize', 'images', '', 2),
('12642dfaa1dee77487d0644506753922', 'theme:mobile', 'aDetailImageSizes', 'images', '', 3),
('15342e4cab0ee774acb3905838384982', 'theme:mobile', 'blShowBirthdayFields', 'display', '', 5),
('1ec42a395d0595ee7741091898848424', 'theme:mobile', 'iNewBasketItemMessage', 'display', '0|1|3', 6),
('1545423fe8ce213a06.20230292', 'theme:mobile', 'aNrofCatArticles', 'display', '', 10),
('8563fba1bee774aec599d5689409498a', 'theme:mobile', 'sCatPromotionsize', 'images', '', 8);

