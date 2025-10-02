@echo off
echo ========================================
echo Nutrient Calculator - Build Portable Version
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

echo Building portable version (folder with dependencies)...
echo.

REM Build portable version (one folder)
pyinstaller --clean --name "NutrientCalculator" --windowed --onedir nutrient_calculator.py

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
echo Portable folder location: dist\NutrientCalculator\
echo Run: dist\NutrientCalculator\NutrientCalculator.exe
echo.
echo You can copy the entire folder to any Windows computer
echo and run without installation.
echo.
pause
