 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays unused space for each segment. 
--  Requirements  : Access to the   DBMS  _SPACE package. 
-- Call Syntax  : @unused_space (segment_owner) (segment_name) (segment_type) (p 
artition_name OR NA) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET VERIFY OFF 
  DECLARE   
  v_partition_name            VARCHAR2(30) := UPPER('&4'); 
  v_total_blocks              NUMBER; 
  v_total_bytes               NUMBER; 
  v_unused_blocks             NUMBER; 
  v_unused_bytes              NUMBER; 
  v_last_used_extent_file_id  NUMBER; 
  v_last_used_extent_block_id NUMBER; 
  v_last_used_block           NUMBER; 
BEGIN 
  IF v_partition_name != 'NA' THEN 
      DBMS  _SPACE.UNUSED_SPACE (segment_owner              => UPPER('&1'), 
                             segment_name               => UPPER('&2'), 
                             segment_type               => UPPER('&3'), 
                             total_blocks               => v_total_blocks, 
                             total_bytes                => v_total_bytes, 
                             unused_blocks              => v_unused_blocks, 
                             unused_bytes               => v_unused_bytes, 
                             last_used_extent_file_id   => v_last_used_extent_fi 
le_id, 
                             last_used_extent_block_id  => v_last_used_extent_bl 
ock_id, 
                             last_used_block            => v_last_used_block, 
                             partition_name             => v_partition_name); 
  ELSE 
      DBMS  _SPACE.UNUSED_SPACE (segment_owner              => UPPER('&1'), 
                             segment_name               => UPPER('&2'), 
                             segment_type               => UPPER('&3'), 
                             total_blocks               => v_total_blocks, 
                             total_bytes                => v_total_bytes, 
                             unused_blocks              => v_unused_blocks, 
                             unused_bytes               => v_unused_bytes, 
                             last_used_extent_file_id   => v_last_used_extent_fi 
le_id, 
                             last_used_extent_block_id  => v_last_used_extent_bl 
ock_id, 
                             last_used_block            => v_last_used_block); 
  END IF; 
 
    DBMS  _OUTPUT.PUT_LINE('v_total_blocks              :' || v_total_blocks); 
    DBMS  _OUTPUT.PUT_LINE('v_total_bytes               :' || v_total_bytes); 
    DBMS  _OUTPUT.PUT_LINE('v_unused_blocks             :' || v_unused_blocks); 
    DBMS  _OUTPUT.PUT_LINE('v_unused_bytes              :' || v_unused_bytes); 
    DBMS  _OUTPUT.PUT_LINE('v_last_used_extent_file_id  :' || v_last_used_extent_fil 
e_id); 
    DBMS  _OUTPUT.PUT_LINE('v_last_used_extent_block_id :' || v_last_used_extent_blo 
ck_id); 
    DBMS  _OUTPUT.PUT_LINE('v_last_used_block           :' || v_last_used_block); 
END; 
/ 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
