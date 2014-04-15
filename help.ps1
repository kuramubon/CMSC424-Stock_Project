$res = 'history.txt'
'Company_ID, Date, Stock_Price' > $res

foreach ($file in dir *.csv)
{
  if ($file -notmatch '(\w+).csv') { continue }

  $csv = Import-Csv $file
  $csv | Foreach {"{0},{1},{2}" -f `
    $matches[1], $_.Date, $_."Adj Close"} >> $res
}