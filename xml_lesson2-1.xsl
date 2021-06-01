<?xml version="1.0" encoding="Shift_JIS"  standalone="yes" ?> <!-- XML宣言 -->
<xml:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > <!-- XSLTスタイルシート宣言 -->
    <xml:output method="html" encoding="Shift_JIS" /> <!-- XSLTスタイルシートの出力方法をHTML形式で宣言 -->
    <xsl:template match="/"> <!-- XML文書全体に適用されるテンプレートの呼び出し -->
        <html>
            <head>
                <title>
                    <xml:value-of select="xml_lesson2-1/@title" />
                </title>
            </head>
            <h1>
                <xml:value-of select="xml_lesson2-1/@title" />
            </h1>
            <table border="1">
                <tr>
                    <th><xsl:text>ISBNコード</xsl:text>
                    </th>
                    <th><xsl:text>書籍</xsl:text>
                    </th>
                    <th><xsl:text>著者</xsl:text>
                    </th>
                    <th><xsl:text>出版社</xsl:text>
                    </th>
                    <th><xsl:text>価格</xsl:text>
                    </th>
                    <th><xsl:text>発刊日</xsl:text>
                    </th>
                </tr>
            </table>
            <div>
                <xml:value-of select="xml_lesson2-1/@owner" />
            </div>
        </html>
    </xsl:template>
</xml:stylesheet>