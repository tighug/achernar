LOAD DATA LOCAL INFILE "/docker-entrypoint-initdb.d/feeders.csv" INTO TABLE `Feeder` FIELDS TERMINATED BY "," ENCLOSED BY "" LINES TERMINATED BY "\n";
LOAD DATA LOCAL INFILE "/docker-entrypoint-initdb.d/nodes.csv" INTO TABLE `Node` FIELDS TERMINATED BY "," ENCLOSED BY "" LINES TERMINATED BY "\n";
LOAD DATA LOCAL INFILE "/docker-entrypoint-initdb.d/lines.csv" INTO TABLE `Line` FIELDS TERMINATED BY "," ENCLOSED BY "" LINES TERMINATED BY "\n";
LOAD DATA LOCAL INFILE "/docker-entrypoint-initdb.d/samples.csv" INTO TABLE `Sample` FIELDS TERMINATED BY "," ENCLOSED BY "" LINES TERMINATED BY "\n";
