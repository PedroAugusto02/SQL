DROP TABLE IF EXISTS conjunto;

CREATE TABLE conjunto (
	id_conjunto INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(1) NOT NULL,
	elemento INTEGER NOT NULL
);

INSERT INTO conjunto (elemento, nome) VALUES 
(1, 'A'), (2, 'A'), (6, 'A'), (7, 'A'), (9, 'A'), (15, 'A'),
(2, 'B'), (5, 'B'), (6, 'B'), (8, 'B'), (15, 'B'), (16, 'B'),
(6, 'C'), (15, 'C'), (16, 'C'), (17, 'C'), (19, 'C'), (20, 'C');

SELECT "INTERSECÇÃO entre o conunto A e o conjunto B" as "LOG";
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'B' AND 
	conjunto.elemento IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'A'
	) ;

SELECT "INTERSECÇÃO entre o conunto B e o conjunto C" as "LOG";
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'B' AND 
	conjunto.elemento IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'C'
	) ;
	
SELECT "INTERSECÇÃO entre o conunto A e o conjunto C" as "LOG";
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'C' AND 
	conjunto.elemento IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'A'
	) ;

SELECT "Apenas no A" as "LOG";
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'A' AND 
	conjunto.elemento NOT IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'B'
	) AND
	conjunto.elemento NOT IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'C'
	)
;

SELECT "Apenas no B" as "LOG";
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'B' AND 
	conjunto.elemento NOT IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'A' OR nome = 'C'
		);
SELECT "Apenas no C" as "LOG";
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'C' AND 
	conjunto.elemento NOT IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'A' OR nome = 'B'
	);
SELECT "Intersecção entre A, B e C" as "LOG";
SELECT
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'A' AND 
	conjunto.elemento IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'B' AND
			conjunto.elemento IN (
				SELECT 
					conjunto.elemento 
				FROM
					conjunto
				WHERE
					nome = 'C'
			))
UNION
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'B' AND 
	conjunto.elemento IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'A' AND
			conjunto.elemento IN (
				SELECT 
					conjunto.elemento 
				FROM
					conjunto
				WHERE
					nome = 'C'
			))
UNION
SELECT 
	conjunto.elemento
FROM
	conjunto
WHERE
	nome = 'C' AND 
	conjunto.elemento IN (
		SELECT 
			conjunto.elemento 
		FROM
			conjunto
		WHERE
			nome = 'A' AND
			conjunto.elemento IN (
				SELECT 
					conjunto.elemento 
				FROM
					conjunto
				WHERE
					nome = 'B'
			));
