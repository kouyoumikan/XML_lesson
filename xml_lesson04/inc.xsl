<?xml version="1.0" encoding="Shift_JIS"  standalone="yes" ?> <!-- XML宣言 -->
<xml:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > <!-- XSLTスタイルシート宣言 -->
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
</xml:stylesheet>