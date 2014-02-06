/* These was intended to be run in Oracle
*/

select 
    town_id, 
    town,   
    count(*)  AS parts, -- 'AS' sets one thing equal to another thing
    avg(pop90) AS pop90, -- take avg(pop90) and put it in a column named 'pop90'
    sum(area) AS area, 
    10000*(avg(pop90)/sum(area)) AS density
from jf.matown2000
    group by town_id, town 
    order by town;

-- results of the query

   TOWN_ID TOWN                       PARTS      POP90       AREA    DENSITY
---------- --------------------- ---------- ---------- ---------- ----------
        85 EAST LONGMEADOW                1      13367   33675444 3.96936118
        86 EASTHAM                       10       4462 37154979.2 1.20091576
        87 EASTHAMPTON                    1      15537   35234084 4.40965061
        88 EASTON                         1      19807   75713048 2.61606163
        89 EDGARTOWN                      5       3062 74423017.1 .411431856
        90 EGREMONT                       1       1229   48896216 .251348693
        91 ERVING                         1       1372   37206844 .368749362
        92 ESSEX                          8       3260   37689239  .86496838
        93 EVERETT                        2      35701 8925302.06 39.9997667


