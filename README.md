[![version](https://img.shields.io/badge/docker%20last%20pushed-2023--11--08-blue)](https://hub.docker.com/repository/docker/cagrin/azure-sql-edge-arm64/tags)
[![docker stars](https://img.shields.io/docker/stars/cagrin/azure-sql-edge-arm64)](https://hub.docker.com/repository/docker/cagrin/azure-sql-edge-arm64)
[![docker pulls](https://img.shields.io/docker/pulls/cagrin/azure-sql-edge-arm64)](https://hub.docker.com/repository/docker/cagrin/azure-sql-edge-arm64)

## Featured Tags

### linux/arm64 images only

|Tag|Product|Version|Release date|
|--- |--- |--- |---|
|latest|Azure SQL Edge<br/>PowerShell<br/>SqlServer (module)<br/>sqlcmd-arm64|15.0.2000.1574<br/>7.3.9<br/>22.1.1<br/>0.2.0|2023-02-09<br>2023-10-26<br/>2023-05-25<br/>2023-05-04|

## Usage

Unfortunatelly ```sqlcmd``` tool is not available inside the ARM64 version of Azure SQL Edge container<sup>1</sup>, that is why this image contains installed PowerShell<sup>2</sup> with SqlServer<sup>3</sup> module and custom version of ```sqlcmd-arm64```<sup>4</sup>.

Now you can use:

* ```Invoke-SqlCmd``` from ```pwsh```

or
* ```/opt/mssql-tools/bin/sqlcmd```

inside ARM64 version of Azure SQL Edge container, tadam.

### Update - September 2023
Following Microsoft's announcement<sup>5</sup>, Azure SQL Edge based on ARM64 architecture is retired. Alternatively, it is possible to run SQL 2017/2019/2022 and Azure SQL Edge AMD64 containers on Apple Silicon using Docker Desktop for macOS v4.16+.

## Configuration
Requires the following environment flags:
- ```ACCEPT_EULA=Y```
- ```MSSQL_SA_PASSWORD=```

## References

<sup>1)</sup> https://hub.docker.com/_/microsoft-azure-sql-edge

<sup>2)</sup> https://learn.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.3#binary-archives

<sup>3)</sup> https://docs.microsoft.com/en-us/sql/powershell/download-sql-server-ps-module?view=sql-server-ver15

<sup>4)</sup> https://github.com/cagrin/sqlcmd-arm64

<sup>5)</sup> https://techcommunity.microsoft.com/t5/sql-server-blog/azure-sql-edge-update-september-2023/ba-p/3930827