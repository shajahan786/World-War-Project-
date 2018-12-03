<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name="lettersColl" as="document-node()+" select="collection('?select=*.xml')"/>
    
    <xsl:template match="/">
        
            <html>
                <head>
                    <title>Timeline</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" type="text/css" href="style.css"/>
                </head>
                
                <body>
                    <xsl:for-each select="$lettersColl">
                        
                                <h2><xsl:apply-templates select="//title"/></h2>
                                <h3><xsl:apply-templates select="//abstract"/></h3>
                        <p><xsl:apply-templates select="//body"/></p>
                        
                  </xsl:for-each>
                </body>
            </html>
    </xsl:template>
    <xsl:template match="emotion[@morale='high']">
        <span class="high"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="emotion[@morale='low']">
        <span class="low"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="perName">
        <span class="persName"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>