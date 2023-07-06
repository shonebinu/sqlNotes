--1
SELECT * FROM cd.facilities; -- since the table's are not in the public scheme, we have to use cd.table_name, since tables are in the 'cd' schema

--2
SELECT name, membercost FROM cd.facilities;

--3
SELECT * FROM cd.facilities
WHERE membercost > 0;

--4
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost < monthlymaintenance/50 AND membercost > 0;

--5
SELECT * FROM cd.facilities 
WHERE name LIKE '%Tennis%';

--6
SELECT * FROM cd.facilities
WHERE facid IN (1, 5);

--7
SELECT memid, surname, firstname, joindate FROM cd.members
WHERE joindate >='2012-09-01';

--8
SELECT DISTINCT surname FROM cd.members
ORDER BY surname 
LIMIT 10;

--9
SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;
-- or
SELECT MAX(joindate)
FROM cd.members;

--10
SELECT COUNT(*) FROM cd.facilities 
WHERE guestcost >= 10;

--11
SELECT facid, SUM(slots) AS "Total Slots" FROM cd.bookings
WHERE TRIM(TO_CHAR(starttime, 'Month')) = 'September'
GROUP BY facid
ORDER BY SUM(slots);

--12
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000 -- can't use WHERE
ORDER BY facid;

--13
SELECT starttime AS start, name FROM cd.bookings 
INNER JOIN cd.facilities
ON cd.bookings.facid = cd.facilities.facid
WHERE name LIKE 'Tennis Court%' AND DATE(starttime)='2012-09-21';

--14
SELECT * FROM cd.members WHERE (firstname || ' ' || surname) = 'David Farrell';
SELECT * FROM cd.bookings;

--15
SELECT starttime FROM cd.members 
INNER JOIN cd.bookings
ON cd.members.memid = cd.bookings.memid
WHERE (firstname || ' ' || surname) = 'David Farrell';
-- or
SELECT starttime FROM cd.bookings
WHERE memid = 
(SELECT memid FROM cd.members
WHERE (firstname || ' ' || surname) = 'David Farrell');
