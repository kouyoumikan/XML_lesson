<?xml version="1.0" encoding="Shift_JIS"  standalone="yes" ?> <!-- XML宣言 -->
<xml:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > <!-- XSLTスタイルシート宣言 -->
<xml:variable name="key">ASP</xml:variable> <!-- 変数Kkeyの宣言 -->
<xml:attribute-set name="imgAttr"> <!-- widthとheightを「imgAttr」という名前の属性セットに宣言しまとめる -->
    <xml:attribute name="width">120</xml:attribute>
    <xml:attribute name="height">150</xml:attribute>
</xml:attribute-set>
<xml:decimal-format NaN="-" />
<xml:output method="html" encoding="Shift_JIS" />
    <xsl:template match="/"> <!-- XML文書全体に適用されるテンプレートの呼び出し -->
        <html>
            <head>
                <title>詳細情報表示</title>
                <!-- cssスタイルシートの呼び出し -->
                <link rel="stylesheet" type="text/css" herf="xml_lesson4-2.css"></link>
            </head>
            <body>
                <h1>詳細情報表示</h1>
                <xml:apply-templates select="xml_lesson4-2" /> 
            </body>
        </html>
    </xsl:template>
    <!-- 「xml_lesson2-2」XSLTテンプレートに適用されるテンプレートの呼び出し -->
    <xsl:template match="xml_lesson4-2">
        <!-- マッチした要素や属性について繰り返し処理し、1回のループで下記の内容を出力 -->
        <xml:for-each select="book[contains(category,$key)]"> <!-- 変数keyで定義された文字列を含む<book>要素を抽出する -->
        <!-- <xml:for-each select="book[contains(category,'ASP')]"> 上記と同じ意味  -->
            <!-- 出力する表の内容を文字列で並び替える(ソートする) -->
            <table border="0">
                <tr>
                    <td width="150">
                        <xml:if test="logo[.!='']"> <!-- ロゴ画像の有無による条件分岐処理 -->
                            <img xml:use-attribute-sets="imgAttr"> <!-- 「imgAttr」属性セットを参照して使用する -->
                                <xml:attribute name="src">
                                    <xml:value-of select="logo" />
                                </xml:attribute>
                            </img>
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
    <xml:include herf="inc.xsl" /> <!-- 外部のXSLTスタイルシートを呼び出す -->
</xml:stylesheet>