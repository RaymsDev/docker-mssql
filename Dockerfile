FROM microsoft/mssql-server-windows-developer
RUN ["powershell", "-Command", "mkdir c:/SQLServer"]


#copy the database files from host to container
COPY Dwarf.mdf .
COPY Dwarf_log.ldf .

# set environment variables
ENV SA_PASSWORD=P@ssw0rd

ENV ACCEPT_EULA=Y

ENV attach_dbs="[{'dbName':'Dwarf','dbFiles':['C:\\SQLServer\\Dwarf.mdf','C:\\SQLServer\\Dwarf_log.ldf']}]"