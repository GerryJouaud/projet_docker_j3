CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
('Alice Dubois', 'alice.dubois@test.com'),
('Bernard Martin', 'bernard.martin@test.com'),
('Charles Petit', 'charles.petit@test.com');

INSERT INTO posts (title, content, user_id) VALUES
('Analyse des Systemes Complexes', 'Une plongee dans les dynamiques non-lineaires et la pensee arborescente...', 1),
('L Art de l Ecriture Intuitive', 'Comment lier l hypersensibilite a la creativite litteraire.', 1),
('Strategie et Controle', 'Trouver l equilibre entre l intensite de l action et le besoin de stabilite.', 1),
('Developpement Front-end 2025', 'Les nouvelles tendances des frameworks JS.', 2),
('Optimisation de base de donnees PostgreSQL', 'Utilisation de pg_stat_statements et d index avances.', 2),
('Gestion de Projet Agile', 'Methodes pour des sprints efficaces et une communication sincere.', 2),
('La Philosophie du Code Propre', 'Rejeter la superficialite dans l architecture logicielle.', 2),
('Voyage en terre inconnue', 'Recit d une aventure en Patagonie et gestion de la peur de la perte.', 3),
('Photographie nocturne', 'Capturer l intensite et les nuances du ciel profond.', 3),
('Essai sur la reconnaissance', 'Le besoin d affirmation et le role de la critique.', 3);