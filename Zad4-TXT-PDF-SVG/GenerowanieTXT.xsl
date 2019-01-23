<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" indent="yes" version="1.0"/>

    <xsl:variable name='newline'><xsl:text>
    </xsl:text></xsl:variable>

    <xsl:variable name='starline'><xsl:text>
    ***********************************************************
    </xsl:text></xsl:variable>
    <xsl:variable name='line'><xsl:text>
    ___________________________________________________________
    </xsl:text></xsl:variable>
    <xsl:variable name='tab'><xsl:text>&#x9;</xsl:text></xsl:variable>

    <xsl:template match="/movieRental">
            Autorzy dokumentu:
        <xsl:value-of select="$newline"></xsl:value-of>
        <xsl:for-each select="header/authors/author">
            <xsl:value-of select="concat('- ', current(), $newline)"></xsl:value-of>
        </xsl:for-each>
            Opis dokumentu:
        <xsl:value-of select="$newline"></xsl:value-of>
        <xsl:value-of select="concat(header/fileDescription, $newline)"></xsl:value-of>
        <xsl:value-of select="$newline"></xsl:value-of>
        <xsl:value-of select="$line"></xsl:value-of>
            Lista filmów:
        <xsl:value-of select="$newline"></xsl:value-of>

        <xsl:for-each select="movies/movie">
            <xsl:value-of select="concat(genre, ' - ', title, $newline)"></xsl:value-of>
            <xsl:value-of select="concat('Reżyser: ', director, $newline)"></xsl:value-of>
            <xsl:value-of select="concat('Ocena: ', rating, $newline)"></xsl:value-of>
            <xsl:value-of select="concat('Cena: ', price, price/@currency, $newline)"></xsl:value-of>
            <xsl:variable name="description"><xsl:value-of select="substring(description, 0, 100)"></xsl:value-of></xsl:variable>
            <xsl:value-of select="concat($description, '...', $newline)"></xsl:value-of>
                Lista wypożyczeń:
            <xsl:value-of select="$newline"></xsl:value-of>
            <xsl:for-each select="borrows/borrow">
                <xsl:value-of select="concat(clientID, ' | ', clientName, ': ')"></xsl:value-of>
                <xsl:variable name="bDay"><xsl:value-of select="substring(borrowDate, 9, 2)"></xsl:value-of></xsl:variable>
                <xsl:variable name="bMonth"><xsl:value-of select="substring(borrowDate, 6, 2)"></xsl:value-of></xsl:variable>
                <xsl:variable name="bYear"><xsl:value-of select="substring(borrowDate, 1, 4)"></xsl:value-of></xsl:variable>
                <xsl:variable name="rDay"><xsl:value-of select="substring(returnDate, 9, 2)"></xsl:value-of></xsl:variable>
                <xsl:variable name="rMonth"><xsl:value-of select="substring(returnDate, 6, 2)"></xsl:value-of></xsl:variable>
                <xsl:variable name="rYear"><xsl:value-of select="substring(returnDate, 1, 4)"></xsl:value-of></xsl:variable>
                <xsl:variable name="borrowDate"><xsl:value-of select="concat($bDay, '/', $bMonth, '/', $bYear)"></xsl:value-of></xsl:variable>
                <xsl:variable name="returnDate"><xsl:value-of select="concat($rDay, '/', $rMonth, '/', $rYear)"></xsl:value-of></xsl:variable>

                <xsl:value-of select="concat($borrowDate, ' - ', $returnDate, $newline)"></xsl:value-of>
                <xsl:value-of select="$newline"></xsl:value-of>
            </xsl:for-each>
            <xsl:value-of select="$starline"></xsl:value-of>
        </xsl:for-each>
        <xsl:value-of select="$line"></xsl:value-of>
            Statystyki:
        <xsl:value-of select="$newline"/>
		
        <xsl:value-of select="concat('Liczba filmów: ', statistics/numberOfMovies, $newline)"></xsl:value-of>
        <xsl:value-of select="concat('Liczba klientów: ', statistics/numberOfClients, $newline)"></xsl:value-of>
        <xsl:value-of select="concat('Profit z wypożyczeń: ', statistics/priceOfMovies, 'zł', $line)"></xsl:value-of>
    Gatunek:            Ile sztuk:      Profit:
        <xsl:value-of select="$newline"/>
		<xsl:for-each select="statistics/genreStats/genre">
			<xsl:value-of select="concat(name, $tab, $tab, amount, $tab, $tab, price, 'zł', $newline)"/>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>