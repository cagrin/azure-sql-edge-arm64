## Install ```mssql-tools``` failed

E: Unable to locate package mssql-tools
```
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-ver15
RUN apt-get update && apt-get install -y gpg
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list
RUN cp ./microsoft-prod.list /etc/apt/sources.list.d/
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
RUN apt-get update && apt-get install -y mssql-tools unixodbc-dev
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc
```

## Update SqlServer module
```
Update-Module -Name SqlServer -RequiredVersion 22.0.59
```