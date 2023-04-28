CREATE DEFINER=`scott`@`%` PROCEDURE `getQtySum`(
	in base int)
BEGIN
	select pno, sum(qty) as tot_qty,
		case
			when (sum(qty) > base) then 'good_qty'
            when (sum(qty) = base) then 'usual_qty'
			when (sum(qty) < base)then 'bad_qty'
            else 'poor_qty'
		end as 'part_level'
	from spj
group by pno;

END