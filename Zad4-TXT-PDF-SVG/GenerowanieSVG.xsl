<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:template match="movieRental">
		<svg width="40cm" height="45cm" 
			xmlns="http://www.w3.org/2000/svg">

			<script type="text/ecmascript">
				<![CDATA[
				function play_anim(evt){
					var obj = evt.target;
					var obj_fill = obj.getAttribute("fill");
					var obj_x = obj.getAttribute("x");
					var obj_rx = obj.getAttribute("rx");
					var obj_width = obj.getAttribute("width");
					if(obj_rx == "0"){
						var timer = setInterval(toRight, 5);
					} else if( obj_rx == "10"){
						var timer = setInterval(toLeft, 5);
					}
					
					function toRight(){
						if ((parseInt(obj_x, 10) + parseInt(obj_width, 10) + 1) >= 785) {
							clearInterval(timer);
							obj.setAttribute("rx", "10");	
						} else {
							var x = parseInt(obj_x, 10);
							x = x + 1;
							obj_x = String(x);
							obj.setAttribute("x", obj_x);
							obj.setAttribute("rx", "5");
						}
					}

					function toLeft(){
						if (parseInt(obj_x, 10) <= 321) {
							clearInterval(timer);
							obj.setAttribute("rx", "0");	
						} else {
							var x = parseInt(obj_x, 10);
							x = x - 1;
							obj_x = String(x);
							obj.setAttribute("x", obj_x);
							obj.setAttribute("rx", "5");
						}
					}
				}
				]]>
			</script>

			<rect x="0" y="10" height="850" width="795" fill="#1B3409" stroke="#0D1D02" stroke-width="1"/>

			<text x="100" y="70" font-family="Arial" font-size="0" font-weight="bold" fill="#EBF7E3">Statystyki gatunków filmowych:
				<animate attributeType="XML" attributeName="font-size" from="0" to="35" dur="3s" fill="freeze"/>
			</text>

			<rect x="10" y="120" height="0" width="1" fill="black" stroke="black" stroke-width="1">
				<animate attributeType="XML" attributeName="height" from="120" to="725" dur="6s" fill="freeze"/>
			</rect>

			<rect x="320" y="120" height="0" width="1" fill="black" stroke="black" stroke-width="1">
				<animate attributeType="XML" attributeName="height" from="120" to="725" dur="6s" fill="freeze"/>
			</rect>

			<rect x="785" y="120" height="0" width="1" fill="black" stroke="black" stroke-width="1">
				<animate attributeType="XML" attributeName="height" from="120" to="725" dur="6s" fill="freeze"/>
			</rect>

			<rect x="10" y="120" height="1" width="0" fill="black" stroke="black" stroke-width="1">
				<animate attributeType="XML" attributeName="width" from="0" to="775" dur="6s" fill="freeze"/>
			</rect>

			<xsl:for-each select="/movieRental/statistics/genreStats/genre">

				<xsl:variable name="genrePosition" select="(position()-1) * 60"/>
				<xsl:variable name="genreNumberGraph" select="number(amount*30)"/>
				<xsl:variable name="genrePriceGraph" select="number(price)"/>

				<rect onclick="play_anim(evt)" x="321" y="{$genrePosition + 130}" height="20" width="0" fill="#C0DF81" stroke="black" stroke-width="1" rx="0">
					<animate attributeType="XML" attributeName="width" from="0" to="{$genreNumberGraph}" dur="6s" fill="freeze"/>
				</rect>

				<rect onclick="play_anim(evt)" x="321" y="{$genrePosition + 160}" height="20" width="0" fill="#98CA32" stroke="black" stroke-width="1" rx="0">
					<animate attributeType="XML" attributeName="width" from="0" to="{$genrePriceGraph}" dur="6s" fill="freeze"/>
				</rect>

				<rect x="10" y="{$genrePosition + 185}" height="1" width="0" fill="black" stroke="black" stroke-width="1">
					<animate attributeType="XML" attributeName="width" from="0" to="775" dur="6s" fill="freeze"/>
				</rect>

				<text id="genre" x="50" y="{$genrePosition + 165}" font-family="Arial" font-weight="bold" font-size="15" font-style="italic" fill="#EBF7E3">
					<xsl:value-of select="name"/>
				</text>

				<text x="190" y="{$genrePosition + 150}" font-family="Arial" font-size="15" fill="#C0DF81">
					<xsl:value-of select=" concat('Ilość filmów: ' , amount)"/>
				</text>

				<text x="190" y="{$genrePosition + 180}" font-family="Arial" font-size="15" fill="#98CA32">
					<xsl:value-of select=" concat('Zarobek: ' , price,'zł')"/>
				</text>

			</xsl:for-each>

		</svg>
	</xsl:template>

</xsl:stylesheet>
