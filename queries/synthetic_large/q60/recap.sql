
SELECT fast_bit_or(F0_0."prov_t1gbjoin_a1") AS "prov_t1gbjoin_a1"
FROM (
SELECT avg(F0_0."b") AS "AGGR_0", avg(F0_0."c") AS "AGGR_1", F0_0."a" AS "GROUP_0", (set_bits(F0_0."prov_t1gbjoin_a1"))::bit(10) AS "prov_t1gbjoin_a1"
FROM ((
SELECT F0_0."a" AS "a", F0_0."b" AS "b", F0_0."c" AS "c", F0_0."prov_t1gbjoin_a1" AS "prov_t1gbjoin_a1"
FROM (
SELECT F0_0."id" AS "id", F0_0."a" AS "a", F0_0."b" AS "b", F0_0."c" AS "c", F0_0."d" AS "d", F0_0."e" AS "e", F0_0."f" AS "f", F0_0."g" AS "g", F0_0."h" AS "h", F0_0."i" AS "i", F0_0."j" AS "j", F0_0."k" AS "k", binary_search_array_pos('{1,501,1001,1501,2001,2501,3001,3501,4001,4501,5001}', F0_0."a") - 1 AS "prov_t1gbjoin_a1"
FROM "t1gbjoin" F0_0) F0_0
WHERE (F0_0."b" < 1000)) F0_0 JOIN "tjoinhelp" F1_0 ON ((F0_0."a" = F1_0."ttid")))
GROUP BY F0_0."a") F0_0
WHERE (F0_0."AGGR_1" < 1000);


