
SELECT ROUND(AVG(budget),2) AS avgBudget
FROM MOVIE


SELECT SUM(revenue) AS "revenue French movies"
FROM MOVIE
INNER JOIN Country ON countryFunder = idCountry
WHERE nameCountryEN = "France"


SELECT COUNT(*) AS nbLocationsAll,
COUNT(city) AS nbLocationsInCity,
COUNT(country) AS nbLocationsInCountry
FROM Location


SELECT nameTrip, MAX(duration) AS maxDuration
FROM Trip T
INNER JOIN Stage S ON T.idTrip = S.trip
GROUP BY T.idTrip, nameTrip


SELECT M.idMovie, titleMovie, COUNT(city) AS nbFilmingInCity 
FROM Movie M
INNER JOIN FILMING F ON M.idMovie = F.idMovie
INNER JOIN Location L ON L.idLocation = F.idLocation
WHERE yearRelease = 1994
GROUP BY M.idMovie, titleMovie


SELECT M.idMovie, titleMovie, COUNT(*) AS nbFilmingNotInCity 
FROM Movie M
INNER JOIN FILMING F ON M.idMovie = F.idMovie
INNER JOIN Location L ON L.idLocation = F.idLocation
WHERE yearRelease = 1994
AND city IS NULL
GROUP BY M.idMovie, titleMovie



SELECT M.idMovie, titleMovie, (COUNT(*)-COUNT(city)) AS nbFilmingNotInCity 
FROM Movie M
INNER JOIN FILMING F ON M.idMovie = F.idMovie
INNER JOIN Location L ON L.idLocation = F.idLocation
WHERE yearRelease = 1994
GROUP BY M.idMovie, titleMovie



SELECT M.idMovie, titleMovie, COUNT(*) AS nbFilming
FROM Movie M
INNER JOIN FILMING F ON M.idMovie = F.idMovie
WHERE yearRelease >= 2001
GROUP BY M.idMovie, titleMovie
HAVING nbFilming >= 30


SELECT nameCity, COUNT(*) AS nbFilming
FROM Movie M
INNER JOIN FILMING F ON M.idMovie = F.idMovie
INNER JOIN Location L ON L.idLocation = F.idLocation
INNER JOIN City C ON C.idCity = L.city 
GROUP BY C.idCity, nameCity 
HAVING nbFilming > 1 and AVG(revenue) >= 1000000000