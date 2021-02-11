SELECT apellido1, apellido2, nombre FROM persona WHERE tipo IN ('alumno') ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo IN ('alumno') AND telefono IS NULL 
SELECT * FROM persona WHERE tipo IN ('alumno') AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'
SELECT * FROM persona WHERE (tipo IN ('profesor')) AND (telefono IS NULL) AND (nif LIKE '%K')
SELECT * FROM asignatura WHERE (cuatrimestre = 1) AND (curso=3) AND (id_grado = 7)
SELECT apellido1, apellido2, pe.nombre, d.nombre  FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor JOIN departamento d ON d.id = pr.id_departamento 
SELECT asi.nombre, anyo_inicio, anyo_fin FROM alumno_se_matricula_asignatura a JOIN persona p ON p.id = a.id_alumno JOIN curso_escolar c ON c.id = a.id_curso_escolar JOIN asignatura asi ON asi.id=a.id_asignatura WHERE nif LIKE '%26902806M%'
SELECT DISTINCT de.nombre FROM grado g JOIN asignatura a ON g.id = a.id_grado JOIN profesor p ON a.id_profesor=p.id_profesor JOIN departamento de ON de.id=p.id_departamento  WHERE g.nombre LIKE '%Grado en Ingeniería Informática (plan 2015)%'
SELECT distinct p.nombre FROM curso_escolar cu JOIN alumno_se_matricula_asignatura al ON cu.id = al.id_curso_escolar JOIN persona p ON p.id = al.id_alumno WHERE anyo_inicio = 2018