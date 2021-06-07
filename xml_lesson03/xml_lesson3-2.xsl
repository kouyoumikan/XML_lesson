<?xml version="1.0" encoding="Shift_JIS"  standalone="yes" ?> <!-- XML宣言 -->
<xml:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > <!-- XSLTスタイルシート宣言 -->
    <xml:output method="html" encoding="Shift_JIS" />
    <xsl:template match="/"> <!-- XML文書全体に適用されるテンプレートの呼び出し -->
        <html>
            <head>
                <title>詳細情報表示</title>
                <!-- cssスタイルシートの呼び出し -->
                <link rel="stylesheet" type="text/css" herf="xml_lesson3-1.css"></link>
            </head>
            <body>
                <h1>詳細情報表示</h1>
                <xml:apply-templates select="xml_lesson3-1" /> 
            </body>
        </html>
    </xsl:template>
    <!-- 「xml_lesson2-2」XSLTテンプレートに適用されるテンプレートの呼び出し -->
    <xsl:template match="xml_lesson3-1">
        <!-- マッチした要素や属性について繰り返し処理し、1回のループで下記の内容を出力 -->
        <xml:for-each select="book">
            <!-- 出力する表の内容を文字列で並び替える(ソートする) -->
            <table border="0">
                <tr>
                    <td width="150">
                        <xml:if test="logo[.!='']"> <!-- ロゴ画像の有無による条件分岐処理 -->
                            <xml:element name="img"> <!-- ロゴ画像の表示 -->
                            <xml:attribute name="src">
                                <xml:value-of select="logo" />
                            </xml:attribute>
                            <xml:attribute name="width">120
                            </xml:attribute>
                            <xml:attribute name="height">150
                            </xml:attribute>
                        </xml:element>
                        </xml:if>
                    </td>
                    <td valign="bottom">
                        <dl>
                            <dt>
                                <xml:number format="01" /> <!-- 一覧表に連番を付加 -->
                                <xml:value-of select="name" />
                                <!-- <xml:value-of select="author" /> -->
                            </dt>
                            <dd> <!-- 文書の一部分を強調表示 -->
                                <xml:apply-templates select="memo" />
                                <br />
                                <div style="text-align: right;">
                                    <!-- 数値データを整形して表示（数値を三桁区切りで整形加工） -->
                                    <xml:value-of select="format-number(price,'#,###')" />円
                                    <!-- 数値データを整形して表示（数値を小数点以下の2桁に整形加工） -->
                                    <!-- <xml:value-of select="format-number(price,'#,###.00')" />円 -->
                                </div>
                            </dd>
                        </dl>
                    </td>
                </tr>
            </table>
            <hr />
        </xml:for-each>
    </xsl:template>
    <xml:template>
        <xml:template match="keyword">
            <span style="font-weight: bold;">
                <xml:value-of select="." />
            </span>
        </xml:template>
        <xml:template match="ref"><!-- リンクを生成 -->
            <a>
                <xml:attribute name="herf">
                    <xml:value-of select="@addr" />
                </xml:attribute>
                <xml:value-of select="." />
            </a>
        </xml:template>
        <xml:template match="text()">
            <xml:value-of select="." />
        </xml:template>
    </xml:template>
</xml:stylesheet>