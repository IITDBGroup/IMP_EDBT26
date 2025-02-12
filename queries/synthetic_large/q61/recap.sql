
SELECT fast_bit_or(F0_0."prov_t1gbjoin_a1") AS "prov_t1gbjoin_a1"
FROM (
SELECT avg(F0_0."b") AS "AGGR_0", avg(F0_0."c") AS "AGGR_1", F0_0."a" AS "GROUP_0", (set_bits(F0_0."prov_t1gbjoin_a1"))::bit(50) AS "prov_t1gbjoin_a1"
FROM ((
SELECT F0_0."a" AS "a", F0_0."b" AS "b", F0_0."c" AS "c", F0_0."prov_t1gbjoin_a1" AS "prov_t1gbjoin_a1"
FROM (
SELECT F0_0."id" AS "id", F0_0."a" AS "a", F0_0."b" AS "b", F0_0."c" AS "c", F0_0."d" AS "d", F0_0."e" AS "e", F0_0."f" AS "f", F0_0."g" AS "g", F0_0."h" AS "h", F0_0."i" AS "i", F0_0."j" AS "j", F0_0."k" AS "k", binary_search_array_pos('{1,101,201,301,401,501,601,701,801,901,1001,1101,1201,1301,1401,1501,1601,1701,1801,1901,2001,2101,2201,2301,2401,2501,2601,2701,2801,2901,3001,3101,3201,3301,3401,3501,3601,3701,3801,3901,4001,4101,4201,4301,4401,4501,4601,4701,4801,4901,5001}', F0_0."a") - 1 AS "prov_t1gbjoin_a1"
FROM "t1gbjoin" F0_0) F0_0
WHERE (F0_0."b" < 1000)) F0_0 JOIN "tjoinhelp" F1_0 ON ((F0_0."a" = F1_0."ttid")))
GROUP BY F0_0."a") F0_0
WHERE (F0_0."AGGR_1" < 1000);


