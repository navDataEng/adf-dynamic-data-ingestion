create proc sp_Audit_Table
  @src_database_name varchar (200),
  @src_schema_name varchar (200),
  @src_table_name varchar (200),
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
insert into my_db.dbo.Audit_Table values (@src_database_name, @src_schema_name, @src_table_name, @target_file_name  , @adf_name, @pipeline_name , @run_id , @trigger_type , @records_read, @records_writren, @execution_start_time, @execution_end_time, @copy_duration, @execution_status, @execution_error_message)
end;
