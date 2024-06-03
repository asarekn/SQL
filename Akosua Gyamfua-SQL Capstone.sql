/* list all players and ther corresponding teams */
SELECT Player, Team FROM players;

/* list of distinct teams */
SELECT DISTINCT Team FROM players;

/* number of players under the distinct teams */
SELECT Team, Count(*) AS Number_of_Players
FROM players
GROUP BY Team;

/* players in Kansas City Kings */
SELECT Player FROM players
WHERE Team = "Kansas City Kings";

/* average height_cm and weight_kg of players */
SELECT AVG(Height_CM) AS Average_Height_CM, AVG(Weight_KG) AS Average_Weight_KG
FROM players;

/* number of players in each conference */
SELECT Conference, COUNT(*) AS Number_of_Players
FROM Players
GROUP BY Conference;

/* youngest player */
SELECT DISTINCT Player, Age
FROM Players
ORDER BY Age ASC LIMIT 1;

/* total number of players */
SELECT COUNT(DISTINCT Player) AS Total_Number_of_Players
FROM players;

/* distinct draft_years */
SELECT DISTINCT Draft_Year 
FROM players
ORDER BY Draft_Year ASC;

/* players drafted in  draft_years */
SELECT DISTINCT Draft_Year, COUNT(*) AS Number_of_Players, GROUP_CONCAT(Player) AS Players
FROM players
GROUP BY Draft_Year
ORDER BY Draft_Year ASC;

/* sum of seasons played */
SELECT SUM(Seasons_in_league) AS Total_Seasons
FROM players;

/* players with age above 30 */
SELECT DISTINCT Player FROM players
WHERE Age>30;

/* players who have played above 10 seasons and their positions*/
SELECT DISTINCT Player, `Position`
FROM players
WHERE Seasons_in_league>10;

/* players with their draft year and pre draft team */
SELECT DISTINCT Player, Draft_Year, Predraft_Team 
FROM players
ORDER BY Draft_Year;

/* number of players by position */
SELECT `Position`, COUNT(*) AS Number_of_Players
FROM players
GROUP BY `Position`;




