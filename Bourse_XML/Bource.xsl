<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
           <head> 
               <title>Casablanca Stock Market</title>
           </head>
           <body>
               <h1>Quotations of companies of the Bank type</h1>
               <table border="1" width="90%">
                   <tr>
                       <th>Company Name</th>
                       <th>Quotation Number</th>
                       <th>Quotation Date</th>
                       <th>Value Action</th> 
                   </tr>
                   <xsl:for-each select="Bource/Company[@Type='Bank']">
                       <tr><td rowspan="{count(Quotations/Quotation)+1}"><xsl:value-of select="Company_Name"/></td></tr>
                       <xsl:for-each select="Quotations/Quotation">
                           <tr> 
                               <td><xsl:value-of select="@Number"/></td>
                               <td><xsl:value-of select="@Quotation_Date"/></td>
                               <td><xsl:value-of select="@Value_Action"/></td>
                           </tr>
                       </xsl:for-each>    
                       <tr>
                           <td > Quotations Average </td>
                           <td colspan="3"><xsl:value-of select="format-number(avg(Quotations/Quotation/@Value_Action), '###.0')"/></td>
                       </tr>
                   </xsl:for-each>   
               </table> 
               <ul>
                   <li>Total Number of companies : <xsl:value-of select="count(Bource/Company)"/></li>
                   <li> Number of companies of the Type Bank : <xsl:value-of select="count(Bource/Company[@Type='Bank'])"/></li>
                   <li> Number of companies of the Type Insurance : <xsl:value-of select="count(Bource/Company[@Type='Insurance'])"/></li>
               </ul>
           </body>
        </html>
    </xsl:template>  
</xsl:stylesheet>