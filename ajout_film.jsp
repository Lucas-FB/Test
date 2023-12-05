<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MySQL via JSP</h1>
    <form action = "modif_film.jsp" method = "GET">
       ID du film: <input type = "text" name = "id_film">
       <br />
       Titre: <input type = "text" name = "titre" />
       <br />
       Année: <input type = "text" name = "annee" />
       <br />
       Genre: <input type = "text" name = "genre" />
       <br />
       Résumé: <input type = "text" name = "resume" />
       <br />
       ID du réalisateur: <input type = "text" name = "id_real" />
       <br />
       Code pays: <input type = "text" name = "code_pays" />
       <input type = "submit" value = "Submit" />
    </form>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";
    String id_film = request.getParameter("id_film");
    String nouveau_nom = request.getParameter("nouveau_nom");

        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
Connection conn = DriverManager.getConnection(url, user, password);
            // Exemple de requête SQL
        String sql = "UPDATE Film SET titre = '"+nouveau_nom+"' WHERE idFilm = "+id_film+";";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>
</body>
</html>
