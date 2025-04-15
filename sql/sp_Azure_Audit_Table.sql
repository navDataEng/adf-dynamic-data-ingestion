create proc sp_Azure_Audit_Table
@source_system varchar(200),
@source_container varchar (200),
@source_folder varchar (200),
@target_container varchar (200),
@target_folder varchar (200),
@source_file_name varchar (200), 
@target_file_name varchar (200), 
@adf_name varchar (200),
@pipeline_name varchar(200), 
@run_id varchar (200),
@trigger_type varchar (200), 
@records_read int,
@records_writren int,
@execution_start_time datetime,
@execution_end_time datetime,
@copy_duration int,
@execution_status varchar (200),
@execution_error_message varchar(4000)
as
begin
insert into my_db.dbo.Azure_Audit_Table values (@source_system,@source_container,@source_folder,@target_container,@target_folder,@source_file_name,@target_file_name,@adf_name,@pipeline_name,@run_id,@trigger_type,@records_read,@records_writren,@execution_start_time,@execution_end_time,@copy_duration,@execution_status,@execution_error_message)
end;
