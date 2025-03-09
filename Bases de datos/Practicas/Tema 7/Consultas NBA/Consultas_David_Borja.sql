-- 1
SELECT DISTINCT nombre FROM jugadores
LIMIT 10;
+-----------------+
| nombre          |
+-----------------+
| Corey Brever    |
| Greg Buckner    |
| Michael Doleac  |
| Randy Foye      |
| Ryan Gomes      |
| Marko Jaric     |
| Al Jefferson    |
| Mark Madsen     |
| Rashard McCants |
| Chris Richard   |
+-----------------+
10 rows in set (0.00 sec)
-- 2
SELECT nombre,equipo,altura FROM jugadores
WHERE procedencia="serbia"
ORDER BY equipo,altura;
+-----------------+--------+--------+
| nombre          | equipo | altura |
+-----------------+--------+--------+
| Dwayne Jones    |      7 |    210 |
| Marko Jaric     |     19 |    200 |
| Peja Stojakovic |     26 |    208 |
+-----------------+--------+--------+
3 rows in set (0.00 sec) 
-- 3
SELECT nombre,equipo,posicion FROM jugadores
WHERE salario>100000
ORDER BY equipo,posicion DESC;
+------------------+--------+----------+
| nombre           | equipo | posicion |
+------------------+--------+----------+
| Marcin Gortat    |      1 | F-C      |
| Louis Amundson   |      3 | F        |
| Calvin Booth     |      3 | C        |
| Darrel Armstrong |      4 | G        |
| Maurice Ager     |      4 | F-G      |
| Jerome James     |      5 | C        |
| LeBron James     |      7 | F        |
| Marquis Daniels  |      8 | G        |
| Charlie Bell     |     10 | G        |
| Carlos Arroyo    |     11 | G        |
| Brendan Haywood  |     12 | C        |
| Kevin Durant     |     20 | G        |
| Kobe Bryant      |     21 | G        |
| Luke Walton      |     21 | F        |
| Andrew Bynum     |     21 | C        |
| Shaquille ONeal  |     22 | C        |
| Monta Ellis      |     23 | G        |
| Al Harrington    |     23 | F-C      |
| Quinton Ross     |     25 | G-F      |
| Dan Dickau       |     25 | G        |
| Brent Barry      |     27 | G        |
| Rafer ALston     |     28 | G        |
| Andre Brown      |     30 | F        |
+------------------+--------+----------+
23 rows in set (0.00 sec)
-- 4
SELECT nombre,salario,salario-(salario*0.18) AS Salario_neto FROM jugadores 
LIMIT 10;
+-----------------+---------+--------------+
| nombre          | salario | Salario_neto |
+-----------------+---------+--------------+
| Corey Brever    |   10000 |         8200 |
| Greg Buckner    |    9000 |         7380 |
| Michael Doleac  |   11000 |         9020 |
| Randy Foye      |   12000 |         9840 |
| Ryan Gomes      |    8000 |         6560 |
| Marko Jaric     |    8500 |         6970 |
| Al Jefferson    |    9000 |         7380 |
| Mark Madsen     |    9500 |         7790 |
| Rashard McCants |    9000 |         7380 |
| Chris Richard   |    8000 |         6560 |
+-----------------+---------+--------------+
10 rows in set (0.00 sec)
-- 5
SELECT CONCAT(nombre," su procedencia es ",procedencia) FROM jugadores
WHERE peso BETWEEN 80 AND 95
LIMIT 10;
+---------------------------------------------------+
| CONCAT(nombre," su procedencia es ",procedencia)  |
+---------------------------------------------------+
| Corey Brever su procedencia es Florida            |
| Greg Buckner su procedencia es Clemson            |
| Rashard McCants su procedencia es North Carolina  |
| Dan Dickau su procedencia es Gonzaga              |
| Shaun Livingston su procedencia es Peoria Central |
| Smush Parker su procedencia es Fordham            |
| Quinton Ross su procedencia es Southern Methodist |
| Mike Conley su procedencia es Ohio State          |
| Javaris Crittenton su procedencia es Georgia Tech |
| Kyle Lowry su procedencia es Villanova            |
+---------------------------------------------------+
10 rows in set (0.00 sec)
-- 6
SELECT * FROM jugadores
WHERE equipo NOT IN (3,4,5,10) AND posicion="F"
LIMIT 10;
+--------+--------------------+------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre             | procedencia      | altura | peso | posicion | equipo | capitan | salario |
+--------+--------------------+------------------+--------+------+----------+--------+---------+---------+
|    244 | Glen Davis         | Louisiana State  |    205 |  114 | F        |      1 |     240 |   60000 |
|    245 | Kevin Garnett      | Farragut Academy |    210 |   99 | F        |      1 |     240 |   80000 |
|    248 | Paul Pierce        | Kansas           |    200 |  104 | F        |      1 |     240 |   80000 |
|    250 | James Posey        | Xavier           |    203 |   98 | F        |      1 |     240 |   80000 |
|    251 | Leon Powe          | California       |    203 |  108 | F        |      1 |     240 |   90000 |
|     88 | Jorge Garbajosa    | Spain            |    205 |  110 | F        |      2 |      82 |   42000 |
|     89 | Joey Graham        | Oklahoma State   |    200 |   98 | F        |      2 |      82 |   35000 |
|     90 | Kris Humphries     | Minnesota        |    205 |  105 | F        |      2 |      82 |   40000 |
|     91 | Linton Johnson III | Tulane           |    203 |  105 | F        |      2 |      82 |   30000 |
|     92 | Jason Kapono       | UCLA             |    203 |  110 | F        |      2 |      82 |   45000 |
+--------+--------------------+------------------+--------+------+----------+--------+---------+---------+
10 rows in set (0.00 sec)
-- 7
SELECT * FROM equipos 
WHERE conferencia NOT IN ("East","West");
Empty set (0.00 sec)
-- 8
SELECT * FROM equipos 
WHERE id_equipo IN (SELECT equipo_local FROM partidos 
WHERE puntos_local>puntos_visitante AND temporada IN ("98/99","99/00") AND arbitro=13);
+-----------+---------------+--------------+-------------+-----------+----------------------+-----------+--------+------+------+
| id_equipo | nombre        | ciudad       | conferencia | division  | pabellon             | capacidad | puntos | pp   | pg   |
+-----------+---------------+--------------+-------------+-----------+----------------------+-----------+--------+------+------+
|         1 | Celtics       | Boston       | East        | Atlantic  | TD Garden            |        19 |     39 |   16 |   39 |
|         3 | 76ers         | Philadelphia | East        | Atlantic  | Wells Fargo center   |     20007 |     20 |   34 |   20 |
|         4 | Nets          | Brooklyn     | East        | Atlantic  | Barclays Center      |     17732 |     20 |   34 |   20 |
|         6 | Pistons       | Detroit      | East        | Central   | Little Caesars Arena |     20332 |     29 |   26 |   29 |
|        10 | Bucks         | Milwaukee    | East        | Central   | Fiserv Forum         |     17341 |     29 |   24 |   29 |
|        13 | Hawks         | Atlanta      | East        | SouthEast | State Farm Arena     |     17044 |     26 |   29 |   26 |
|        15 | Heat          | Miami        | East        | SouthEast | Kaseya Center        |     19600 |     25 |   28 |   25 |
|        17 | Nuggets       | Denver       | West        | NorthWest | Ball Arena           |     19250 |     36 |   19 |   36 |
|        18 | Trail Blazers | Portland     | West        | NorthWest | Moda Center          |     19411 |     23 |   32 |   23 |
|        20 | Supersonics   | Seattle      | West        | NorthWest | Seattle Center       |     19000 |     11 |   30 |   11 |
|        21 | Lakers        | Los Angeles  | West        | Pacific   | Crypto.com Arena     |     18997 |     32 |   20 |   32 |
|        25 | Clippers      | Los Angeles  | West        | Pacific   | Intuit Dome          |     18000 |     31 |   23 |   31 |
+-----------+---------------+--------------+-------------+-----------+----------------------+-----------+--------+------+------+
12 rows in set (0.00 sec)
-- 9
SELECT * FROM jugadores
WHERE nombre LIKE 'R%' AND procedencia = "Slovenia";
+--------+------------------+-------------+--------+------+----------+--------+---------+---------+
| codigo | nombre           | procedencia | altura | peso | posicion | equipo | capitan | salario |
+--------+------------------+-------------+--------+------+----------+--------+---------+---------+
|     94 | Rasho Nesterovic | Slovenia    |    213 |  115 | C        |      2 |      82 |   60000 |
+--------+------------------+-------------+--------+------+----------+--------+---------+---------+
1 row in set (0.00 sec)
-- 10
SELECT * FROM jugadores
WHERE LENGTH(nombre) > 10
LIMIT 10;
+--------+-----------------+----------------+--------+------+----------+--------+---------+---------+
| codigo | nombre          | procedencia    | altura | peso | posicion | equipo | capitan | salario |
+--------+-----------------+----------------+--------+------+----------+--------+---------+---------+
|      1 | Corey Brever    | Florida        |    205 |   83 | F-G      |     19 |    NULL |   10000 |
|      2 | Greg Buckner    | Clemson        |    193 |   95 | G-F      |     19 |       1 |    9000 |
|      3 | Michael Doleac  | Utah           |    210 |  118 | C        |     19 |       1 |   11000 |
|      6 | Marko Jaric     | Serbia         |    200 |  113 | G        |     19 |       1 |    8500 |
|      7 | Al Jefferson    | Prentiss Hs    |    208 |  120 | C-F      |     19 |       1 |    9000 |
|      8 | Mark Madsen     | Stanford       |    205 |  113 | C-F      |     19 |       1 |    9500 |
|      9 | Rashard McCants | North Carolina |    193 |   95 | G        |     19 |       1 |    9000 |
|     10 | Chris Richard   | Florida        |    205 |  122 | F        |     19 |       1 |    8000 |
|     11 | Craig Smith     | Boston College |    203 |  113 | F-C      |     19 |       1 |    9000 |
|     12 | Kirk Snyder     | Nevada-Reno    |    198 |  102 | G        |     19 |       1 |    8000 |
+--------+-----------------+----------------+--------+------+----------+--------+---------+---------+
10 rows in set (0.00 sec)
-- 11
SELECT nombre FROM jugadores
WHERE posicion="C" AND salario > 100000;
+-----------------+
| nombre          |
+-----------------+
| Andrew Bynum    |
| Jerome James    |
| Calvin Booth    |
| Brendan Haywood |
| Shaquille ONeal |
+-----------------+
5 rows in set (0.00 sec)
-- 12
SELECT nombre FROM jugadores 
WHERE equipo IN (1,2) AND posicion="G";
+----------------+
| nombre         |
+----------------+
| Ray Allen      |
| Tony Allen     |
| Sam Cassell    |
| Eddie House    |
| Gabe Pruitt    |
| Rajon Rondo    |
| Jose Calderon  |
| Carlos Delfino |
| T.J. Ford      |
+----------------+
9 rows in set (0.00 sec)
-- 13
SELECT * FROM jugadores 
WHERE equipo IN (3)
ORDER BY salario;
+--------+------------------+-------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre           | procedencia       | altura | peso | posicion | equipo | capitan | salario |
+--------+------------------+-------------------+--------+------+----------+--------+---------+---------+
|    122 | Rodney Carney    | Memphis           |    200 |  204 | F        |      3 |     120 |   12000 |
|    125 | Willie Green     | Detroit Mercy     |    190 |  100 | G        |      3 |     120 |   12000 |
|    131 | Jason Smith      | Colorado Sate     |    213 |  110 | F        |      3 |     120 |   12000 |
|    132 | Louis Williams   | South Gwinnett HS |    187 |   85 | G        |      3 |     120 |   12000 |
|    123 | Samuel Dalembert | Seton Hall        |    210 |  110 | C        |      3 |     120 |   22000 |
|    129 | Kevin Ollie      | Connecticut       |    187 |   82 | G        |      3 |     120 |   22000 |
|    133 | Thaddeus Young   | Georgio Tech      |    203 |  101 | F        |      3 |     120 |   22000 |
|    124 | Reggie Evans     | Iowa              |    203 |  108 | F        |      3 |     120 |   32000 |
|    126 | Herbert Hill     | Providence        |    208 |  110 | F-C      |      3 |     120 |   42000 |
|    130 | Shavlik Randolph | Duke              |    208 |  109 | F        |      3 |     120 |   42000 |
|    127 | Andre Iguodala   | Arizona           |    198 |   93 | F-G      |      3 |     120 |   52000 |
|    128 | Andre Miller     | Utah              |    187 |  289 | G        |      3 |     120 |   72000 |
|    120 | Louis Amundson   |  Nevada-Las Vegas |    203 |  105 | F        |      3 |    NULL |  115000 |
|    121 | Calvin Booth     | Penn State        |    210 |  113 | C        |      3 |     120 |  120000 |
+--------+------------------+-------------------+--------+------+----------+--------+---------+---------+
14 rows in set (0.00 sec)
-- 14
SELECT * FROM jugadores
WHERE altura > 200 AND salario < 70000
LIMIT 10;
+--------+----------------+------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre         | procedencia      | altura | peso | posicion | equipo | capitan | salario |
+--------+----------------+------------------+--------+------+----------+--------+---------+---------+
|      1 | Corey Brever   | Florida          |    205 |   83 | F-G      |     19 |    NULL |   10000 |
|      3 | Michael Doleac | Utah             |    210 |  118 | C        |     19 |       1 |   11000 |
|      7 | Al Jefferson   | Prentiss Hs      |    208 |  120 | C-F      |     19 |       1 |    9000 |
|      8 | Mark Madsen    | Stanford         |    205 |  113 | C-F      |     19 |       1 |    9500 |
|     10 | Chris Richard  | Florida          |    205 |  122 | F        |     19 |       1 |    8000 |
|     11 | Craig Smith    | Boston College   |    203 |  113 | F-C      |     19 |       1 |    9000 |
|     14 | Antoine Walker | Kentucky         |    205 |  111 | F        |     19 |       1 |    8500 |
|     21 | Elton Brand    | Duke             |    203 |  115 | F        |     25 |      23 |   10000 |
|     22 | Paul Davis     | Michigan         |    210 |  122 | C        |     25 |      23 |   10000 |
|     25 | Chris Kaman    | Central Michigan |    213 |  120 | C        |     25 |      23 |   10000 |
+--------+----------------+------------------+--------+------+----------+--------+---------+---------+
10 rows in set (0.00 sec)
-- 15 
SELECT nombre FROM jugadores 
WHERE capitan IS NULL;
+---------------------+
| nombre              |
+---------------------+
| Corey Brever        |
| Dan Dickau          |
| Andre Brown         |
| Kobe Bryant         |
| Maceo Baston        |
| Jerome James        |
| Louis Amundson      |
| LeBron James        |
| Derek Anderson      |
| Charlie Bell        |
| Shannon Brown       |
| Ray Allen           |
| Mike Bibby          |
| Blake Ahearn        |
| Shareef Abdur-Rahim |
| Chris Andersen      |
| Rafer ALston        |
| Brent Barry         |
| LaMarcus Aldridge   |
| Gilbert Arenas      |
| Carlos Arroyo       |
| Malik Allen         |
| Maurice Ager        |
| Carmelo Anthony     |
| Morris Almond       |
| Marquis Daniels     |
| Arron Afflalo       |
| Kevin Durant        |
| Grant Hill          |
| Kelenna Azubuike    |
+---------------------+
30 rows in set (0,01 sec)
-- 16
SELECT COUNT(codigo) FROM jugadores
WHERE altura > 200;
+---------------+
| COUNT(codigo) |
+---------------+
|           224 |
+---------------+
1 row in set (0,01 sec)
-- 17 
SELECT AVG(salario) FROM jugadores;
+-------------------+
| AVG(salario)      |
+-------------------+
| 69952.94965277778 |
+-------------------+
1 row in set (0,00 sec)
-- 18 
SELECT MAX(salario),MIN(Salario),(MAX(salario)-MIN(Salario)) AS Diferencia FROM jugadores;
+--------------+--------------+------------+
| MAX(salario) | MIN(Salario) | Diferencia |
+--------------+--------------+------------+
|       950000 |         1000 |     949000 |
+--------------+--------------+------------+
1 row in set (0,00 sec)
-- 19
SELECT * FROM jugadores
WHERE altura IN (SELECT MAX(altura) FROM jugadores);
+--------+------------------+-------------+--------+------+----------+--------+---------+---------+
| codigo | nombre           | procedencia | altura | peso | posicion | equipo | capitan | salario |
+--------+------------------+-------------+--------+------+----------+--------+---------+---------+
|    350 | Dikembre Mutombo | Georgetown  |    225 |  125 | C        |     28 |     340 |   80000 |
+--------+------------------+-------------+--------+------+----------+--------+---------+---------+
1 row in set (0,00 sec)
-- 20
SELECT * FROM jugadores
WHERE salario > (SELECT salario FROM jugadores WHERE nombre = 'Devin Brown');
+--------+---------------------+----------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre              | procedencia          | altura | peso | posicion | equipo | capitan | salario |
+--------+---------------------+----------------------+--------+------+----------+--------+---------+---------+
|     23 | Dan Dickau          | Gonzaga              |    182 |   81 | G        |     25 |    NULL |  120000 |
|     24 | Nick Fazekas        | Nevada-Reno          |    210 |  106 | F        |     25 |      23 |   95000 |
|     32 | Quinton Ross        | Southern Methodist   |    198 |   87 | G-F      |     25 |      23 |  120000 |
|     41 | Andre Brown         | De Paul              |    205 |  115 | F        |     30 |    NULL |  180000 |
|     62 | Kobe Bryant         | Lower Merion HS (PA) |    198 |  103 | G        |     21 |    NULL |  180000 |
|     63 | Andrew Bynum        | St. Joseph HS (NJ)   |    213 |  110 | C        |     21 |      62 |  190000 |
|     65 | Derek Fisher        | Arkansas-Little Rock |    185 |   97 | G        |     21 |      62 |   90000 |
|     75 | Luke Walton         | Arizona              |    203 |  110 | F        |     21 |      62 |  150000 |
|    105 | Jerome James        | Florida AM           |    215 |   95 | C        |      5 |    NULL |  180000 |
|    110 | Randolph Morris     | Kentucky             |    210 |  110 | C        |      5 |     105 |   95000 |
|    120 | Louis Amundson      |  Nevada-Las Vegas    |    203 |  105 | F        |      3 |    NULL |  115000 |
|    121 | Calvin Booth        | Penn State           |    210 |  113 | C        |      3 |     120 |  120000 |
|    150 | Lance Allred        | Weber State          |    210 |  115 | C        |      7 |     154 |   90000 |
|    153 | Zydrunas Ilgauskas  | St. Vincent-St. Mary |    220 |  117 | C        |      7 |     154 |   90000 |
|    154 | LeBron James        | Houston              |    203 |  113 | F        |      7 |    NULL |  200000 |
|    156 | Dwayne Jones        | Serbia               |    210 |  113 | C-F      |      7 |     154 |   90000 |
|    157 | Aleksandar Pavlovic | Maryland             |    200 |  108 | G-F      |      7 |     154 |   88000 |
|    158 | Joe Smith           | Michigan State       |    208 |  106 | F-C      |      7 |     154 |   90000 |
|    159 | Eric Snow           | Miami                |    190 |   92 | G        |      7 |     154 |   90000 |
|    160 | Wally Szczerbiak    | Brazil               |    200 |  111 | F        |      7 |     154 |   95000 |
|    162 | Ben Wallace         | Virginia Union       |    205 |  108 | C-F      |      7 |     154 |   90000 |
|    181 | Derek Anderson      | Kentucky             |    195 |   88 | G        |     14 |    NULL |  100000 |
|    201 | Charlie Bell        | Michigan State       |    190 |   99 | G        |     10 |    NULL |  114000 |
|    220 | Shannon Brown       | Michigan State       |    193 |   97 | G        |      9 |    NULL |  100000 |
|    222 | Luol Deng           | Duke                 |    205 |  105 | F        |      9 |     220 |   90000 |
|    229 | Demetris Nichols    | Syracuse             |    203 |  101 | F        |      9 |     220 |   85000 |
|    230 | Joakin Noah         | Florida              |    210 |  110 | C-F      |      9 |     220 |   84000 |
|    240 | Ray Allen           | Connecticut          |    195 |  101 | G        |      1 |    NULL |  100000 |
|    251 | Leon Powe           | California           |    203 |  108 | F        |      1 |     240 |   90000 |
|    261 | Mike Bibby          | Arizona              |    185 |  190 | G        |     13 |    NULL |   90000 |
|    300 | Shareef Abdur-Rahim |  California          |    203 |  111 | F        |     24 |    NULL |  100000 |
|    307 | Brad Miller         | Purdue               |    213 |  118 | C        |     24 |     300 |   85000 |
|    310 | Keny Thomas         | New Mexico           |    200 |  111 | F        |     24 |     300 |   85000 |
|    322 | Ryan Bowen          | Iowa                 |    208 |   99 | F        |     26 |     320 |   90000 |
|    340 | Rafer ALston        | Fresno State         |    187 |  175 | G        |     28 |    NULL |  111000 |
|    341 | Shane Battier       | Duke                 |    203 |  220 | F        |     28 |     340 |   90000 |
|    342 | Aaron Brooks        | Oregon               |    182 |  161 | G        |     28 |     340 |   90000 |
|    346 | Luther Head         | Illinois             |    190 |  185 | G        |     28 |     340 |   90000 |
|    349 | Tracy McGrady       | Mount Zion Christian |    203 |  223 | G        |     28 |     340 |   90000 |
|    352 | Luis Scola          | Argentina            |    205 |  111 | F-C      |     28 |     340 |   90000 |
|    353 | Loren Woods         | Arizona              |    224 |  140 | C        |     28 |     340 |   90000 |
|    354 | Yao Ming            | China                |    224 |  110 | C        |     28 |     340 |   90000 |
|    361 | Brent Barry         | Oregon State         |    200 |   95 | G        |     27 |    NULL |  950000 |
|    363 | Bruce Bowen         | Cal State Fullerton  |    200 |  200 | F        |     27 |     361 |   90000 |
|    364 | Tim Duncan          | Wake Forest          |    210 |  260 | F-C      |     27 |     361 |   97000 |
|    381 | LaMarcus Aldridge   | Texas                |    210 |  111 | F-C      |     18 |    NULL |   90000 |
|    388 | Darius Miles        | East St.Louis        |    205 |  222 | F        |     18 |     381 |   85000 |
|    393 | Brandon Roy         | Washington           |    198 |  229 | G-F      |     18 |     381 |   85000 |
|    400 | Gilbert Arenas      | Arizona              |    193 |   97 | G        |     12 |    NULL |  100000 |
|    401 | Andray Blatche      | South Kent Prep      |    210 |  248 | F        |     12 |    4000 |   85000 |
|    402 | Caron Butler        | Connecticut          |    200 |  103 | F        |     12 |     400 |   85000 |
|    403 | Antonio Daniels     | Bowling Green        |    193 |  205 | G        |     12 |     400 |   95000 |
|    404 | Brendan Haywood     | North Carolina       |    213 |  263 | C        |     12 |     400 |  105000 |
|    405 | Antawn Jamison      | North Carolina       |    205 |  106 | F        |     12 |     400 |   85000 |
|    409 | Darius Songaila     | Wake Forest          |    205 |  248 | F        |     12 |     400 |   85000 |
|    410 | DeShawn Stevenson   | Washington Union HS  |    195 |   99 | G        |     12 |     400 |   85000 |
|    411 | Etan Thomas         | Syracuse             |    208 |  260 | C        |     12 |     400 |   85000 |
|    412 | Nick Young          | USC                  |    198 |  200 | G        |     12 |     400 | 85000.2 |
|    420 | Carlos Arroyo       | Florida Internationa |    200 |  202 | G        |     11 |    NULL |  115000 |
|    423 | Keith Bogans        | Kentucky             |    195 |   97 | G-F      |     11 |     420 |   90000 |
|    424 | Brian Cook          | Illinois             |    205 |  113 | F        |     11 |     420 |   85000 |
|    429 | Marcin Gortat       | Poland               |    213 |  108 | F-C      |      1 |     420 |  800001 |
|    440 | Malik Allen         | Villanova            |    208 |  115 | F        |     29 |    NULL |   89000 |
|    444 | Josh Howard         | Wake Forest          |    195 |   95 | F-G      |     29 |     440 |   83000 |
|    451 | Jerry Stackhouse    | North Carolina       |    198 |   99 | G-F      |     29 |     440 |   83000 |
|    452 | Jason Terry         | Arizona              |    187 |   81 | G        |     29 |     440 |   82000 |
|    453 | Antoine Wright      | Texas                |    200 |   97 | G-F      |     29 |     440 |   85000 |
|    461 | Maurice Ager        | Michigan State       |    195 |  202 | F-G      |      4 |    NULL |  120000 |
|    462 | Darrel Armstrong    | Fayetteville State   |    185 |   81 | G        |      4 |     461 |  110000 |
|    463 | Josh Boone          | Connecticut          |    208 |  237 | C        |      4 |     461 |  100000 |
|    464 | Vince Carter        | North Carolina       |    198 |  220 | G        |      4 |     461 |  100000 |
|    465 | DeSagana Diop       | Oak Hill Academy HS  |    213 |  280 | C        |      4 |     461 |  100000 |
|    466 | Devin Harris        | Wisconsin            |    190 |  185 | G        |      4 |     461 |   90000 |
|    482 | Chucky Atkins       | South Florida        |    187 |   83 | G        |     17 |     481 |   90000 |
|    483 | Marcus Camby        | Massachuhsetts       |    210 |  106 | C        |     17 |     481 |   90000 |
|    492 | Nene                | Brazil               |    210 |  113 | F-C      |     17 |     481 |   93000 |
|    500 | Morris Almond       | Rice                 |    198 |  102 | G        |     16 |    NULL |   87000 |
|    505 | Matt Harpring       | Gerogia Tech         |    200 |  104 | F        |     16 |     500 |   82000 |
|    506 | Jason Hart          | Syracuse             |    190 |   81 | G        |     16 |     500 |   83000 |
|    507 | Andrei Kirilenko    | Russia               |    205 |  223 | F        |     16 |     500 |   88000 |
|    508 | Kyle Korver         | Creighton            |    198 |  211 | F-G      |     16 |     500 |   85000 |
|    509 | C.J. Miles          | Skyline HS           |    198 |  220 | F-G      |     16 |     500 |   83000 |
|    520 | Marquis Daniels     | Auburn               |    198 |  200 | G        |      8 |    NULL |  155000 |
|    540 | Arron Afflalo       | UCLA                 |    195 |   97 | G        |      6 |    NULL |  100000 |
|    541 | Chauncey Billups    | Colorado             |    190 |  202 | G        |      6 |     540 |   90000 |
|    545 | Walter Herrmann     | Argentina            |    205 |  102 | F        |      6 |     540 |   85000 |
|    560 | Nick Collison       | Kansas               |    208 |  115 | F-C      |     20 |     562 |   85000 |
|    561 | Ronald Dupree       | Louisiana State      |    200 |  209 | F        |     20 |     562 |   85000 |
|    562 | Kevin Durant        | Texas                |    205 |   97 | G        |     20 |    NULL |  180000 |
|    563 | Francisco Elson     | California           |    213 |  106 | C        |     20 |     562 |   85000 |
|    564 | Mickael Gelabale    | France               |    200 |   97 | F        |     20 |     562 |   85000 |
|    565 | Jeff Green          | Georgetown           |    205 |  106 | F        |     20 |     562 |   85000 |
|    573 | Chris Wilcox        | Maryland             |    208 |  106 | F        |     20 |     562 |   85000 |
|    574 | Damien Wilkins      | Georgia              |    198 |  102 | F-G      |     20 |     562 |   85000 |
|    580 | Leandro Barbosa     | Brazil               |    190 |  202 | G        |     22 |     584 |   85000 |
|    581 | Raja Bell           | Florida Internationa |    195 |   97 | G        |     22 |     584 |   85000 |
|    582 | Boris Diaw          | France               |    203 |  106 | F-C      |     22 |     584 |   83000 |
|    583 | Gordan Giricek      | Croatia              |    198 |  220 | G        |     22 |     584 |   84000 |
|    584 | Grant Hill          | Duke                 |    203 |  102 | F-G      |     22 |    NULL |   90000 |
|    587 | Shaquille ONeal     | Louisiana State      |    215 |  325 | C        |     22 |     584 |  685000 |
|    589 | Brian Skinner       | Baylor               |    205 |  115 | G-F      |     22 |     584 |   84000 |
|    590 | Amare Stoudemire    | Cypress Creek (Orlan |    208 |  249 | C-F      |     22 |     584 |   81000 |
|    591 | D.J. Strawberry     | Maryland             |    208 |  201 | G        |     22 |     584 |   82000 |
|    592 | Alando Tucker       | Wisconsin            |    198 |   92 | F        |     22 |     584 |   83000 |
|    601 | Matt Barnes         | NULL                 |    200 |  226 | F        |     23 |     600 |   90000 |
|    606 | Monta Ellis         | NULL                 |    190 |  177 | G        |     23 |     600 |  110000 |
|    607 | Al Harrington       | NULL                 |    205 |  113 | F-C      |     23 |     600 |  111000 |
|    608 | Stephen Jackson     | NULL                 |    203 |   99 | F        |     23 |     600 |   81000 |
|    609 | Patrick O'Bryant    | NULL                 |    213 |  113 | C        |     23 |     600 |   91000 |
|    611 | Mickael Pietrus     | NULL                 |    198 |   97 | F        |     23 |     600 |   81000 |
|    613 | Brandan Wright      | NULL                 |    205 |   92 | F        |     23 |     600 |   91000 |
+--------+---------------------+----------------------+--------+------+----------+--------+---------+---------+
111 rows in set (0,00 sec)
-- 21
SELECT * FROM jugadores
WHERE equipo IN (SELECT id_equipo FROM equipos WHERE ciudad='orlando');
+--------+-----------------+----------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre          | procedencia          | altura | peso | posicion | equipo | capitan | salario |
+--------+-----------------+----------------------+--------+------+----------+--------+---------+---------+
|    420 | Carlos Arroyo   | Florida Internationa |    200 |  202 | G        |     11 |    NULL |  115000 |
|    421 | James Augustine | Illinois             |    208 |  106 | F        |     11 |     420 |   80000 |
|    422 | Tony Battie     | Texas Tech           |    210 |  108 | F-C      |     11 |     420 |   80000 |
|    423 | Keith Bogans    | Kentucky             |    195 |   97 | G-F      |     11 |     420 |   90000 |
|    424 | Brian Cook      | Illinois             |    205 |  113 | F        |     11 |     420 |   85000 |
|    425 | Kenyon Dooling  | Missouri             |    190 |   88 | G        |     11 |     420 |   80000 |
|    426 | Maurice Evans   | Texas                |    195 |  220 | G        |     11 |     420 |   70000 |
|    427 | Adonal Foyle    | Colgate              |    208 |  270 | C        |     11 |     420 |   60000 |
|    428 | Pat Garrity     | Notre Dame           |    205 |  238 | F        |     11 |     420 |   55000 |
|    430 | Dwight Howard   | SW Atlanta Crhistian |    210 |  120 | F-C      |     11 |     420 |   70000 |
|    431 | Rashard Lewis   | None                 |    208 |  104 | F        |     11 |     420 |   60000 |
|    432 | Jammer Nelson   | Saint Josephs        |    182 |   86 | G        |     11 |     420 |   50000 |
|    433 | J.J.Redick      | Duke                 |    193 |   86 | G        |     11 |     420 |   80000 |
|    434 | Hedo Turkoglu   | Turkey               |    208 |  220 | F        |     11 |     420 |   75000 |
+--------+-----------------+----------------------+--------+------+----------+--------+---------+---------+
14 rows in set (0,00 sec)
-- 22
SELECT * FROM jugadores
WHERE salario IN (SELECT MAX(salario) FROM jugadores) OR salario IN (SELECT MIN(salario) FROM jugadores);
+--------+-----------------+--------------+--------+------+----------+--------+---------+---------+
| codigo | nombre          | procedencia  | altura | peso | posicion | equipo | capitan | salario |
+--------+-----------------+--------------+--------+------+----------+--------+---------+---------+
|    361 | Brent Barry     | Oregon State |    200 |   95 | G        |     27 |    NULL |  950000 |
|    604 | Austin Croshere | NULL         |    208 |  106 | F        |     23 |     600 |    1000 |
+--------+-----------------+--------------+--------+------+----------+--------+---------+---------+
2 rows in set (0,01 sec)
-- 23
SELECT COUNT(codigo) FROM jugadores
WHERE equipo IN (SELECT id_equipo FROM equipos WHERE division='Central');
+---------------+
| COUNT(codigo) |
+---------------+
|            73 |
+---------------+
1 row in set (0,00 sec)
-- 24
SELECT jugadores.*,equipos.* FROM jugadores
INNER JOIN equipos ON jugadores.equipo=equipos.id_equipo
WHERE equipos.conferencia = "East";
+--------+---------------------+----------------------+--------+------+----------+--------+---------+---------+-----------+-----------+--------------+-------------+-----------+----------------------------+-----------+--------+------+------+
| codigo | nombre              | procedencia          | altura | peso | posicion | equipo | capitan | salario | id_equipo | nombre    | ciudad       | conferencia | division  | pabellon                   | capacidad | puntos | pp   | pg   |
+--------+---------------------+----------------------+--------+------+----------+--------+---------+---------+-----------+-----------+--------------+-------------+-----------+----------------------------+-----------+--------+------+------+
|    240 | Ray Allen           | Connecticut          |    195 |  101 | G        |      1 |    NULL |  100000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    241 | Tony Allen          | Oklahoma State       |    193 |  103 | G        |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    242 | P.J.Brown           | Louisiana State      |    210 |  107 | F-C      |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    243 | Sam Cassell         | Florida State        |    190 |   83 | G        |      1 |     240 |   70000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    244 | Glen Davis          | Louisiana State      |    205 |  114 | F        |      1 |     240 |   60000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    245 | Kevin Garnett       | Farragut Academy     |    210 |   99 | F        |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    246 | Eddie House         | Arizona State        |    185 |   80 | G        |      1 |     240 |   60000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    247 | Kendrick Perkins    | Clifton J.Ozen HS    |    208 |  119 | C        |      1 |     240 |   70000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    248 | Paul Pierce         | Kansas               |    200 |  104 | F        |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    249 | Scot Pollard        | Kansas               |    210 |  126 | C-F      |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    250 | James Posey         | Xavier               |    203 |   98 | F        |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    251 | Leon Powe           | California           |    203 |  108 | F        |      1 |     240 |   90000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    252 | Gabe Pruitt         | USC                  |    193 |   77 | G        |      1 |     240 |   70000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    253 | Rajon Rondo         | Kentucky             |    185 |   78 | G        |      1 |     240 |   60000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    254 | Brian Scalabrine    | USC                  |    205 |  106 | F-C      |      1 |     240 |   80000 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|    429 | Marcin Gortat       | Poland               |    213 |  108 | F-C      |      1 |     420 |  800001 |         1 | Celtics   | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |
|     81 | Andrea Bargnani     | Italy                |    213 |  116 | C-F      |      2 |      82 |   70000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     82 | Maceo Baston        | Michigan             |    208 |  109 | C-F      |      2 |    NULL |   60000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     84 | Primoz Brezec       | Slovenia             |    215 |  112 | C        |      2 |      82 |   50000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     85 | Jose Calderon       | Spain                |    190 |   95 | G        |      2 |      82 |   40000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     86 | Carlos Delfino      | Argentina            |    198 |   99 | G        |      2 |      82 |   40000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     87 | T.J. Ford           | Texas                |    182 |   84 | G        |      2 |      82 |   35000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     88 | Jorge Garbajosa     | Spain                |    205 |  110 | F        |      2 |      82 |   42000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     89 | Joey Graham         | Oklahoma State       |    200 |   98 | F        |      2 |      82 |   35000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     90 | Kris Humphries      | Minnesota            |    205 |  105 | F        |      2 |      82 |   40000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     91 | Linton Johnson III  | Tulane               |    203 |  105 | F        |      2 |      82 |   30000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     92 | Jason Kapono        | UCLA                 |    203 |  110 | F        |      2 |      82 |   45000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     93 | Jamario Moon        | Merdian CC (MS)      |    203 |  110 | F        |      2 |      82 |   35000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     94 | Rasho Nesterovic    | Slovenia             |    213 |  115 | C        |      2 |      82 |   60000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|     95 | Anthony Parker      | Bradley              |    198 |  118 | G-F      |      2 |      82 |   55000 |         2 | Raptors   | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |
|    120 | Louis Amundson      |  Nevada-Las Vegas    |    203 |  105 | F        |      3 |    NULL |  115000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    121 | Calvin Booth        | Penn State           |    210 |  113 | C        |      3 |     120 |  120000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    122 | Rodney Carney       | Memphis              |    200 |  204 | F        |      3 |     120 |   12000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    123 | Samuel Dalembert    | Seton Hall           |    210 |  110 | C        |      3 |     120 |   22000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    124 | Reggie Evans        | Iowa                 |    203 |  108 | F        |      3 |     120 |   32000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    125 | Willie Green        | Detroit Mercy        |    190 |  100 | G        |      3 |     120 |   12000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    126 | Herbert Hill        | Providence           |    208 |  110 | F-C      |      3 |     120 |   42000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    127 | Andre Iguodala      | Arizona              |    198 |   93 | F-G      |      3 |     120 |   52000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    128 | Andre Miller        | Utah                 |    187 |  289 | G        |      3 |     120 |   72000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    129 | Kevin Ollie         | Connecticut          |    187 |   82 | G        |      3 |     120 |   22000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    130 | Shavlik Randolph    | Duke                 |    208 |  109 | F        |      3 |     120 |   42000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    131 | Jason Smith         | Colorado Sate        |    213 |  110 | F        |      3 |     120 |   12000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    132 | Louis Williams      | South Gwinnett HS    |    187 |   85 | G        |      3 |     120 |   12000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    133 | Thaddeus Young      | Georgio Tech         |    203 |  101 | F        |      3 |     120 |   22000 |         3 | 76ers     | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |
|    461 | Maurice Ager        | Michigan State       |    195 |  202 | F-G      |      4 |    NULL |  120000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    462 | Darrel Armstrong    | Fayetteville State   |    185 |   81 | G        |      4 |     461 |  110000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    463 | Josh Boone          | Connecticut          |    208 |  237 | C        |      4 |     461 |  100000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    464 | Vince Carter        | North Carolina       |    198 |  220 | G        |      4 |     461 |  100000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    465 | DeSagana Diop       | Oak Hill Academy HS  |    213 |  280 | C        |      4 |     461 |  100000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    466 | Devin Harris        | Wisconsin            |    190 |  185 | G        |      4 |     461 |   90000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    467 | Trenton Hassell     | Austin Peay          |    195 |  233 | F        |      4 |     461 |   70000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    468 | Richard Jefferson   | Arizona              |    200 |  102 | F        |      4 |     461 |   70000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    469 | Nenad Krstic        | Serbia Montenegro    |    213 |  108 | F-C      |      4 |     461 |   70000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    470 | Bostjan Nachbar     | Slovenia             |    205 |  221 | F        |      4 |     461 |   70000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    471 | Stromile Swift      | Louisiana State      |    208 |  220 | F-C      |      4 |     461 |   60000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    472 | Keith Van Horn      | Utah                 |    208 |  111 | F        |      4 |     461 |   75000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    473 | Marcus Williams     | Connecticut          |    190 |   92 | G        |      4 |     461 |   62000 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    474 | Sean Williams       | Boston College       |    208 |  106 | F-C      |      4 |     461 |   70300 |         4 | Nets      | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |
|    100 | Renaldo Balkman     | South Carolina       |    203 |   91 | F        |      5 |     105 |   60000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    101 | Wilson Chandler     | DePaul               |    203 |   98 | F        |      5 |     105 |   55000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    102 | Mardy Collins       | Temple               |    198 |   99 | G        |      5 |     105 |   45000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    103 | Jamal Crawford      | Michigan             |    195 |   91 | G        |      5 |     105 |   30000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    104 | Eddy Curry          | Thornwood HS         |    210 |   95 | C        |      5 |     105 |   25000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    105 | Jerome James        | Florida AM           |    215 |   95 | C        |      5 |    NULL |  180000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    106 | Jared Jeffries      | Indiana              |    210 |  108 | F        |      5 |     105 |   75000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    107 | Fred Jones          | Oregon               |    187 |  102 | G        |      5 |     105 |   65000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    108 | David Lee           | Florida              |    205 |  106 | F        |      5 |     105 |   55000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    109 | Stephon Marbury     | Georgia Tech         |    187 |  102 | G        |      5 |     105 |   75000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    110 | Randolph Morris     | Kentucky             |    210 |  110 | C        |      5 |     105 |   95000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    111 | Zach Randolph       | Michigan State       |    205 |  111 | F        |      5 |     105 |   65000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    112 | Quentin Richardson  | DePaul               |    198 |  106 | F-G      |      5 |     105 |   45000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    113 | Nate Robinson       | Washington           |    175 |   81 | G        |      5 |     105 |   40000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    114 | Malik Rose          | Drexel               |    200 |  115 | F        |      5 |     105 |   65000 |         5 | Knicks    | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |
|    540 | Arron Afflalo       | UCLA                 |    195 |   97 | G        |      6 |    NULL |  100000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    541 | Chauncey Billups    | Colorado             |    190 |  202 | G        |      6 |     540 |   90000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    542 | Juan Dixon          | Maryland             |    190 |  165 | G        |      6 |     540 |   65000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    543 | Richard Hamilton    | Connecticut          |    200 |  193 | G        |      6 |     540 |   65000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    544 | Jarvis Hayes        | Georgia              |    203 |  103 | F        |      6 |     540 |   75000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    545 | Walter Herrmann     | Argentina            |    205 |  102 | F        |      6 |     540 |   85000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    546 | Lindsey Hunter      | Jackson State        |    187 |   88 | G        |      6 |     540 |   55000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    547 | Amir Johnson        | Westchester HS       |    205 |   95 | F        |      6 |     540 |   65000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    548 | Jason Maxiell       | Cincinnati           |    200 |  260 | F        |      6 |     540 |   65000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    549 | Antonio McDyess     | Alabama              |    205 |  111 | F        |      6 |     540 |   65000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    550 | Tayshaun Prince     | Kentucky             |    205 |   97 | F        |      6 |     540 |   67000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    551 | Theo Ratliff        | Wyoming              |    208 |  106 | C        |      6 |     540 |   66000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    552 | Cheikh Samb         | Senegal              |    215 |  111 | C        |      6 |     540 |   64000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    553 | Rodney Stuckey      | Eastern Washington   |    195 |   92 | G        |      6 |     540 |   35000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    554 | Rasheed Wallace     | North Carolina       |    210 |  104 | C-F      |      6 |     540 |   25000 |         6 | Pistons   | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |
|    150 | Lance Allred        | Weber State          |    210 |  115 | C        |      7 |     154 |   90000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    151 | Devin Brown         | Texas-San Antonio    |    195 |   91 | G        |      7 |     154 |   80000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    152 | Daniel Gibson       | Texas                |    187 |   85 | G        |      7 |     154 |   70000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    153 | Zydrunas Ilgauskas  | St. Vincent-St. Mary |    220 |  117 | C        |      7 |     154 |   90000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    154 | LeBron James        | Houston              |    203 |  113 | F        |      7 |    NULL |  200000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    155 | Damon Jones         | Saint Joseph's       |    190 |   88 | G        |      7 |     154 |   60000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    156 | Dwayne Jones        | Serbia               |    210 |  113 | C-F      |      7 |     154 |   90000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    157 | Aleksandar Pavlovic | Maryland             |    200 |  108 | G-F      |      7 |     154 |   88000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    158 | Joe Smith           | Michigan State       |    208 |  106 | F-C      |      7 |     154 |   90000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    159 | Eric Snow           | Miami                |    190 |   92 | G        |      7 |     154 |   90000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    160 | Wally Szczerbiak    | Brazil               |    200 |  111 | F        |      7 |     154 |   95000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    161 | Anderson Varejao    | Merdian CC (MS)      |    208 |  108 | C-F      |      7 |     154 |   80000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    162 | Ben Wallace         | Virginia Union       |    205 |  108 | C-F      |      7 |     154 |   90000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    163 | Delonte West        | Saint Joseph's       |    190 |   81 | G        |      7 |     154 |   70000 |         7 | Cavaliers | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |
|    520 | Marquis Daniels     | Auburn               |    198 |  200 | G        |      8 |    NULL |  155000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    521 | Travis Diener       | Marquette            |    185 |  175 | G        |      8 |     520 |   65000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    522 | Ike Diogu           | Arizona State        |    203 |  115 | F        |      8 |     520 |   70000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    523 | Mike Dunleavy       | Duke                 |    205 |  104 | F-G      |      8 |     520 |   67000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    524 | Jeff Foster         | Texas State          |    210 |  113 | C        |      8 |     520 |   64000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    525 | Stephen Graham      | Oklahoma State       |    198 |   97 | G        |      8 |     520 |   63000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    526 | Danny Granger       | New Mexico           |    203 |  103 | F-G      |      8 |     520 |   45000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    527 | David Harrison      | Colorado             |    213 |  280 | C        |      8 |     520 |   15000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    528 | Troy Murphy         | Notre Dame           |    210 |  111 | C-F      |      8 |     520 |   25000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    529 | Ronald Murray       | Shaw                 |    190 |  197 | G        |      8 |     520 |   35000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    530 | Jermaine O'Neal     | au Claire HS (SC)    |    210 |  260 | F-C      |      8 |     520 |   26000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    531 | Andre Owens         | Houston              |    193 |  200 | G        |      8 |     520 |   65000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    532 | Kareem Rush         | Missouri             |    198 |   97 | G        |      8 |     520 |   63000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    533 | Jamaal Tinsley      | Iowa State           |    190 |   83 | G        |      8 |     520 |   55000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    534 | Shawne Williams     | Memphis              |    205 |  102 | F        |      8 |     520 |   45000 |         8 | Pacers    | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |
|    220 | Shannon Brown       | Michigan State       |    193 |   97 | G        |      9 |    NULL |  100000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    221 | JamesOn Curry       | Oklahoma Stare       |    190 |   90 | G        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    222 | Luol Deng           | Duke                 |    205 |  105 | F        |      9 |     220 |   90000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    223 | Chris Duhon         | Duke                 |    185 |   83 | G        |      9 |     220 |   70000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    224 | Drew Gooden         | Kansas               |    208 |  110 | F        |      9 |     220 |   60000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    225 | Ben Gordon          | Connecticut          |    190 |   93 | G        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    226 | Aaron Gray          | Pittsburgh           |    213 |  118 | C        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    227 | Kirk Hinrich        | Kansas               |    190 |   85 | G        |      9 |     220 |   50000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    228 | Larry Hughes        | St.Luis              |    195 |   84 | G        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    229 | Demetris Nichols    | Syracuse             |    203 |  101 | F        |      9 |     220 |   85000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    230 | Joakin Noah         | Florida              |    210 |  110 | C-F      |      9 |     220 |   84000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    231 | Andres Nocioni      | Argentina            |    200 |  102 | F        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    232 | Thabo Sefolosha     | Switzerland          |    200 |  100 | G        |      9 |     220 |   70000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    233 | Cedric Simmons      | North Carolina State |    205 |  110 | F        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|    234 | Tyrus Thonas        | Louisiana State      |    205 |  101 | F        |      9 |     220 |   80000 |         9 | Bulls     | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |
|     96 | Jake Voskuhl        | Connecticut          |    210 |  113 | C        |     10 |     202 |   15000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    201 | Charlie Bell        | Michigan State       |    190 |   99 | G        |     10 |    NULL |  114000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    202 | Andrew Bouqt        | Utah                 |    213 |  115 | C        |     10 |     202 |   25000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    203 | Dan Gadzuric        | Ucla                 |    210 |  118 | C        |     10 |     202 |   35000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    204 | Royal Ivey          | Texas                |    193 |   97 | G        |     10 |     202 |   45000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    205 | Desmond Mason       | Oklahoma State       |    195 |   99 | F        |     10 |     202 |   25000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    206 | Michael Redd        | Ohio State           |    198 |   98 | G        |     10 |     202 |   25000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    207 | Michael Ruffin      | Tulsa                |    203 |  112 | F-C      |     10 |     202 |   45000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    208 | Ramon Sessions      | Nevava-Reno          |    190 |   86 | G        |     10 |     202 |   25000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    209 | Bobby Simmons       | DePaul               |    198 |   91 | F        |     10 |     202 |   15000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    210 | Awvee Store         | Arizona State        |    198 |  102 | F-G      |     10 |     202 |   25000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    211 | Charlie Villanueva  | Connecticut          |    210 |  107 | F        |     10 |     202 |   45000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    213 | Mo Williams         | Alabama              |    185 |   83 | G        |     10 |     202 |   18000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    214 | Yi Jianlian         | Connecticut          |    213 |  114 | F        |     10 |     202 |   25000 |        10 | Bucks     | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |
|    420 | Carlos Arroyo       | Florida Internationa |    200 |  202 | G        |     11 |    NULL |  115000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    421 | James Augustine     | Illinois             |    208 |  106 | F        |     11 |     420 |   80000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    422 | Tony Battie         | Texas Tech           |    210 |  108 | F-C      |     11 |     420 |   80000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    423 | Keith Bogans        | Kentucky             |    195 |   97 | G-F      |     11 |     420 |   90000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    424 | Brian Cook          | Illinois             |    205 |  113 | F        |     11 |     420 |   85000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    425 | Kenyon Dooling      | Missouri             |    190 |   88 | G        |     11 |     420 |   80000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    426 | Maurice Evans       | Texas                |    195 |  220 | G        |     11 |     420 |   70000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    427 | Adonal Foyle        | Colgate              |    208 |  270 | C        |     11 |     420 |   60000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    428 | Pat Garrity         | Notre Dame           |    205 |  238 | F        |     11 |     420 |   55000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    430 | Dwight Howard       | SW Atlanta Crhistian |    210 |  120 | F-C      |     11 |     420 |   70000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    431 | Rashard Lewis       | None                 |    208 |  104 | F        |     11 |     420 |   60000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    432 | Jammer Nelson       | Saint Josephs        |    182 |   86 | G        |     11 |     420 |   50000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    433 | J.J.Redick          | Duke                 |    193 |   86 | G        |     11 |     420 |   80000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    434 | Hedo Turkoglu       | Turkey               |    208 |  220 | F        |     11 |     420 |   75000 |        11 | Magic     | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |
|    400 | Gilbert Arenas      | Arizona              |    193 |   97 | G        |     12 |    NULL |  100000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    401 | Andray Blatche      | South Kent Prep      |    210 |  248 | F        |     12 |    4000 |   85000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    402 | Caron Butler        | Connecticut          |    200 |  103 | F        |     12 |     400 |   85000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    403 | Antonio Daniels     | Bowling Green        |    193 |  205 | G        |     12 |     400 |   95000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    404 | Brendan Haywood     | North Carolina       |    213 |  263 | C        |     12 |     400 |  105000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    405 | Antawn Jamison      | North Carolina       |    205 |  106 | F        |     12 |     400 |   85000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    406 | Roger Mason         | Virginia             |    195 |   96 | G        |     12 |     400 |   75000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    407 | Dominic McGuire     | Fresno State         |    205 |  220 | F        |     12 |     400 |   65000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    408 | Oleksiy Pecherov    | Do4k                 |    213 |  234 | C-F      |     12 |     400 |   55000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    409 | Darius Songaila     | Wake Forest          |    205 |  248 | F        |     12 |     400 |   85000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    410 | DeShawn Stevenson   | Washington Union HS  |    195 |   99 | G        |     12 |     400 |   85000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    411 | Etan Thomas         | Syracuse             |    208 |  260 | C        |     12 |     400 |   85000 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    412 | Nick Young          | USC                  |    198 |  200 | G        |     12 |     400 | 85000.2 |        12 | Wizards   | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |
|    261 | Mike Bibby          | Arizona              |    185 |  190 | G        |     13 |    NULL |   90000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    262 | Josh Childress      | Stanford             |    203 |  110 | G-F      |     13 |     261 |   70000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    263 | Speedy Claxton      | Hofstra              |    185 |   77 | G        |     13 |     261 |   70000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    264 | Al Horford          | Florida              |    208 |  111 | C-F      |     13 |     261 |   60000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    265 | Joe Johnson         | Arkansas             |    200 |  106 | G        |     13 |     261 |   50000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    266 | Solomon Jones       | South Florida        |    208 |  104 | F        |     13 |     261 |   70000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    267 | Acie Law            | Texas AM             |    190 |  195 | G        |     13 |     261 |   72000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    268 | Zaza Pachulia       | Georgia              |    210 |  280 | C        |     13 |     261 |   74000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    269 | Jeremy Richardson   | Delta State          |    200 |   88 | G-F      |     13 |     261 |   72000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    270 | Josh Smith          | Oak Hill Academy     |    205 |  106 | F        |     13 |     261 |   60000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    271 | Salim Stoudamire    | Arizona              |    185 |  175 | G        |     13 |     261 |   70000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    272 | Mario West          | Georgia Tech         |    195 |   95 | G        |     13 |     261 |   70000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    273 | Marvin Williams     | North Carolina       |    205 |  104 | F        |     13 |     261 |   70000 |        13 | Hawks     | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |
|    181 | Derek Anderson      | Kentucky             |    195 |   88 | G        |     14 |    NULL |  100000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    182 | Earl Boykins        | Eastern michigan     |    165 |   60 | G        |     14 |     181 |   60000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    183 | Matt Carroll        | Notre Dame           |    198 |   96 | G        |     14 |     181 |   60000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    184 | Jermareo Davidson   | Alabama              |    208 |  104 | F        |     14 |     181 |   70000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    185 | Jared Dudley        | Boston College       |    200 |  102 | F        |     14 |     181 |   60000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    186 | Raymond Felton      | North Carolina       |    185 |   89 | G        |     14 |     181 |   40000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    187 | Othella Harrington  | Georgetown           |    205 |  106 | F-C      |     14 |     181 |   60000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    188 | Ryan Hollins        | Ucla                 |    213 |  104 | C        |     14 |     181 |   65000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    189 | Sean May            | North Carolina       |    205 |  120 | F-C      |     14 |     181 |   75000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    190 | Nazr Mohammed       | Kentucky             |    208 |  113 | C        |     14 |     181 |   62000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    191 | Adam Morrison       | Gonzaga              |    203 |   92 | F        |     14 |     181 |   65000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    192 | Emeka Okafor        | Connecticut          |    208 |  114 | F-C      |     14 |     181 |   63000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    193 | Jason Richardson    | Michigan State       |    198 |   98 | G-F      |     14 |     181 |   60000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    194 | Gerald Wallace      | Alabama              |    200 |  104 | F        |     14 |     181 |   80000 |        14 | Bobcats   | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |
|    281 | Blake Ahearn        | Missouri State       |    187 |   86 | G        |     15 |    NULL |   80000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    282 | joel Anthony        | Nevada-Las vegas     |    205 |  111 | C        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    283 | Marcus Banks        | Nevada-Las vegas     |    187 |   96 | G        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    284 | Earl Barron         | Memphis              |    213 |  111 | C-F      |     15 |     281 |   60000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    285 | Mark Blount         | Pittsburgh           |    213 |  113 | C-F      |     15 |     281 |   50000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    286 | Daequan Cook        | Ohio State           |    195 |  205 | G        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    287 | Ricky Davis         | lowa                 |    200 |  113 | F-G      |     15 |     281 |   50000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    288 | Udonis Haslem       | Florida              |    203 |  106 | F        |     15 |     281 |   60000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    289 | Alexander Johnson   | Florida State        |    205 |  104 | F        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    290 | Stephane Lasme      | Massachusetts        |    203 |   97 | F        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    291 | Shawn Marion        | UNLV                 |    200 |  104 | F        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    292 | Alonzo Mourning     | Georgetown           |    208 |  118 | C        |     15 |     281 |   75000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    293 | Chris Quinn         | Notre dame           |    187 |  175 | G        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    294 | Dwyane Wade         | Marquette            |    193 |  216 | G        |     15 |     281 |   72000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    295 | Jason Williams      | Florida              |    185 |   81 | G        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
|    296 | Dorell Wright       | South Kent           |    205 |   95 | F        |     15 |     281 |   70000 |        15 | Heat      | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |
+--------+---------------------+----------------------+--------+------+----------+--------+---------+---------+-----------+-----------+--------------+-------------+-----------+----------------------------+-----------+--------+------+------+
216 rows in set (0,00 sec)
-- 25

-- 26
SELECT equipos.*,COUNT(partidos.equipo_local) FROM equipos
INNER JOIN partidos ON equipos.id_equipo = partidos.equipo_local
GROUP BY partidos.equipo_local;
+-----------+---------------+--------------+-------------+-----------+----------------------------+-----------+--------+------+------+------------------------------+
| id_equipo | nombre        | ciudad       | conferencia | division  | pabellon                   | capacidad | puntos | pp   | pg   | COUNT(partidos.equipo_local) |
+-----------+---------------+--------------+-------------+-----------+----------------------------+-----------+--------+------+------+------------------------------+
|         1 | Celtics       | Boston       | East        | Atlantic  | TD Garden                  |        19 |     39 |   16 |   39 |                          522 |
|         2 | Raptors       | Toronto      | East        | Atlantic  | Scotiabank Arena           |     19800 |     17 |   38 |   17 |                          522 |
|         3 | 76ers         | Philadelphia | East        | Atlantic  | Wells Fargo center         |     20007 |     20 |   34 |   20 |                          522 |
|         4 | Nets          | Brooklyn     | East        | Atlantic  | Barclays Center            |     17732 |     20 |   34 |   20 |                          522 |
|         5 | Knicks        | New York     | East        | Atlantic  | Madison Square Garden      |     19812 |     36 |   18 |   36 |                          522 |
|         6 | Pistons       | Detroit      | East        | Central   | Little Caesars Arena       |     20332 |     29 |   26 |   29 |                          522 |
|         7 | Cavaliers     | Cleveland    | East        | Central   | Rocket Mortgage FieldHouse |     19432 |     44 |   10 |   44 |                          522 |
|         8 | Pacers        | Indiana      | East        | Central   | Gainbridge Fieldhouse      |     17923 |     30 |   23 |   30 |                          522 |
|         9 | Bulls         | Chicago      | East        | Central   | United Center              |     20917 |     22 |   33 |   22 |                          522 |
|        10 | Bucks         | Milwaukee    | East        | Central   | Fiserv Forum               |     17341 |     29 |   24 |   29 |                          522 |
|        11 | Magic         | Orlando      | East        | SouthEast | Kia Center                 |     18846 |     27 |   29 |   27 |                          522 |
|        12 | Wizards       | Washington   | East        | SouthEast | Capital One Arena          |     20333 |      9 |   45 |    9 |                          522 |
|        13 | Hawks         | Atlanta      | East        | SouthEast | State Farm Arena           |     17044 |     26 |   29 |   26 |                          522 |
|        14 | Bobcats       | New Orleans  | East        | SouthEast | Smoothie King Center       |     16867 |     13 |   42 |   13 |                          522 |
|        15 | Heat          | Miami        | East        | SouthEast | Kaseya Center              |     19600 |     25 |   28 |   25 |                          522 |
|        16 | Jazz          | Utah         | West        | NorthWest | Delta Center               |     18306 |     13 |   41 |   13 |                          522 |
|        17 | Nuggets       | Denver       | West        | NorthWest | Ball Arena                 |     19250 |     36 |   19 |   36 |                          522 |
|        18 | Trail Blazers | Portland     | West        | NorthWest | Moda Center                |     19411 |     23 |   32 |   23 |                          522 |
|        19 | Timberwolves  | Minnesota    | West        | NorthWest | Target Center              |     18024 |     31 |   25 |   31 |                          522 |
|        20 | Supersonics   | Seattle      | West        | NorthWest | Seattle Center             |     19000 |     11 |   30 |   11 |                          522 |
|        21 | Lakers        | Los Angeles  | West        | Pacific   | Crypto.com Arena           |     18997 |     32 |   20 |   32 |                          522 |
|        22 | Suns          | Phoenix      | West        | Pacific   | Footprint Center           |     17071 |     26 |   28 |   26 |                          522 |
|        23 | Warriors      | Golden State | West        | Pacific   | Chase Center               |     18064 |     28 |   27 |   28 |                          522 |
|        24 | Kings         | Sacramento   | West        | Pacific   | Golden 1 Center            |     17611 |     28 |   27 |   28 |                          522 |
|        25 | Clippers      | Los Angeles  | West        | Pacific   | Intuit Dome                |     18000 |     31 |   23 |   31 |                          522 |
|        26 | Hornets       | Charlotte    | West        | SouthWest | Spectrum Center            |     19077 |     13 |   39 |   13 |                          522 |
|        27 | Spurs         | San Antonio  | West        | SouthWest | Frost Bank Center          |     18354 |     23 |   29 |   23 |                          522 |
|        28 | Rockets       | Houston      | West        | SouthWest | Toyota Center              |     18055 |     34 |   21 |   34 |                          522 |
|        29 | Mavericks     | Dallas       | West        | SouthWest | American Airlines Center   |     19200 |     30 |   26 |   30 |                          522 |
|        30 | Grizzlies     | Memphis      | West        | SouthWest | FedExForum                 |     17794 |     36 |   18 |   36 |                          522 |
+-----------+---------------+--------------+-------------+-----------+----------------------------+-----------+--------+------+------+------------------------------+
30 rows in set (0,01 sec)
-- 27
+--------------------+
| nombre             |
+--------------------+
| Andrea Bargnani    |
| Anthony Parker     |
| Brian Scalabrine   |
| Carlos Delfino     |
| Eddie House        |
| Gabe Pruitt        |
| Glen Davis         |
| Jamario Moon       |
| James Posey        |
| Jason Kapono       |
| Joey Graham        |
| Jorge Garbajosa    |
| Jose Calderon      |
| Kendrick Perkins   |
| Kevin Garnett      |
| Kris Humphries     |
| Leon Powe          |
| Linton Johnson III |
| Maceo Baston       |
| Marcin Gortat      |
| P.J.Brown          |
| Paul Pierce        |
| Primoz Brezec      |
| Rajon Rondo        |
| Rasho Nesterovic   |
| Ray Allen          |
| Sam Cassell        |
| Scot Pollard       |
| T.J. Ford          |
| Tony Allen         |
+--------------------+
30 rows in set (0.00 sec)
-- 28
+--------+--------------+--------------+
| equipo | MAX(salario) | MIN(salario) |
+--------+--------------+--------------+
|      1 |       800001 |        60000 |
|      2 |        70000 |        30000 |
|      3 |       120000 |        12000 |
|      4 |       120000 |        60000 |
|      5 |       180000 |        25000 |
|      6 |       100000 |        25000 |
|      7 |       200000 |        60000 |
|      8 |       155000 |        15000 |
|      9 |       100000 |        50000 |
|     10 |       114000 |        15000 |
|     11 |       115000 |        50000 |
|     12 |       105000 |        55000 |
|     13 |        90000 |        50000 |
|     14 |       100000 |        40000 |
|     15 |        80000 |        50000 |
|     16 |        88000 |        60000 |
|     17 |        93000 |        38000 |
|     18 |        90000 |        60000 |
|     19 |        12000 |         8000 |
|     20 |       180000 |        15000 |
|     21 |       190000 |        15000 |
|     22 |       685000 |        45000 |
|     23 |       111000 |         1000 |
|     24 |       100000 |        60000 |
|     25 |       120000 |         5000 |
|     26 |        90000 |        50000 |
|     27 |       950000 |        50000 |
|     28 |       111000 |        50000 |
|     29 |        89000 |        40000 |
|     30 |       180000 |         7800 |
+--------+--------------+--------------+
30 rows in set (0.01 sec)
-- 29
SELECT equipo,AVG(salario) FROM jugadores
GROUP BY equipo
HAVING AVG(salario) >= 50001;
+--------+--------------------+
| equipo | AVG(salario)       |
+--------+--------------------+
|      1 |        121250.0625 |
|      4 |  83378.57142857143 |
|      5 |              65000 |
|      6 |              65800 |
|      7 |  91642.85714285714 |
|      8 |              57200 |
|      9 |  77933.33333333333 |
|     11 |              75000 |
|     12 |  83846.17307692308 |
|     13 |  69076.92307692308 |
|     14 |  65714.28571428571 |
|     15 |            67312.5 |
|     16 |  77142.85714285714 |
|     17 |  66538.46153846153 |
|     18 |  74666.66666666667 |
|     20 |  76666.66666666667 |
|     21 |  73666.66666666667 |
|     22 | 124384.61538461539 |
|     23 | 57857.142857142855 |
|     24 |              80000 |
|     26 |  68214.28571428571 |
|     27 | 131133.33333333334 |
|     28 |  83066.66666666667 |
|     29 |  70933.33333333333 |
+--------+--------------------+
24 rows in set (0.00 sec)
-- 30
SELECT equipo,SUM(altura) FROM jugadores
GROUP BY equipo
HAVING AVG(salario) > ALL(SELECT AVG(salario) FROM jugadores WHERE equipo IN (SELECT id_equipo FROM equipos WHERE division='Atlantic'));
-- 31
SELECT equipo,COUNT(codigo) FROM jugadores
WHERE salario>ALL(SELECT AVG(salario) FROM jugadores)
GROUP BY equipo;
+--------+-------------+
| equipo | SUM(altura) |
+--------+-------------+
|      1 |        3208 |
|      4 |        2816 |
|      7 |        2816 |
|      9 |        2992 |
|     11 |        2817 |
|     12 |        2633 |
|     16 |        2809 |
|     18 |        3042 |
|     20 |        3047 |
|     21 |        3047 |
|     22 |        2621 |
|     24 |        3030 |
|     27 |        2991 |
|     28 |        3027 |
+--------+-------------+
14 rows in set (0.00 sec)
-- 32
SELECT nombre,salario FROM jugadores 
WHERE salario>ALL(SELECT salario FROM jugadores WHERE equipo IN (SELECT id_equipo FROM equipos WHERE pabellon='Delta Center'));
Empty set (0.00 sec)
-- 33
SELECT nombre FROM jugadores
WHERE equipo IN (SELECT id_equipo FROM equipos WHERE id_equipo IN (SELECT equipo_local FROM partidos WHERE arbitro IN (SELECT id_arbitro FROM arbitros WHERE nombre = 'Bruce Lee')));
Empty set (0.00 sec)
-- 34
SELECT * FROM jugadores 
GROUP BY equipo
HAVING altura> ALL(SELECT AVG(altura) FROM jugadores GROUP BY equipo);
+--------+-------------------+-------------+--------+------+----------+--------+---------+---------+
| codigo | nombre            | procedencia | altura | peso | posicion | equipo | capitan | salario |
+--------+-------------------+-------------+--------+------+----------+--------+---------+---------+
|     81 | Andrea Bargnani   | Italy       |    213 |  116 | C-F      |      2 |      82 |   70000 |
|    150 | Lance Allred      | Weber State |    210 |  115 | C        |      7 |     154 |   90000 |
|     96 | Jake Voskuhl      | Connecticut |    210 |  113 | C        |     10 |     202 |   15000 |
|    381 | LaMarcus Aldridge | Texas       |    210 |  111 | F-C      |     18 |    NULL |   90000 |
|      1 | Corey Brever      | Florida     |    205 |   83 | F-G      |     19 |    NULL |   10000 |
|    560 | Nick Collison     | Kansas      |    208 |  115 | F-C      |     20 |     562 |   85000 |
|    320 | Chris Andersen    | Blinn Coll  |    208 |  103 | F-C      |     26 |    NULL |   80000 |
|    440 | Malik Allen       | Villanova   |    208 |  115 | F        |     29 |    NULL |   89000 |
|     41 | Andre Brown       | De Paul     |    205 |  115 | F        |     30 |    NULL |  180000 |
+--------+-------------------+-------------+--------+------+----------+--------+---------+---------+
9 rows in set (0.00 sec)
-- 35
SELECT j.*,AVG(j2.salario),(AVG(j2.salario) - j.salario) AS Diferencia FROM jugadores j
JOIN equipos e ON j.equipo = e.id_equipo
JOIN jugadores j2 ON j2.equipo = e.id_equipo
GROUP BY j.equipo,j.codigo
LIMIT 10;
+--------+------------------+-------------------+--------+------+----------+--------+---------+---------+-----------------+------------+
| codigo | nombre           | procedencia       | altura | peso | posicion | equipo | capitan | salario | AVG(j2.salario) | Diferencia |
+--------+------------------+-------------------+--------+------+----------+--------+---------+---------+-----------------+------------+
|    240 | Ray Allen        | Connecticut       |    195 |  101 | G        |      1 |    NULL |  100000 |     121250.0625 | 21250.0625 |
|    241 | Tony Allen       | Oklahoma State    |    193 |  103 | G        |      1 |     240 |   80000 |     121250.0625 | 41250.0625 |
|    242 | P.J.Brown        | Louisiana State   |    210 |  107 | F-C      |      1 |     240 |   80000 |     121250.0625 | 41250.0625 |
|    243 | Sam Cassell      | Florida State     |    190 |   83 | G        |      1 |     240 |   70000 |     121250.0625 | 51250.0625 |
|    244 | Glen Davis       | Louisiana State   |    205 |  114 | F        |      1 |     240 |   60000 |     121250.0625 | 61250.0625 |
|    245 | Kevin Garnett    | Farragut Academy  |    210 |   99 | F        |      1 |     240 |   80000 |     121250.0625 | 41250.0625 |
|    246 | Eddie House      | Arizona State     |    185 |   80 | G        |      1 |     240 |   60000 |     121250.0625 | 61250.0625 |
|    247 | Kendrick Perkins | Clifton J.Ozen HS |    208 |  119 | C        |      1 |     240 |   70000 |     121250.0625 | 51250.0625 |
|    248 | Paul Pierce      | Kansas            |    200 |  104 | F        |      1 |     240 |   80000 |     121250.0625 | 41250.0625 |
|    249 | Scot Pollard     | Kansas            |    210 |  126 | C-F      |      1 |     240 |   80000 |     121250.0625 | 41250.0625 |
+--------+------------------+-------------------+--------+------+----------+--------+---------+---------+-----------------+------------+
10 rows in set (0.00 sec)
-- 36
SELECT * FROM jugadores
GROUP BY codigo
HAVING salario >= ALL(SELECT salario FROM jugadores WHERE equipo = 5);
+--------+-----------------+----------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre          | procedencia          | altura | peso | posicion | equipo | capitan | salario |
+--------+-----------------+----------------------+--------+------+----------+--------+---------+---------+
|     41 | Andre Brown     | De Paul              |    205 |  115 | F        |     30 |    NULL |  180000 |
|     62 | Kobe Bryant     | Lower Merion HS (PA) |    198 |  103 | G        |     21 |    NULL |  180000 |
|     63 | Andrew Bynum    | St. Joseph HS (NJ)   |    213 |  110 | C        |     21 |      62 |  190000 |
|    105 | Jerome James    | Florida AM           |    215 |   95 | C        |      5 |    NULL |  180000 |
|    154 | LeBron James    | Houston              |    203 |  113 | F        |      7 |    NULL |  200000 |
|    361 | Brent Barry     | Oregon State         |    200 |   95 | G        |     27 |    NULL |  950000 |
|    429 | Marcin Gortat   | Poland               |    213 |  108 | F-C      |      1 |     420 |  800001 |
|    562 | Kevin Durant    | Texas                |    205 |   97 | G        |     20 |    NULL |  180000 |
|    587 | Shaquille ONeal | Louisiana State      |    215 |  325 | C        |     22 |     584 |  685000 |
+--------+-----------------+----------------------+--------+------+----------+--------+---------+---------+
9 rows in set (0.00 sec)
-- 37
SELECT * FROM jugadores
WHERE (SELECT COUNT(id_equipo) FROM equipos) > 10
LIMIT 10;
+--------+-----------------+----------------+--------+------+----------+--------+---------+---------+
| codigo | nombre          | procedencia    | altura | peso | posicion | equipo | capitan | salario |
+--------+-----------------+----------------+--------+------+----------+--------+---------+---------+
|      1 | Corey Brever    | Florida        |    205 |   83 | F-G      |     19 |    NULL |   10000 |
|      2 | Greg Buckner    | Clemson        |    193 |   95 | G-F      |     19 |       1 |    9000 |
|      3 | Michael Doleac  | Utah           |    210 |  118 | C        |     19 |       1 |   11000 |
|      4 | Randy Foye      | Villanova      |    193 |   96 | G        |     19 |       1 |   12000 |
|      5 | Ryan Gomes      | Providence     |    200 |  113 | F        |     19 |       1 |    8000 |
|      6 | Marko Jaric     | Serbia         |    200 |  113 | G        |     19 |       1 |    8500 |
|      7 | Al Jefferson    | Prentiss Hs    |    208 |  120 | C-F      |     19 |       1 |    9000 |
|      8 | Mark Madsen     | Stanford       |    205 |  113 | C-F      |     19 |       1 |    9500 |
|      9 | Rashard McCants | North Carolina |    193 |   95 | G        |     19 |       1 |    9000 |
|     10 | Chris Richard   | Florida        |    205 |  122 | F        |     19 |       1 |    8000 |
+--------+-----------------+----------------+--------+------+----------+--------+---------+---------+
10 rows in set (0.00 sec)
-- 38
SELECT ((SELECT SUM(j.altura) FROM jugadores j JOIN equipos e ON j.equipo = e.id_equipo WHERE e.nombre = 'Celtics') +
(SELECT SUM(j1.altura) FROM jugadores j1 JOIN equipos e1 ON j1.equipo = e1.id_equipo WHERE e1.nombre = 'Bulls')) AS suma_alturas;
+--------------+
| suma_alturas |
+--------------+
|         6200 |
+--------------+
1 row in set (0.00 sec)
-- 39
SELECT * FROM jugadores 
GROUP BY codigo
HAVING altura > ALL(SELECT altura FROM jugadores WHERE equipo IN (SELECT id_equipo FROM equipos WHERE nombre = "Lakers"));
+--------+--------------------+----------------------+--------+------+----------+--------+---------+---------+
| codigo | nombre             | procedencia          | altura | peso | posicion | equipo | capitan | salario |
+--------+--------------------+----------------------+--------+------+----------+--------+---------+---------+
|     84 | Primoz Brezec      | Slovenia             |    215 |  112 | C        |      2 |      82 |   50000 |
|    105 | Jerome James       | Florida AM           |    215 |   95 | C        |      5 |    NULL |  180000 |
|    153 | Zydrunas Ilgauskas | St. Vincent-St. Mary |    220 |  117 | C        |      7 |     154 |   90000 |
|    324 | Tyson Chandler     | Dominguez HS         |    215 |  106 | C        |     26 |     320 |   50000 |
|    350 | Dikembre Mutombo   | Georgetown           |    225 |  125 | C        |     28 |     340 |   80000 |
|    353 | Loren Woods        | Arizona              |    224 |  140 | C        |     28 |     340 |   90000 |
|    354 | Yao Ming           | China                |    224 |  110 | C        |     28 |     340 |   90000 |
|    391 | Joel Przybilla     | Minnesota            |    215 |  115 | C        |     18 |     381 |   80000 |
|    504 | Kyrylo Fesenko     | Ukranie              |    215 |  288 | C        |     16 |     500 |   80000 |
|    552 | Cheikh Samb        | Senegal              |    215 |  111 | C        |      6 |     540 |   64000 |
|    571 | Robert Swift       | Bakersfield HS       |    215 |  111 | C        |     20 |     562 |   65000 |
|    587 | Shaquille ONeal    | Louisiana State      |    215 |  325 | C        |     22 |     584 |  685000 |
+--------+--------------------+----------------------+--------+------+----------+--------+---------+---------+
12 rows in set (0.00 sec)
-- 40
SELECT j1.* FROM jugadores j1
INNER JOIN jugadores j2 ON j1.codigo = j2.codigo
WHERE j2.capitan != NULL AND j1.salario > j2.salario
GROUP BY j1.equipo;
Empty set (0.00 sec)
-- 41
SELECT jugador,SUM(puntos_por_partido) FROM estadisticas
WHERE jugador IN (SELECT codigo FROM jugadores WHERE nombre="Pau Gasol");
+---------+-------------------------+
| jugador | SUM(puntos_por_partido) |
+---------+-------------------------+
|      66 |      132.19999885559082 |
+---------+-------------------------+
1 row in set (0.00 sec)
-- 42
SELECT COUNT(id_equipo) FROM equipos 
WHERE conferencia = "West";
+------------------+
| COUNT(id_equipo) |
+------------------+
|               15 |
+------------------+
1 row in set (0.00 sec)
-- 43
SELECT equipo,COUNT(codigo) FROM jugadores
WHERE equipo IN (SELECT id_equipo FROM equipos WHERE conferencia="West")
GROUP BY equipo;
+--------+---------------+
| equipo | COUNT(codigo) |
+--------+---------------+
|     16 |            14 |
|     17 |            13 |
|     18 |            15 |
|     19 |            14 |
|     20 |            15 |
|     21 |            15 |
|     22 |            13 |
|     23 |            14 |
|     24 |            15 |
|     25 |            15 |
|     26 |            14 |
|     27 |            15 |
|     28 |            15 |
|     29 |            15 |
|     30 |            14 |
+--------+---------------+
15 rows in set (0.00 sec)
-- 44
SELECT jugador,SUM(puntos_por_partido) FROM estadisticas
WHERE jugador = (SELECT codigo FROM jugadores WHERE codigo=3)
GROUP BY jugador;
+---------+-------------------------+
| jugador | SUM(puntos_por_partido) |
+---------+-------------------------+
|       3 |      46.799999952316284 |
+---------+-------------------------+
1 row in set (0.00 sec)
-- 45
SELECT AVG(puntos_por_partido) FROM estadisticas
WHERE jugador IN (SELECT codigo FROM jugadores WHERE equipo IN (SELECT id_equipo FROM equipos WHERE nombre= "Cavaliers"));
+-------------------------+
| AVG(puntos_por_partido) |
+-------------------------+
|       9.681443330553389 |
+-------------------------+
1 row in set (0.00 sec)
-- 46
SELECT procedencia,COUNT(codigo) FROM jugadores 
GROUP BY procedencia
ORDER BY COUNT(codigo) DESC
LIMIT 10;
+----------------+---------------+
| procedencia    | COUNT(codigo) |
+----------------+---------------+
| Connecticut    |            14 |
| NULL           |            14 |
| Duke           |            12 |
| Arizona        |            11 |
| Florida        |            10 |
| Kentucky       |             9 |
| North Carolina |             9 |
| Texas          |             8 |
| Kansas         |             8 |
| UCLA           |             7 |
+----------------+---------------+
10 rows in set (0.00 sec)
-- 47
SELECT nombre FROM jugadores
WHERE codigo IN (SELECT jugador FROM estadisticas GROUP BY jugador HAVING AVG(puntos_por_partido)>25);
-- 48
SELECT nombre FROM jugadores
WHERE codigo IN (SELECT jugador FROM estadisticas GROUP BY jugador HAVING AVG(puntos_por_partido)>25);
+------------------+
| nombre           |
+------------------+
| Shavlik Randolph |
| LeBron James     |
+------------------+
2 rows in set (0.01 sec)
-- 49
SELECT equipos.nombre,SUM(puntos_local),SUM(puntos_visitante) FROM partidos
INNER JOIN equipos ON equipos.id_equipo = partidos.equipo_local
GROUP BY equipos.id_equipo
HAVING SUM(puntos_local)>SUM(puntos_visitante);
+--------------+-------------------+-----------------------+
| nombre       | SUM(puntos_local) | SUM(puntos_visitante) |
+--------------+-------------------+-----------------------+
| Celtics      |             54500 |                 53674 |
| Nets         |             53962 |                 53402 |
| Knicks       |             54987 |                 52985 |
| Pistons      |             55100 |                 53985 |
| Pacers       |             54091 |                 53263 |
| Hawks        |             54954 |                 54642 |
| Jazz         |             54186 |                 53707 |
| Nuggets      |             54173 |                 54063 |
| Timberwolves |             55471 |                 53951 |
| Supersonics  |             54461 |                 53757 |
| Warriors     |             55562 |                 54352 |
| Clippers     |             54731 |                 53973 |
| Hornets      |             54211 |                 53758 |
| Rockets      |             55158 |                 55053 |
| Mavericks    |             54248 |                 53600 |
| Grizzlies    |             54925 |                 53641 |
+--------------+-------------------+-----------------------+
16 rows in set (0.03 sec)
-- 50
SELECT equipos.nombre,equipo,COUNT(equipo) FROM jugadores 
INNER JOIN equipos ON jugadores.equipo = equipos.id_equipo
WHERE equipo IN (SELECT id_equipo FROM equipos WHERE conferencia="East") AND posicion = "G"
GROUP BY equipo
ORDER BY COUNT(equipo) DESC
LIMIT 2;
+--------+--------+---------------+
| nombre | equipo | COUNT(equipo) |
+--------+--------+---------------+
| Bulls  |      9 |             7 |
| Pacers |      8 |             7 |
+--------+--------+---------------+
2 rows in set (0.00 sec)
-- 51
SELECT nombre,procedencia FROM jugadores
WHERE procedencia IN ("Spain","France") AND posicion="F";
+------------------+-------------+
| nombre           | procedencia |
+------------------+-------------+
| Jorge Garbajosa  | Spain       |
| Mickael Gelabale | France      |
+------------------+-------------+
2 rows in set (0.00 sec)
-- 52
SELECT nombre FROM jugadores 
WHERE procedencia IN ("Spain") AND equipo IN (SELECT id_equipo FROM equipos WHERE nombre="Lakers") AND codigo NOT IN (SELECT jugador FROM estadisticas WHERE puntos_por_partido > 25 GROUP BY jugador);
+-----------+
| nombre    |
+-----------+
| Pau Gasol |
+-----------+
1 row in set (0.00 sec)
-- 53
SELECT nombre FROM jugadores 
WHERE procedencia IN ("Spain") AND equipo IN (SELECT id_equipo FROM equipos WHERE nombre="Lakers") AND codigo IN (SELECT jugador FROM estadisticas WHERE puntos_por_partido > 25 GROUP BY jugador);
Empty set (0.00 sec)


