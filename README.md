## Featured Tags

### linux/arm64 images only

|Tag|Product|Version|Release date|
|--- |--- |--- |---|
|latest|Azure SQL Edge|15.0.2000.1562|2022-01-15|

## Configuration
Requires the following environment flags:
- ```ACCEPT_EULA=Y```
- ```MSSQL_SA_PASSWORD=```

This image is based on ```mcr.microsoft.com/azure-sql-edge:latest```.

Unfortunatelly ```sqlcmd``` tool is not available inside the ARM64 version of SQL Edge containers<sup>1</sup>, that is why this image contains installed PowerShell<sup>2</sup> with SqlServer<sup>3</sup> module instead.

Now you can use ```Invoke-SqlCmd``` from ```pwsh``` shell inside ARM64 version of SQL Edge container, tadam.

## References

<sup>1)</sup> https://hub.docker.com/_/microsoft-azure-sql-edge

<sup>2)</sup> https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.2#binary-archives

<sup>3)</sup> https://docs.microsoft.com/en-us/sql/powershell/download-sql-server-ps-module?view=sql-server-ver15