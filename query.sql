-- based on last id
SELECT m.id as id_murid, m.name, 
p.status as pendidikan_terakhir, 
DATE_FORMAT(m.time_create, "%Y-%m-%d %H:%i:%s") as time_create, 
DATE_FORMAT(p.time_create, "%Y-%m-%d %H:%i:%s") as time_update
FROM murid as m
left join (
	select id, id_murid, MAX(id) as last_education, time_create 
	from pendidikan
	group by id_murid
) as le on le.id_murid = m.id
left join pendidikan as p on p.id = le.last_education;


-- based on timestamp
SELECT m.id as id_murid, m.name, 
p.status as pendidikan_terakhir, 
DATE_FORMAT(m.time_create, "%Y-%m-%d %H:%i:%s") as time_create, 
DATE_FORMAT(p.time_create, "%Y-%m-%d %H:%i:%s") as time_update
FROM murid as m
join pendidikan as p on p.id_murid = m.id
join (
	select MAX(time_create) as created_time, id_murid 
	from pendidikan
	group by id_murid 
) as sub on sub.id_murid = p.id_murid and sub.created_time = p.time_create