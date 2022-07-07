$sha1 = [System.Security.Cryptography.SHA1]::Create()
$utf8 = [System.Text.Encoding]::UTF8
$rand = New-Object System.Random

function ConvertTo-Hex {
  param (
    [byte[]]$bytes
  )
  
  $bytes | %{ $_.ToString('x2') } | Join-String
}

function Get-SHA1 {
  param([switch]$Clip)

  $text    = Get-Clipboard -Raw
  $bytes   = $utf8.GetBytes($text)
  $hash    = $sha1.ComputeHash($bytes)
  $hexhash = ConvertTo-Hex $hash

  if ($Clip) { Set-Clipboard -Value $hexhash }
  else { $hexhash }
}

function Get-RandSig {
  param([switch]$Clip)

  $b = New-Object byte[] 64
  $rand.NextBytes($b)
  $sig = ConvertTo-Hex $b
  $split = $sig.Substring(0, 64) + "`r`n" + $sig.Substring(64)

  if ($Clip) { Set-Clipboard -Value $split }
  else { $split }
}

function Get-RandKey {
  param([switch]$Clip)
   
  $b = New-Object byte[] 32
  $rand.NextBytes($b)
  $enc = [System.Convert]::ToBase64String($b)

  if ($Clip) { Set-Clipboard -Value $enc }
  else { $enc }
}

Set-Alias grs -Value Get-RandSig
Set-Alias gsha -Value Get-SHA1
Set-Alias gkey -Value Get-RandKey
