$ErrorActionPreference = "Stop"

$ip = (Get-NetIPAddress -AddressFamily IPv4 |
  Where-Object { $_.IPAddress -notlike "127.*" -and $_.PrefixOrigin -ne "WellKnown" } |
  Select-Object -First 1 -ExpandProperty IPAddress)

Write-Host "Scrollbound is available on this computer at http://localhost:8080"
if ($ip) {
  Write-Host "Open this address on your phone while it is on the same Wi-Fi: http://$ip`:8080"
}
Write-Host "Press Ctrl+C to stop the server."
python -m http.server 8080 --bind 0.0.0.0