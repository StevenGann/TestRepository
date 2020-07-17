ECHO OFF

ECHO Build Project as Debug
cd Source\HelloWorld\
dotnet build --configuration Debug
cd ..\..\

ECHO Build Project as Release
cd Source\HelloWorld\
dotnet build --configuration Release
cd ..\..\

ECHO Archive Debug Build
cd Source\HelloWorld\HelloWorld\bin\Debug\netcoreapp3.1\
"C:\Program Files\7-Zip\7z.exe" a -tzip -r  Debug.zip *.*
mkdir ..\..\..\..\..\Builds\
move *.zip ..\..\..\..\..\Builds\
cd ..\..\..\..\..\..\
@RD /S /Q Source\HelloWorld\HelloWorld\bin\Debug

ECHO Archive Release Build
cd Source\HelloWorld\HelloWorld\bin\Release\netcoreapp3.1\
"C:\Program Files\7-Zip\7z.exe" a -tzip -r  Release.zip *.*
mkdir ..\..\..\..\..\Builds\
move *.zip ..\..\..\..\..\Builds\
cd ..\..\..\..\..\..\
@RD /S /Q Source\HelloWorld\HelloWorld\bin\Release

REM ECHO Build Docs
REM cd Software\Source\MemoryExplorer
REM doxygen Doxyfile
REM cd ..\..\..\

REM ECHO Archive Docs
REM cd Software\Docs\html\
REM "C:\Program Files\7-Zip\7z.exe" a -tzip -r  Docs.zip *.*
REM mkdir ..\..\Builds\
REM move *.zip ..\..\Builds\
REM cd ..\..\..\
REM @RD /S /Q Software\Docs\html

ECHO Build complete
