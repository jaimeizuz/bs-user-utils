set schema 'kogito';

select * from "FLYWAY_RUNTIME_SERVICE";

select process_id, process_instance_id, node_instance_id,
	 event_date, node_name, node_type, event_type
from process_instance_node_log
where process_instance_id = '8895227b-7877-4b4b-99e6-553eed8b62b2'
order by event_date;

select id, endpoint, last_update_time, process_id, version, start_time, state
from processes
where id = '54df1e19-0478-4a06-a9cc-272b832016a2';

select id, process_id, name, reference_name, started, state, completed, last_update
from tasks
where process_instance_id = '54df1e19-0478-4a06-a9cc-272b832016a2';

select id, event_date, name, event_type, state
from task_instance_state_log
where process_instance_id = '9c749a7a-f60e-4d81-88b7-ee866ea40a54'
order by event_date;

select j.id, j.expiration_time, j.last_update, j.process_id, j.execution_counter, n.name, n.type, j.status
from jobs j, nodes n
where n.process_instance_id = j.process_instance_id
	and j.node_instance_id = n.id
	and n.process_instance_id = '9c749a7a-f60e-4d81-88b7-ee866ea40a54';

select * from nodes;

select piel.event_date, piel.process_id, piel.process_instance_id, piel.error_message, 
	n.type, n.name
from process_instance_error_log piel, nodes n
where n.definition_id = piel.node_definition_id
	and piel.process_instance_id = '9c749a7a-f60e-4d81-88b7-ee866ea40a54'
order by event_date;



select * from job_service_management;
delete from job_service_management;