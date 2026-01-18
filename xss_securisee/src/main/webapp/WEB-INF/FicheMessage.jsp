<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fiche de Question Sécurisée - Stylish</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        /* Variables */
        :root {
            --couleur-primaire: #007bff;
            --couleur-secondaire: #6c757d;
            --couleur-fond: #f4f7f6; /* Fond très léger */
            --couleur-bordure: #dee2e6;
            --couleur-success: #28a745;
            --couleur-texte: #343a40;
            --couleur-icone: #17a2b8; /* Bleu-cyan pour les icônes */
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--couleur-fond);
            color: var(--couleur-texte);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container {
            width: 100%;
            max-width: 900px;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15); /* Ombre plus marquée */
        }

        /* Titres */
        h1, h2 {
            color: var(--couleur-texte);
            padding-bottom: 10px;
            margin-top: 0;
            display: flex;
            align-items: center;
        }

        h1 {
            border-bottom: 3px solid var(--couleur-primaire);
        }

        h1 i {
            margin-right: 15px;
            color: var(--couleur-primaire);
            font-size: 1.2em;
        }

        /* Formulaire */
        form {
            padding: 20px 0;
            border-bottom: 1px solid var(--couleur-bordure);
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 1.1em;
        }

        textarea {
            width: 100%; /* Pleine largeur */
            padding: 12px;
            border: 1px solid var(--couleur-bordure);
            border-radius: 6px;
            box-sizing: border-box;
            resize: vertical;
            transition: border-color 0.3s;
        }

        textarea:focus {
            border-color: var(--couleur-primaire);
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
            outline: none;
        }

        /* Bouton */
        button[type="submit"] {
            background-color: var(--couleur-success);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 700;
            transition: background-color 0.3s ease, transform 0.1s;
            margin-top: 20px;
            box-shadow: 0 4px 6px rgba(40, 167, 69, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        button[type="submit"]:hover {
            background-color: #1e7e34;
            transform: translateY(-1px);
        }

        button i {
            margin-right: 8px;
        }

        /* Historique */
        .historique {
            margin-top: 20px;
        }

        .historique h2 {
            border-bottom: 2px solid var(--couleur-success);
        }

        .historique h2 i {
            margin-right: 10px;
            color: var(--couleur-success);
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background-color: #e9f5ee; /* Vert très léger pour indiquer 'sécurité' */
            border-left: 5px solid var(--couleur-success); /* Barre latérale verte */
            padding: 15px;
            margin-bottom: 12px;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            line-height: 1.6;
            word-wrap: break-word;
        }

        li::before {
            /* Icône devant chaque question */
            content: "\f05a"; /* Code pour fa-circle-info (ou fa-comment) */
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: var(--couleur-icone);
            margin-right: 10px;
            display: inline-block;
        }

        /* Message si aucun historique */
        .historique p {
            color: var(--couleur-secondaire);
            font-style: italic;
            padding: 15px;
            border: 1px dashed var(--couleur-bordure);
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-question-circle"></i> Formulaire de Fiche de Question</h1>

        <form method="POST" action="questions">
            <label for="question_contenu">Saisir une question:</label>
            <textarea id="question_contenu" name="question" rows="4" required placeholder="Tapez votre question ici. Le contenu est encodé en sortie pour votre sécurité."></textarea>
            <button type="submit"><i class="fas fa-paper-plane"></i> Déposer</button>
        </form>

        <div class="historique">
            <h2><i class="fas fa-history"></i> Historique des Questions</h2>

            <c:if test="${empty historiqueQuestions}">
                <p>Aucune question déposée pour l'instant. Votre historique sera affiché ici.</p>
            </c:if>

            <ul>
                <c:forEach var="questionText" items="${historiqueQuestions}">
                    <li>
                        <c:out value="${questionText}" />
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</body>
</html>