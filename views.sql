-- 1. Exibir lista de alunos e seus cursos
SELECT view_alunos_disciplinas_cursos AS
SELECT a.nome AS aluno, d.nome AS disciplina, c.nome AS curso
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
JOIN disciplinas d ON m.disciplina_id = d.id
JOIN cursos c ON d.curso_id = c.id;

-- 2. Exibir total de alunos por disciplina
SELECT view_total_alunos_por_disciplina AS
SELECT d.nome AS disciplina, COUNT(m.aluno_id) AS total_alunos
FROM disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
GROUP BY d.nome;

-- 3. Exibir alunos e status das suas matrículas
SELECT view_alunos_status_matriculas AS
SELECT a.nome AS aluno, d.nome AS disciplina, m.status
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
JOIN disciplinas d ON m.disciplina_id = d.id;

-- 4. Exibir professores e suas turmas
SELECT view_professores_turmas AS
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM professores p
JOIN turmas t ON p.id = t.professor_id
JOIN disciplinas d ON t.disciplina_id = d.id;

-- 5. Exibir alunos maiores de 20 anos
SELECT view_alunos_maiores_20 AS
SELECT nome, data_nascimento
FROM alunos
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;

-- 6. Exibir disciplinas e carga horária total por curso
SELECT view_carga_horaria_cursos AS
SELECT c.nome AS curso, COUNT(d.id) AS total_disciplinas, SUM(d.carga_horaria) AS total_carga_horaria
FROM cursos c
JOIN disciplinas d ON c.id = d.curso_id
GROUP BY c.nome;

-- 7. Exibir professores e suas especialidades
SELECT view_professores_especialidades AS
SELECT nome, especialidade
FROM professores;

-- 8. Exibir alunos matriculados em mais de uma disciplina
SELECT view_alunos_mais_uma_disciplina AS
SELECT a.nome AS aluno, COUNT(m.disciplina_id) AS total_disciplinas
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome
HAVING COUNT(m.disciplina_id) > 1;

-- 9. Exibir alunos e o número de disciplinas que concluíram
SELECT view_alunos_disciplinas_concluidas AS
SELECT a.nome AS aluno, COUNT(m.disciplina_id) AS disciplinas_concluidas
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Concluído'
GROUP BY a.nome;

-- 10. Exibir todas as turmas de um semestre específico
SELECT view_turmas_semestre AS
SELECT t.*
FROM turmas t
WHERE t.semestre = '2024.1';

-- 11. Exibir alunos com matrículas trancadas
SELECT view_alunos_matriculas_trancadas AS
SELECT a.nome AS aluno
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Trancado';

-- 12. Exibir disciplinas que não têm alunos matriculados
SELECT view_disciplinas_sem_alunos AS
SELECT d.nome AS disciplina
FROM disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
WHERE m.aluno_id IS NULL;

-- 13. Exibir a quantidade de alunos por status de matrícula
SELECT view_total_alunos_por_status AS
SELECT m.status, COUNT(m.aluno_id) AS total_alunos
FROM matriculas m
GROUP BY m.status;

-- 14. Exibir o total de professores por especialidade
SELECT view_total_professores_por_especialidade AS
SELECT p.especialidade, COUNT(p.id) AS total_professores
FROM professores p
GROUP BY p.especialidade;

-- 15. Exibir lista de alunos e suas idades
SELECT view_alunos_idades AS
SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM alunos;

-- 16. Exibir alunos e suas últimas matrículas
SELECT view_alunos_ultimas_matriculas AS
SELECT a.nome AS aluno, MAX(m.data_matricula) AS ultima_matricula
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome;

-- 17. Exibir todas as disciplinas de um curso específico
SELECT view_disciplinas_curso AS
SELECT d.*
FROM disciplinas d
JOIN cursos c ON d.curso_id = c.id
WHERE c.nome = 'Engenharia de Software';

-- 18. Exibir os professores que não têm turmas
SELECT view_professores_sem_turmas AS
SELECT p.nome AS professor
FROM professores p
LEFT JOIN turmas t ON p.id = t.professor_id
WHERE t.professor_id IS NULL;

-- 19. Exibir lista de alunos com CPF e email
SELECT view_alunos_cpf_email AS
SELECT nome, cpf, email
FROM alunos;

-- 20. Exibir o total de disciplinas por professor
SELECT view_total_disciplinas_por_professor AS
SELECT p.nome AS professor, COUNT(t.disciplina_id) AS total_disciplinas
FROM professores p
JOIN turmas t ON p.id = t.professor_id
GROUP BY p.nome;