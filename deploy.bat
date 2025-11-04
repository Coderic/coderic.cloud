@echo off
REM Script de despliegue para Coderic Cloud (Windows)
REM Este script prepara el proyecto para Cloudflare Pages

echo.
echo ================================================================
echo Coderic Cloud - Preparando despliegue en Cloudflare Pages
echo ================================================================
echo.

REM Verificar que estamos en el directorio correcto
if not exist "index.html" (
    echo Error: No se encontro index.html
    echo Asegurate de ejecutar este script desde el directorio raiz del proyecto
    pause
    exit /b 1
)

REM Verificar archivos necesarios
echo Verificando archivos necesarios...
echo.

if exist "Gemfile" (
    echo [OK] Gemfile
) else (
    echo [ERROR] Gemfile - FALTA
    set MISSING=1
)

if exist ".ruby-version" (
    echo [OK] .ruby-version
) else (
    echo [ERROR] .ruby-version - FALTA
    set MISSING=1
)

if exist "cloudflare.toml" (
    echo [OK] cloudflare.toml
) else (
    echo [ERROR] cloudflare.toml - FALTA
    set MISSING=1
)

if exist "_config.yml" (
    echo [OK] _config.yml
) else (
    echo [ERROR] _config.yml - FALTA
    set MISSING=1
)

echo.

if defined MISSING (
    echo Error: Faltan archivos criticos
    echo Por favor, asegurate de que todos los archivos esten presentes.
    pause
    exit /b 1
)

echo Todos los archivos necesarios estan presentes
echo.

REM Verificar estado de Git
if exist ".git" (
    echo Verificando estado de Git...
    git status --short
    echo.
    echo Para desplegar:
    echo   1. git add .
    echo   2. git commit -m "Prepare Cloudflare Pages deployment"
    echo   3. git push origin main
    echo   4. Ve a Cloudflare Dashboard - Workers & Pages - Create project
    echo.
) else (
    echo Advertencia: No se detecto un repositorio Git
    echo Inicializa Git si aun no lo has hecho:
    echo   git init
    echo   git add .
    echo   git commit -m "Initial commit"
    echo.
)

echo ================================================================
echo Proximos pasos:
echo ================================================================
echo.
echo 1. Sube tu codigo a GitHub:
echo    git remote add origin ^<tu-repo-url^>
echo    git push -u origin main
echo.
echo 2. Conecta con Cloudflare Pages:
echo    https://dash.cloudflare.com/?to=/:account/pages/new
echo.
echo 3. Configura el proyecto:
echo    - Nombre: coderic-cloud
echo    - Build command: bundle exec jekyll build
echo    - Output directory: _site
echo    - Ruby version: 3.1.3
echo.
echo 4. Despliega!
echo.
echo Ver DEPLOY_INSTRUCTIONS.md para instrucciones detalladas
echo.
echo Preparacion completada
echo.
pause

