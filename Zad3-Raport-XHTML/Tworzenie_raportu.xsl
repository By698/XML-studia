<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" version="1.0" />
  <xsl:template match="/">
    <movieRental>
      <header>
        <authors>
          <xsl:for-each select="movieRental/header/authors/author">
            <author>
              <xsl:value-of select="current()"/>
            </author>
          </xsl:for-each>
        </authors>
        <fileDescription>
          <xsl:value-of select="movieRental/header/fileDescription"/>
        </fileDescription>

        <statistics>
          <reportDate>
            <date>
              <xsl:value-of select="current-date()"/>
            </date>
            <time>
              <xsl:value-of select="current-time()"/>
            </time>
          </reportDate>
          <numberOfMovies>
            <xsl:value-of select="count(/movieRental/movies/movie)"/>
          </numberOfMovies>
          <numberOfClients>
            <xsl:value-of select="count(/movieRental/borrows/borrow)"/>
          </numberOfClients>
          <numberOfDramas>
            <xsl:value-of select="count(/movieRental/movies/movie[@genre='Dramat'])"/>
          </numberOfDramas>
        </statistics>
      </header>




      <movies>
        <xsl:for-each select="movieRental/movies/movie">
          <xsl:sort select="rating" data-type="number" order="descending"/>
          <movie>
            <title>
              <xsl:value-of select="title"/>
              <xsl:text></xsl:text>(              <xsl:value-of select="year"/>
)</title>
            <genre>
              <xsl:value-of select="@genre"/>
            </genre>
            <director>
              <xsl:value-of select="director"/>
            </director>
            <rating>
              <xsl:value-of select="rating"/>
            </rating>
            <description>
              <xsl:value-of select="description"/>
            </description>
            <price>
              <xsl:value-of select="price"/>
              <xsl:text></xsl:text>
              <xsl:value-of select="price/@currency"/>
            </price>
            <borrowsNumber>
              <xsl:value-of select="borrowsNumber"/>
            </borrowsNumber>
            <profit>
              <xsl:value-of select="format-number(price * borrowsNumber,'###.##')" />
              <xsl:text></xsl:text>
              <xsl:value-of select="price/@currency"/>
            </profit>
            <xsl:variable name="movieID" select="@id"/>
            <borrows>
              <xsl:for-each select="/movieRental/borrows/borrow">
                <xsl:sort select="lastname"/>
                <xsl:variable name="borrowedMovieID" select="borrowedMovie/@id"/>
                <xsl:if test="$borrowedMovieID=$movieID">
                  <borrow>
                    <clientID>
                      <xsl:value-of select="client/@id"/>
                    </clientID>
                    <clientName>
                      <xsl:value-of select="client/firstname"/>
                      <xsl:text></xsl:text>
                      <xsl:value-of select="client/lastname"/>
                    </clientName>
                    <borrowDate>
                      <xsl:value-of select="borrowDate"/>
                    </borrowDate>
                    <returnDate>
                      <xsl:value-of select="returnDate"/>
                    </returnDate>
                  </borrow>
                </xsl:if>
              </xsl:for-each>
            </borrows>
          </movie>
        </xsl:for-each>
      </movies>

    </movieRental>
  </xsl:template>
</xsl:transform>
