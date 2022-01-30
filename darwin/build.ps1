function Build-Image
{
    param
    (
        [string]$Tag,
        [string]$WorkingFolder
    )

    docker build --progress=plain --tag cagrin/azure-sql-edge-arm64:$Tag ./$WorkingFolder
}

Build-Image 'latest' 'latest'