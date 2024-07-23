select * from cars

create table backup_cars(
	brand varchar,
	model varchar,
	fuel_type varchar,
	engine_torque int,
	drive_train varchar,
	top_speed int
	
)

select * from backup_cars

-- create Trigger function (when we delete data from "cars" table they automatically stored in the "backup_cars" table)

create or replace function backup_data()
returns trigger as $$
BEGIN
	insert into backup_cars 
	values (old.brand,old.model,old.fuel_type,old.engine_torque,old.drive_train,old.top_speed);   
return old;
END;
$$ LANGUAGE plpgsql;


-- create trigger function :
create trigger trigger_backup_data
before delete on cars
for each row
execute function backup_data()

select * from cars
select * from backup_cars
delete from cars where sr_no = 3
