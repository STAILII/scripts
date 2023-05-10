# Importer les données du fichier CSV 
$csv = Import-Csv -Path "C:\le chemin vers mon fichiers csv\exports.csv"

# Créer un tableau pour les stocker 
$table = @()

# Créer une boucle 
foreach ($row in $csv) {
    # Extraire hostname, domainname, osversion et lastseen
    $hostname = $row.hostname
    $domainname = $row.domainname
    $osversion = if ([string]::IsNullOrEmpty($row.osversion)) {"N/A"} else {$row.osversion}
    $lastseen = (Get-Date $row.lastseen).ToString("dd/MM/yyyy")

    # Ajouter les valeurs aux tableau 

    $table += [PSCustomObject]@{
        "Hostname" = $hostname
        "Domainname" = $domainname
        "osversion" = $osversion
        "Lastseen" = $lastseen
    }
}

# Exporter les données dans un fichier texte 
$table | Format-Table -Property Hostname, Domainname, osversion, Lastseen -AutoSize | Out-File "C:\Users\VivoBook\Downloads\version W10\export.txt" -Encoding UTF8
