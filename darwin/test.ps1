function Test-Image
{
    param
    (
        [string]$Tag,
        [string]$ProductVersion,
        [string]$Collation
    )

    Write-Host "Test-Image '$Tag' '$ProductVersion' '$Collation'" -ForegroundColor Magenta
    $SA_PASSWORD='A.794613'
    docker container stop test_image
    docker container rm test_image
    docker run --name test_image -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=$SA_PASSWORD" -e "MSSQL_COLLATION=$Collation" -p 51433:1433 -d cagrin/azure-sql-edge-arm64:$Tag
    Start-Sleep -Second 45
    Invoke-Sqlcmd -ServerInstance "localhost,51433" -Database "master" -Username "sa" -Password "$SA_PASSWORD" -Query "IF SERVERPROPERTY('ProductVersion') <> '$ProductVersion' RAISERROR ('ProductVersion is invalid', 16, 1)"
    Invoke-Sqlcmd -ServerInstance "localhost,51433" -Database "master" -Username "sa" -Password "$SA_PASSWORD" -Query "IF SERVERPROPERTY('Collation') <> '$Collation' RAISERROR ('Collation is invalid', 16, 1)"
}

Test-Image 'latest' '15.0.2000.1562' 'SQL_Latin1_General_CP1_CI_AS'
Test-Image 'latest' '15.0.2000.1562' 'Polish_CI_AS'

docker container stop test_image
docker container rm test_image