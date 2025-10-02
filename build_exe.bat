@echo off
echo ========================================
echo Nutrient Calculator - Build EXE
echo ========================================
echo.

REM Check if PyInstaller is installed
python -c "import PyInstaller" 2>nul
if errorlevel 1 (
    echo PyInstaller not found. Installing...
    pip install -r requirements.txt
    if errorlevel 1 (
        echo Failed to install PyInstaller
        pause
        exit /b 1
    )
)

echo Building executable...
echo.

REM Build with spec file
pyinstaller --clean build.spec

if errorlevel 1 (
    echo.
    echo Build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Executable location: dist\NutrientCalculator.exe
echo.
pause
