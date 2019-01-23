<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
	
<xsl:template match="/">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
		<fo:simple-page-master page-height="279mm" page-width="216mm" margin-top="10mm"  margin-bottom="10mm"  master-name="movieRental">
			<fo:region-body margin="1in"/>
			<fo:region-before region-name="xsl-region-before" extent="3in"/>
			<fo:region-after region-name="xsl-region-after"/>
		</fo:simple-page-master>
	</fo:layout-master-set>

<fo:page-sequence initial-page-number="1" master-reference="movieRental">
	<fo:static-content flow-name="xsl-region-after">
		<fo:block text-align="center"><fo:page-number/></fo:block>
	</fo:static-content>
	<fo:static-content flow-name="xsl-region-before">
		<fo:block text-align="center">Damian Byszewski 216732  |  Bartosz Krukowski 216814</fo:block>
	</fo:static-content>
<fo:flow flow-name="xsl-region-body">
	<fo:block text-indent="1em" font-family="Helvetica" font-weight="bold" text-align="center" font-size="28pt">Wypożyczalnia filmów</fo:block>
		<fo:block space-before=".10in">
      	<fo:table>
			<fo:table-column column-number="1" column-width="37mm"/>
			<fo:table-column column-number="2" column-width="37mm"/>
			<fo:table-column column-number="3" column-width="37mm"/>
			<fo:table-column column-number="4" column-width="20mm"/>
			<fo:table-column column-number="5" column-width="19mm"/>
			<fo:table-column column-number="6" column-width="19mm"/>
      		 <fo:table-body>
      		 	<fo:table-row text-align="center" background-color="#98CA32">
                	<fo:table-cell border="solid 1px black" font-weight="bold" padding="4pt">
                		<fo:block>
                    		Tytuł
                  		</fo:block>
                	</fo:table-cell>
                	<fo:table-cell border="solid 1px black" font-weight="bold" padding="4pt">
                		<fo:block>
                    		Gatunek
                  		</fo:block>
                	</fo:table-cell>
                	<fo:table-cell border="solid 1px black" font-weight="bold" padding="4pt">
                		<fo:block>
                    		Reżyser
                  		</fo:block>
                	</fo:table-cell>
					<fo:table-cell border="solid 1px black" font-weight="bold" padding="4pt">
                		<fo:block>
                    		Ocena
                  		</fo:block>
                	</fo:table-cell>
					<fo:table-cell border="solid 1px black" font-weight="bold" padding="4pt">
                		<fo:block>
                    		Cena
                  		</fo:block>
                	</fo:table-cell>
					<fo:table-cell border="solid 1px black" font-weight="bold" padding="4pt">
                		<fo:block>
                    		Zarobek
                  		</fo:block>
                	</fo:table-cell>
                </fo:table-row>
                <xsl:for-each select="movieRental/movies/movie">
                <fo:table-row background-color="#C0DF81">
                	<fo:table-cell border="solid 1px black" text-align="center" padding="1pt">
                		<fo:block>
                    		<xsl:value-of select="title" />
                  		</fo:block>
                	</fo:table-cell>
                	<fo:table-cell border="solid 1px black" text-align="center" padding="1pt">
                		<fo:block>
                    		<xsl:value-of select="genre" />
                  		</fo:block>
                	</fo:table-cell>
                	<fo:table-cell border="solid 1px black" text-align="center" padding="1pt">
                		<fo:block>
                    		<xsl:value-of select="director" />
                  		</fo:block>
                	</fo:table-cell>
					<fo:table-cell border="solid 1px black" text-align="center"  padding="1pt">
                		<fo:block>
                    		<xsl:value-of select="rating" />
                  		</fo:block>
                	</fo:table-cell>
					<fo:table-cell border="solid 1px black" text-align="center" padding="1pt">
                		<fo:block>
                    		<xsl:value-of select="price" />
                  		</fo:block>
                	</fo:table-cell>
					<fo:table-cell border="solid 1px black" text-align="center"  padding="1pt">
                		<fo:block>
                    		<xsl:value-of select="profit" />
                  		</fo:block>
                	</fo:table-cell>
                </fo:table-row>
                </xsl:for-each>
      		 </fo:table-body>
      	</fo:table>
		<fo:block space-before=".1in"/>
		</fo:block>
	  
	  	<fo:block space-before="10.25in"/>  
		<fo:block font-family="sans-serif" font-weight="bold" text-align="center" font-size="28pt">Statystyki</fo:block>
		<fo:block space-before=".50in">
		<fo:list-block font-family="Times Roman">
			<fo:list-item>
				<fo:list-item-label>
					<fo:block></fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block>&#8226;&#160;Ilość filmów: <xsl:value-of select="movieRental/statistics/numberOfMovies" /></fo:block>
				</fo:list-item-body>
			</fo:list-item>
			<fo:list-item>
				<fo:list-item-label>
					<fo:block></fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block>&#8226;&#160;Ilość klientów: <xsl:value-of select="movieRental/statistics/numberOfClients" /></fo:block>
				</fo:list-item-body>
			</fo:list-item>
			<fo:list-item>
				<fo:list-item-label>
					<fo:block></fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block>&#8226;&#160;Ilość filmów danego gatunku: </fo:block>
					<fo:list-block font-family="Times Roman">
						<xsl:for-each select="movieRental/statistics/genreStats/genre">
							<fo:list-item>
								<fo:list-item-label>
									<fo:block></fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block>&#160;&#160;&#160;-&#160;<xsl:value-of select="concat(name, ': ', amount)" /></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</xsl:for-each>
					</fo:list-block>

				</fo:list-item-body>
			</fo:list-item>
			<fo:list-item>
				<fo:list-item-label>
					<fo:block></fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block>&#8226;&#160;Zarobek ogólny: <xsl:value-of select="concat(movieRental/statistics/priceOfMovies, 'PLN')" /></fo:block>
				</fo:list-item-body>
			</fo:list-item>
			<fo:list-item>
				<fo:list-item-label>
					<fo:block> </fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block>&#8226;&#160;Data wygenerowania raportu: <xsl:value-of select="movieRental/statistics/reportDate/date" /></fo:block>
				</fo:list-item-body>
			</fo:list-item>
			<fo:list-item>
				<fo:list-item-label>
					<fo:block></fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block>&#8226;&#160;Godzina wygenerowania raportu: <xsl:value-of select="movieRental/statistics/reportDate/time" /></fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
		</fo:block>

</fo:flow>
</fo:page-sequence>
</fo:root>
</xsl:template>
</xsl:stylesheet>