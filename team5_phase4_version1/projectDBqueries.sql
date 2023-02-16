-- Total number of shoes ordered by each buyer who has placed more than 1 order
Select ph.buyerid, Sum(ph.quantity) as Total_no_of_shoes from fall22_s001_5_purchasehistory ph join
(
	Select op.buyerid from fall22_s001_5_orderplaced op group by op.buyerid having Count(op.orderid) > 1
) B
on B.buyerid = ph.buyerid
Group by ph.buyerid;

-- Details of shoes and its highest rating and corresponding comment 
Select S.sku, S.modelname, B.max_rating, B.reviewcomment from fall22_s001_5_shoes S join
	(
		Select R.sku, Max(R.rating) as max_rating, R.reviewcomment from fall22_s001_5_reviews R 
		group by R.sku 
		having MAX(R.rating)
	) B
	on B.sku = S.sku;
    
-- Name of the city and zipcode where the number of orders are more than 1
Select A.city, A.zipcode from fall22_s001_5_useraddress A where A.userid in
	(
		Select P.buyerid from fall22_s001_5_orderplaced P where P.orderid in
			(
				Select O.orderid from fall22_s001_5_orders O
			)
	)
group by A.city, A.zipcode
having COUNT(A.city) > 1;

-- Finding the shoe details along with total amount spent using rollup
Select s.color, s.modelname, sum(s.price) as total_price from fall22_s001_5_shoes s where s.sku in
(
Select p.sku from fall22_s001_5_purchasehistory p
)
group by rollup (s.color, s.modelname) 
order by s.color, s.modelname;

-- Finding the respective sum of the total amount listed based on the reviews of different sellers
Select l.sellerid, l.sku, sum(l.listingprice) from fall22_s001_5_listing l where l.sku in
(
Select r.sku from fall22_s001_5_reviews r
)
group by rollup (l.sellerid, l.sku) 
order by l.sellerid, l.sku;

-- Listing the buyers and their corresponding quantity of shows in descending order by skipping the highest and fetching the 2nd and 3rd highest
Select PH.buyerid, PH.quantity
FROM fall22_s001_5_purchasehistory PH JOIN
	(Select DISTINCT(OP.buyerid) from fall22_s001_5_orderplaced OP
	GROUP BY OP.buyerid) B
ON B.buyerid = PH.buyerid
ORDER BY PH.quantity DESC
OFFSET 1 ROWS
FETCH NEXT 2 ROWS ONLY;

-- Details of shoe and the seller id who has listed, and currently in stock with quantity more than 1
Select sh.sku, sh.modelname, (Select DISTINCT(l.sellerid) from fall22_s001_5_listing l where l.sku = sh.sku ) as seller_id from fall22_s001_5_shoes sh where sh.sku in 
(
	Select s.stocksku from fall22_s001_5_stockavailability s where s.quantity > 1
);

-- Finding the total amount of quantity of shoes purchased by a buyer based on the buyerid
Select p.sku, p.buyerid, p.purchasedate, sum(p.quantity) OVER (partition by p.buyerid) as total_quantity from fall22_s001_5_purchasehistory p join
(
	Select s.stocksku from fall22_s001_5_stockavailability s 
) b
on b.stocksku = p.sku;

-- Details of users who have placed an order and have their foot size more than 10
SELECT U.userid, U.fname, U.mname, U.lname, U.footsize, P.total_number_of_orders 
FROM fall22_s001_5_user U  JOIN 
	(SELECT O.buyerid, COUNT(O.orderid) AS total_number_of_orders 
	FROM fall22_s001_5_orderplaced O 
	GROUP BY O.buyerid) P
ON P.buyerid = U.userid 
GROUP BY U.userid, U.fname, U.mname, U.lname, U.footsize, P.total_number_of_orders 
HAVING U.footsize > 10
ORDER BY P.total_number_of_orders DESC;
