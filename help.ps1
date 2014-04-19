Gci *.csv | select -expand Fullname | %{
    $current = import-csv $_
    $newname = $_ -replace ".csv", "trimmed.tx"
    $current | select date, "Adj Close" | export-csv $newname -notype
}

rm *.csv

New-Item "history.csv" -type file

foreach ($file in dir *.tx)
{
  if ($file -notmatch '(\w+)trimmed.tx') { continue }

  $csv = Import-Csv $file
  $csv | Foreach {"{0},{1},{2}" -f `
    $matches[1], $_.Date, $_."Adj Close"} >> $res
}

rm *.tx