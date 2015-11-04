-- clear user picture fid if no coorespondng file 

UPDATE users 
  SET picture = 0 
  WHERE uid IN (
    SELECT u.uid 
    FROM users u, file_managed fm 
    WHERE fm.uid = u.uid 
    AND u.picture = fm.fid
    AND uri NOT LIKE 'sites/default/files/pictures%'
);
