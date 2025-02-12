
SELECT fast_bit_or(F0_0."prov_t1gb50g_a1") AS "prov_t1gb50g_a1"
FROM (
SELECT avg(F0_0."b") AS "AGGR_0", avg(F0_0."c") AS "AGGR_1", F0_0."a" AS "GROUP_0", (set_bits(F0_0."prov_t1gb50g_a1"))::bit(50) AS "prov_t1gb50g_a1"
FROM ((
SELECT F0_0."a" AS "a", F0_0."b" AS "b", F0_0."c" AS "c", F0_0."prov_t1gb50g_a1" AS "prov_t1gb50g_a1"
FROM (
SELECT F0_0."id" AS "id", F0_0."a" AS "a", F0_0."b" AS "b", F0_0."c" AS "c", F0_0."d" AS "d", F0_0."e" AS "e", F0_0."f" AS "f", F0_0."g" AS "g", F0_0."h" AS "h", F0_0."i" AS "i", F0_0."j" AS "j", F0_0."k" AS "k", binary_search_array_pos('{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51}', F0_0."a") - 1 AS "prov_t1gb50g_a1"
FROM "t1gb50g" F0_0) F0_0
WHERE (F0_0."b" < 10)) F0_0 JOIN "tjoinhelp" F1_0 ON ((F0_0."a" = F1_0."ttid")))
GROUP BY F0_0."a") F0_0
WHERE (F0_0."AGGR_1" < 10);


