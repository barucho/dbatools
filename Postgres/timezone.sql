
/*

Timestamp vs Timestamptz
Timestamp will not keeo the tz 
*/


SHOW timezone;

CREATE TABLE tztest (t TIMESTAMP, ttz TIMESTAMPTZ);
INSERT INTO tztest (t, ttz)
VALUES
   (
      now(),
      now()
   );


SELECT
   t, ttz
FROM
   tztest;


delete from tztest;

INSERT INTO tztest (t, ttz)
VALUES
   (
      '2022-12-05 12:11:24-07',
      '2022-12-05 12:11:24-07'
   );

SELECT
   t, ttz
FROM
   tztest;