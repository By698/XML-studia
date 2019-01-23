<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Zadanie 3 XML</title>
        <style>
          table {
            border:3px solid black;
          }
          tr,th,td {
            border:1px solid black;
          }
        </style>
      </head>
      <body style="text-align:center;">
        <h1>Wypożyczalnia filmów</h1>
        <table style="width:75%; margin-left:auto; margin-right:auto; text-align:center;">
          <tr>
            <th colspan="2">Autorzy</th>
          </tr>

          <tr><xsl:for-each select="movieRental/header/authors/author">
              <td style="width:50%;"><xsl:value-of select="current()"/></td>
          </xsl:for-each></tr>

          <tr>
            <th colspan="2">Opis</th>
          </tr>

          <tr>
            <td colspan="2"><xsl:value-of select="movieRental/header/fileDescription"/></td>
          </tr>
		  <tr>
			<th colspan="2">Data wygenerowania</th>
		  </tr>
		  <tr>
			<td colspan="2">
				<xsl:value-of select="/movieRental/header/statistics/reportDate/date"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="/movieRental/header/statistics/reportDate/time"/>
			</td>
		  </tr>
		  <tr>
			<th style="width:50%;">Ilość filmów</th>
			<th style="width:50%;">Ilość klientów</th>
		  </tr>
		  <tr>
			<td style="width:50%;"><xsl:value-of select="/movieRental/header/statistics/numberOfMovies"/></td>
			<td style="width:50%;"><xsl:value-of select="/movieRental/header/statistics/numberOfClients"/></td>
		  </tr>
		  <tr>
			<th colspan="2">Ilość dramatów</th>
		  </tr>
		  <tr>
		  	<td colspan="2"><xsl:value-of select="/movieRental/header/statistics/numberOfDramas"/></td>
		  </tr>
        </table>
        <xsl:for-each select="movieRental/movies/movie">
          <table style="width:50%; margin-left:auto; margin-right:auto; text-align:center;">
            <tr>
              <th colspan="2"><xsl:value-of select="title"/></th>
            </tr>
            <tr>
              <td style="width:20%;">Reżyser</td>
              <td><xsl:value-of select="director"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Gatunek</td>
              <td><xsl:value-of select="genre"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Ocena</td>
              <td><xsl:value-of select="rating"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Opis</td>
              <td><xsl:value-of select="description"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Cena</td>
              <td><xsl:value-of select="price"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Uzyskany profit</td>
              <td><xsl:value-of select="profit"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Ilość wypożyczeń</td>
              <td><xsl:value-of select="borrowsNumber"/></td>
            </tr>
            <tr>
              <td style="width:20%;">Aktualne wypożyczenia</td>
              <td>
                <ul>
                  <xsl:for-each select="borrows/borrow">
                    <li>
                      <p><xsl:value-of select="clientName"/></p>
                      <p><xsl:text>ID: </xsl:text><xsl:value-of select="clientID"/></p>
                      <p><xsl:text>Wypożyczone od </xsl:text>
                      <xsl:value-of select="borrowDate"/>
                      <xsl:text> do </xsl:text>
                      <xsl:value-of select="returnDate"/></p>
                      <hr/>
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
          </table>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>
</xsl:transform>
