rm "bin\release\" -Recurse -Force
dotnet pack --configuration Release
dotnet nuget push "bin\Release\" --source "https://api.nuget.org/v3/index.json"
$ver = ((ls .\bin\release\*.nupkg)[0].Name -replace '[^\d]*\.(\d+(\.\d+){1,4}).*', '$1')
git tag -a "CommandLine/v$ver" -m "$ver"
git push --tags
