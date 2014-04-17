$res = 'history.csv'
'Company_ID, Date, Close' > $res

foreach ($file in dir *.csv)
{
  if ($file -notmatch '(\w+).csv') { continue }

  $csv = Import-Csv $file
  $csv | Foreach {"{0},{1},{2}" -f `
    $matches[1], $_.Date, $_.Close} >> $res
}