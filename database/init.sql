CREATE TABLE Users(
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
    created_at DATETIME NOT NULL, 
    updated_at DATETIME NOT NULL
)

CREATE TABLE Posts(
    id INT PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL, 
    content TEXT NULL, 
    user_id INT NOT NULL, 
    created_at DATETIME NOT NULL, 
    updated_at DATETIME NOT NULL
)

INSERT INTO Users (name, email) VALUES
('Alice Dubois', 'alice.dubois@test.com'),
('Bernard Martin', 'bernard.martin@test.com'),
('Charles Petit', 'charles.petit@test.com');


INSERT INTO Posts (title, content, user_id) VALUES
-- Posts d'Alice (user_id = 1)
('Analyse des Systèmes Complexes', 'Une plongée dans les dynamiques non-linéaires et la pensée arborescente...', 1),
('L''Art de l''Écriture Intuitive', 'Comment lier l''hypersensibilité à la créativité littéraire.', 1),
('Stratégie et Contrôle', 'Trouver l''équilibre entre l''intensité de l''action et le besoin de stabilité.', 1),

-- Posts de Bernard (user_id = 2)
('Développement Front-end 2025', 'Les nouvelles tendances des frameworks JS.', 2),
('Optimisation de base de données PostgreSQL', 'Utilisation de pg_stat_statements et d''index avancés.', 2),
('Gestion de Projet Agile', 'Méthodes pour des sprints efficaces et une communication sincère.', 2),
('La Philosophie du Code Propre', 'Rejeter la superficialité dans l''architecture logicielle.', 2),

-- Posts de Charles (user_id = 3)
('Voyage en terre inconnue', 'Récit d''une aventure en Patagonie et gestion de la peur de la perte.', 3),
('Photographie nocturne', 'Capturer l''intensité et les nuances du ciel profond.', 3),
('Essai sur la reconnaissance', 'Le besoin d''affirmation et le rôle de la critique.', 3);