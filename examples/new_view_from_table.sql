/* These was intended to be run in Oracle
*/

create view v_madensity as 
    select 
        town_id, 
        town, 
        count(*) as parts, 
        avg(pop90) as pop90, 
        sum(area) as area, 
        10000*(avg(pop90)/sum(area)) as density
    from matown2000
        group by town_id, town
        order by town;
