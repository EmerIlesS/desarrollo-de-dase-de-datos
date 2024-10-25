USE app_raices;

-- Consultas con LEFT JOIN
-- 1. Lista de todos los idiomas y las lecciones, incluso si no tienen lecciones asociadas
SELECT lan.name, l.title
FROM languages AS lan
LEFT JOIN lessons AS l ON lan.idLanguage = l.idLanguage;

-- 2. Mostrar todos los niveles y las lecciones, incluso si no están asignadas a ningún nivel
SELECT lvl.name, l.title
FROM levels AS lvl
LEFT JOIN lessons AS l ON lvl.idLevel = l.idLevel;

-- 3. Obtener todas las contribuciones y los usuarios que las realizaron, incluso si no han realizado ninguna
SELECT c.description, u.mail
FROM contributions AS c
LEFT JOIN users AS u ON c.idUser = u.idUser;

-- 4. Listar todas las lecciones y los idiomas, incluso si no están asociados a un idioma
SELECT l.title, lang.name
FROM lessons AS l
LEFT JOIN languages AS lang ON l.idLanguage = lang.idLanguage;

-- 5. Obtener todos los archivos multimedia y sus descripciones, incluso si no tienen contenido asociado
SELECT mf.media, c.description
FROM mediaFiles AS mf
LEFT JOIN content AS c ON mf.idMediaFile = c.idMediaFile;

-- 6. Lista de todas las lecciones y el estado de progreso, incluso si no hay progreso asociado
SELECT l.title, s.name
FROM lessons AS l
LEFT JOIN progress AS p ON l.idLesson = p.idLesson
LEFT JOIN state AS s ON p.idState = s.idState;

-- 7. Mostrar todos los usuarios y sus progresos, incluso si no han registrado ningún progreso
SELECT u.mail, pr.initDate, pr.endDate
FROM users AS u
LEFT JOIN userProgress AS up ON u.idUser = up.idUser
LEFT JOIN progress AS pr ON up.idProgress = pr.idProgress;

-- 8. Listado de todos los usuarios y los roles, incluidos si no tienen roles asignados
SELECT u.mail, r.name
FROM users AS u
LEFT JOIN userRol AS ur ON u.idUser = ur.idUser
LEFT JOIN roles AS r ON ur.idRol = r.idRol;

-- 9. Obtener todas las lecciones y los usuarios que las están tomando, aunque no estén tomando ninguna
SELECT l.title, u.mail
FROM lessons AS l
LEFT JOIN userLesson AS ul ON l.idLesson = ul.idLesson
LEFT JOIN users AS u ON ul.idUser = u.idUser;

-- 10. Listar todas las lecciones y sus contribuciones, aunque no tengan ninguna contribución
SELECT l.title, c.description
FROM lessons AS l
LEFT JOIN contributions AS c ON l.idLesson = c.idLesson;

-- Consultas con RIGHT JOIN
-- 1. Mostrar todas las lecciones y los usuarios que las han tomado, aunque no haya usuarios inscritos
SELECT l.title, u.mail
FROM users AS u
RIGHT JOIN userLesson AS ul ON u.idUser = ul.idUser
RIGHT JOIN lessons AS l ON ul.idLesson = l.idLesson;

-- 2. Obtener todos los roles y los usuarios que los tienen aunque no todos los roles se encuentren asignados
SELECT r.name, u.mail
FROM users AS u
RIGHT JOIN userRol AS ur ON u.idUser = ur.idUser
RIGHT JOIN roles AS r ON ur.idRol = r.idRol;

-- 3. Listar todos los usuarios y su progreso, aunque no tengan progreso registrado
SELECT u.mail, pr.initDate, pr.endDate
FROM users AS u
RIGHT JOIN userProgress AS up ON u.idUser = up.idUser
RIGHT JOIN progress AS pr ON up.idProgress = pr.idProgress;

-- 4. Mostrar todos los idiomas y las lecciones asociadas, aunque no haya lecciones asignadas a un idioma
SELECT lang.name, l.title
FROM languages AS lang
RIGHT JOIN lessons AS l ON lang.idLanguage = l.idLanguage;

-- 5. Obtener todas las contribuciones y sus descripciones, aunque no haya contribuciones registradas
SELECT u.mail, c.description
FROM users AS u
RIGHT JOIN contributions AS c ON u.idUser = c.idUser;

-- 6. Lista de todos los niveles y las lecciones asociadas, aunque no haya lecciones para un nivel
SELECT lvl.name, l.title
FROM levels AS lvl
RIGHT JOIN lessons AS l ON lvl.idLevel = l.idLevel;

-- 7. Mostrar todas las lecciones y el estado de progreso aunque no se haya progreso registrado
SELECT l.title, s.name
FROM lessons AS l
RIGHT JOIN progress AS p ON l.idLesson = p.idLesson
RIGHT JOIN state AS s ON p.idState = s.idState;

-- 8. Obtener todos los archivos multimedia y el contenido asociado, aunque no estén en uso
SELECT m.media, c.description
FROM mediaFiles AS m
RIGHT JOIN content AS c ON m.idMediaFile = c.idMediaFile;

-- 9. Listar todos los roles, incluso si no están asignados a ningún usuario
SELECT r.name, u.mail
FROM roles AS r
RIGHT JOIN userRol AS ur ON r.idRol = ur.idRol
RIGHT JOIN users AS u ON ur.idUser = u.idUser;

-- 10. Mostrar todas las lecciones y sus contenidos, incluso si no tienen contenido asociado
SELECT l.title, c.description
FROM lessons AS l
RIGHT JOIN content AS c ON l.idLesson = c.idLesson;

-- Consultas con CROSS JOIN
-- 1. Obtener todas las combinaciones de usuarios y lecciones
SELECT u.mail, l.title
FROM users AS u
CROSS JOIN lessons AS l;

-- 2. Listar todas las combinaciones de roles y usuarios
SELECT r.name, u.mail
FROM roles AS r
CROSS JOIN users AS u;

-- 3. Mostrar todas las combinaciones de usuarios y niveles
SELECT u.mail, lvl.name
FROM users AS u
CROSS JOIN levels AS lvl;

-- 4. Obtener todas las combinaciones de idiomas y lecciones
SELECT lang.name, l.title
FROM languages AS lang
CROSS JOIN lessons AS l;

-- 5. Listar todas las combinaciones de usuarios y archivos multimedia
SELECT u.mail, mf.media
FROM users AS u
CROSS JOIN mediaFiles AS mf;
