Guide how to configure KFIS BIRT with JNDI
In order to generate a new encrypted password, use please the project com.geoland.jdbc.security.test
For server generation use please ServerPwdTest.java Class.


1) setup localy. Please copy the code into context tag of web appliaction

<Resource name="jdbc/kfis" auth="Container" type="javax.sql.DataSource"
factory="com.geoland.jdbc.security.EncryptedDataSourceFactory"
driverClassName="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/kfis20a?clientInfo=kfis&amp;applicationName=KFISApp&amp;application_name=kfis&amp;autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=UTF8"
 username="pemM0AgxwhA11um4mKCiDNVujjVL1Yxc" password="ffoYudEloF7/EXb3SMutBCo/9UYOxsVn"  maxActive="5" maxIdle="2" maxWait="-1"
 logAbandoned="true"  removeAbandoned="true"  removeAbandonedTimeout="60"/>
  
 
2) setup on geoland server. Please copy the code into context tag of web appliaction

<Resource name="jdbc/kfis" auth="Container" type="javax.sql.DataSource"
factory="com.geoland.jdbc.security.EncryptedDataSourceFactory"
driverClassName="org.postgresql.Driver" url="jdbc:postgresql://192.168.0.30:5432/kfis?clientInfo=kfis&amp;applicationName=KFISApp&amp;application_name=kfis&amp;autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=UTF8"
 username="3ins2vgIaI6mA4/uFI/vxQySSBPDr05G" password="CMhqoxWca1Fuksdkl3h+sg=="  maxActive="5" maxIdle="2" maxWait="-1"
 logAbandoned="true"  removeAbandoned="true"  removeAbandonedTimeout="60"/>
  

 