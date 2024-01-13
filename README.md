"# SecureWebApp" 

1. Install JDK-17, Apache Netbeans 19,Payara 6 Server, Postgresql 14 Server. 
2. Import dump_postgresql_v14.sql to database.
3. Add postgresql-42.6.0.jar to Payara with commnad: asadmin add-library <postgresql-42.6.0.jar>.
4. Define JDBC Connection Pools and JDBC Resource in Payara: view persistence.xml file.
5. Import project into Apache Netbeans and set server to Payara.

