<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Employee Details</title>
        <style>
          table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
          }
          th, td {
            border: 2px solid black;
            padding: 8px;
            text-align: center;
          }
          th {
            background-color: #ffd6a5;
          }
          h2 {
            text-align: center;
            color: darkblue;
          }
        </style>
      </head>
      <body>
        <h2>Employee Information</h2>
        <table>
          <tr>
            <th>Emp ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Designation</th>
            <th>Salary</th>
            <th>Email</th>
          </tr>
          <xsl:for-each select="employees/employee">
            <tr>
              <td><xsl:value-of select="@empID"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="department"/></td>
              <td><xsl:value-of select="designation"/></td>
              <td><xsl:value-of select="salary"/></td>
              <td><xsl:value-of select="email"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>