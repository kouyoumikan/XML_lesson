<?xml version="1.0" encoding="Shift_JIS"  standalone="yes" ?> <!-- XML宣言 -->
<xml:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > <!-- XSLTスタイルシート宣言 -->
    <xml:output method="html" encoding="Shift_JIS" />
    <xsl:template match="/"> <!-- XML文書全体に適用されるテンプレートの呼び出し -->
        <html>
            <head>
                <title>
                    <xml:value-of select="xml_lesson4-1/@title" />
                </title>
                <!-- cssスタイルシートの呼び出し -->
                <link rel="stylesheet" type="text/css" herf="xml_lesson4-1.css"></link>
            </head>
            <h1>
                <xml:value-of select="xml_lesson4-1/@title" />
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
                <xml:apply-templates select="xml_lesson4-1" />
                <tr>
                    <td colspan="3"></td>
                    <th align="right">平均</th>
                    <td> <!-- 値段の平均値を算出（合計(要素/個数) ） -->
                        <xml:value-of select="sum(xml_lesson4-1//price) div count(xml_lesson4-1//price)" />円
                    </td>
                    <td></td>
                </tr>
            </table>
            <div>
                <xml:value-of select="xml_lesson4-1/@owner" />
            </div>
        </html>
    </xsl:template>
    <!-- 「xml_lesson2-2」XSLTテンプレートに適用されるテンプレートの呼び出し -->
    <xsl:template match="xml_lesson4-1">
        <!-- マッチした要素や属性について繰り返し処理し、1回のループで下記の内容を出力 -->
        <xml:for-each select="book">
            <!-- 出力する表の内容を文字列で並び替える(ソートする) -->
            <xml:sort select="price" date-type="number" order="ascending" /> <!-- 数値ソートを昇順(ascending) -->
                <tr>
                    <td nowrap="nowrap">
                        <xml:value-of select="@isbn" />
                    </td>
                    <td nowrap="nowrap">
                        <xml:choose> <!-- URLリンクの有無による条件分岐の応用処理 -->
                            <xsl:when test="url">
                                <xml:element name="a"> <!-- URLリンクを生成 -->
                                    <xml:attribute name="herf">
                                        <xml:value-of select="url" />
                                    </xml:attribute>
                                    <xml:value-of select="name" />
                                </xml:element>
                            </xsl:when>
                            <xml:otherwise>
                                <xml:value-of select="name" />
                            </xml:otherwise>
                        </xml:choose>
                    </td>
                    <td nowrap="nowrap">
                        <xml:value-of select="author" />
                    </td>
                    <td> <!-- publish要素の有無による条件分岐の応用処理 -->
                        <xml:value-of select="publish" />
                        <xml:if test="publish[.='']">
                            <xml:message terminate="yes" />
                        </xml:if>
                        <xml:value-of select="publish" />
                    </td>
                    <td nowrap="nowrap">
                        <xml:choose> <!-- 値段によって表示するフォントを変更する条件分岐処理 -->
                            <xml:when test="price [number(.) &lt; = 3000]"> <!-- 3000円以下の書籍のフォントをbold体に変更して表示する -->
                                <span style="font-weight: bold;">
                                    <xml:value-of select="price" />円
                                </span>
                            </xml:when>
                            <xml:otherwise> <!-- 3000円以上の書籍のフォントは変更しない -->
                                <xml:value-of select="price" />円
                            </xml:otherwise>
                        </xml:choose>
                    </td>
                    <td nowrap="nowrap">
                        <xml:value-of select="pDate" />
                    </td>
                </tr>
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