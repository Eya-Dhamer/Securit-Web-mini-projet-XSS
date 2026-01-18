<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fiche de Question - Version NON SÉCURISÉE (XSS)</title>
    <style>
        /* Styles Généraux et Typographie */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f9; /* Arrière-plan doux */
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1, h2 {
            color: #007bff; /* Bleu principal */
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }

        /* Formulaire */
        .form-container {
            border: 1px solid #ced4da; /* Bordure plus douce */
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 6px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box; /* Inclut padding et bordure dans la largeur */
            resize: vertical;
        }
        button[type="submit"] {
            background-color: #28a745; /* Vert pour 'Déposer' */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #218838;
        }

        /* Historique */
        .historique-container {
            margin-top: 20px;
            border: 1px solid #dee2e6; /* Bordure claire */
            padding: 15px;
            border-radius: 6px;
            background-color: #e9ecef; /* Léger fond gris pour l'historique */
        }
        .question-item {
            border-bottom: 1px solid #ccc; /* Ligne de séparation plus visible */
            padding: 10px 0;
            word-wrap: break-word; /* Important pour les longs scripts */
        }
        .question-item:last-child {
            border-bottom: none;
        }

        /* Style de Sécurité/Avertissement */
        .warning {
            color: #dc3545; /* Rouge d'alerte */
            font-weight: bold;
            background-color: #f8d7da; /* Fond rose pâle */
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Déposer une Question (Version NON SÉCURISÉE)</h1>

        <p class="warning">
            ⚠️ ATTENTION : Cette application est **vulnérable au XSS stocké**. Le contenu est affiché tel quel.
        </p>

        <div class="form-container">
            <form method="POST" action="questions">
                <label for="question">Votre question :</label><br>
                <textarea id="question" name="question" rows="4" cols="50" required placeholder="Saisissez ici votre question... ou votre script malveillant."></textarea><br><br>
                <button type="submit">Déposer</button>
            </form>
        </div>

        <hr>

        <h2>Historique des Questions</h2>
        <div class="historique-container">
            <c:choose>
                <c:when test="${not empty historiqueQuestions}">
                    <c:forEach var="q" items="${historiqueQuestions}">
                        <div class="question-item">
                            ${q}
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>Aucune question déposée pour l'instant.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</body>
</html>