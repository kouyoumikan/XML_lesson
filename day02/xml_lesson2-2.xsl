<?xml version="1.0" encoding="Shift_JIS"  standalone="yes" ?> <!-- XML宣言 -->
<xml:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > <!-- XSLTスタイルシート宣言 -->
    <xml:output method="html" encoding="Shift_JIS" />
    <xsl:template match="/"> <!-- XML文書全体に適用されるテンプレートの呼び出し -->
        <html>
            <head>
                <title>
                    <xml:value-of select="xml_lesson2-1/@title" />
                </title>
                <!-- cssスタイルシートの呼び出し -->
                <link rel="stylesheet" type="text/css" herf="xml_lesson2-2.css"></link>
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
                <xml:apply-templates select="xml_lesson2-2" />
            </table>
            <div>
                <xml:value-of select="xml_lesson2-1/@owner" />
            </div>
        </html>
    </xsl:template>
    <!-- 「xml_lesson2-2」XSLTテンプレートに適用されるテンプレートの呼び出し -->
    <xsl:template match="xml_lesson2-2">
        <!-- マッチした要素や属性について繰り返し処理し、1回のループで下記の内容を出力 -->
        <xml:for-each select="book">
            <!-- 出力する表の内容を文字列で並び替える(ソートする) -->
            <xml:sort select="publish" date-type="text" order="ascending" /> <!-- 昇順(ascending) -->
            <xml:sort select="pDate" date-type="text" order="descending" /> <!-- 降順(descending) -->
            <tr>
                <td>
                    <xml:value-of select="@isbn" />
                </td>
                <td>
                    <xml:value-of select="name" />
                </td>
                <td>
                    <xml:value-of select="author" />
                </td>
                <td>
                    <xml:value-of select="publish" />
                </td>
                <td>
                    <xml:value-of select="price" />
                </td>
                <td>
                    <xml:value-of select="pDate" />
                </td>
            </tr>
        </xml:for-each>
    </xsl:template>
</xml:stylesheet>