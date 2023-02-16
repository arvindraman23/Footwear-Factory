Insert into fall22_s001_5_orderplaced Values(1014, 2027);
Update fall22_s001_5_orderplaced set buyerid = 1010 where orderid = 2021;
DELETE FROM fall22_s001_5_orderplaced where orderid = 2027;

Insert into fall22_s001_5_reviews Values(128, 9, 'Best shoes by Nike.', 'AA123', 1010, 'AA123');
Update fall22_s001_5_reviews set rating = 8 where reviewid = 128;
DELETE FROM fall22_s001_5_reviews where reviewid = 123;

Insert into Fall22_S001_5_userAddress Values(1015, 2122, 'Lansing', 'Michigan', 'Home', '212 South St', 48933);
Update fall22_s001_5_useraddress set userid = 1015 where city = 'Frisco';
DELETE FROM fall22_s001_5_useraddress where userid = 1015;

Insert into Fall22_S001_5_shoes Values('AA142', 'black/white', 2022, 105.0, 'Nike Blazer High');
Update fall22_s001_5_shoes set color = 'black' where sku = 'AA142';
DELETE FROM fall22_s001_5_shoes where sku = 'AA142';

Insert into fall22_s001_5_purchasehistory Values('AA131', 1014, '2022-01-12', 1);
Update fall22_s001_5_purchasehistory set quantity = 2 where buyerid = 114;
DELETE FROM fall22_s001_5_purchasehistory where buyerid = 1014;

Insert into fall22_s001_5_stockavailability Values('XY111', 12, 4);
Insert into fall22_s001_5_listing Values(1011, 'XY111', 135.0);
Insert into Fall22_S001_5_shoes Values('XY111', 'white', 2022, 135.0, 'Nike Blazer Mid');
Update fall22_s001_5_stockavailability set quantity = 1 where stocksku = 'AA123';
DELETE FROM fall22_s001_5_stockavailability where stocksku = 'XY111';

Insert into fall22_s001_5_purchasehistory Values('AA124', 1010, '2022-01-12', 1);
Update fall22_s001_5_purchasehistory set quantity = 2 where buyerid = 1010;
DELETE FROM fall22_s001_5_purchasehistory where buyerid = 1010;
