create table src_control_table (
	entry_id numeric identity(1,1),
	source_system varchar(30),
	database_name varchar(30),
	schema_name varchar(30),
	table_name varchar(30),
	source_container varchar(30),
	source_folder varchar(30),
	target_container varchar(30),
	target_folder varchar(30),
	active_indicator numeric,
	created_at datetime
);
