#!/bin/bash

# Script de despliegue para Coderic Cloud
# Este script prepara el proyecto para Cloudflare Pages

echo "🚀 Coderic Cloud - Preparando despliegue en Cloudflare Pages"
echo "============================================================"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "index.html" ]; then
    echo "❌ Error: No se encontró index.html"
    echo "   Asegúrate de ejecutar este script desde el directorio raíz del proyecto"
    exit 1
fi

# Verificar que los archivos necesarios existen
echo "📋 Verificando archivos necesarios..."
FILES=("Gemfile" ".ruby-version" "cloudflare.toml" "_config.yml")
MISSING=0

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file (FALTA)"
        MISSING=1
    fi
done

if [ $MISSING -eq 1 ]; then
    echo ""
    echo "❌ Faltan archivos críticos. Por favor, asegúrate de que todos los archivos estén presentes."
    exit 1
fi

echo ""
echo "✅ Todos los archivos necesarios están presentes"
echo ""

# Verificar estado de Git
if [ -d ".git" ]; then
    echo "📦 Verificando estado de Git..."
    git status --short
    echo ""
    echo "💡 Para desplegar:"
    echo "   1. git add ."
    echo "   2. git commit -m 'Prepare Cloudflare Pages deployment'"
    echo "   3. git push origin main"
    echo "   4. Ve a Cloudflare Dashboard → Workers & Pages → Create project"
    echo ""
else
    echo "⚠️  Advertencia: No se detectó un repositorio Git"
    echo "   Inicializa Git si aún no lo has hecho:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    echo ""
fi

# Verificar configuración de Jekyll
echo "🔍 Verificando configuración Jekyll..."
if grep -q "remote_theme: Coderic/coderic.org" "_config.yml"; then
    echo "  ✅ Tema remoto configurado: Coderic/coderic.org"
else
    echo "  ⚠️  No se detectó tema remoto en _config.yml"
fi

echo ""
echo "📝 Próximos pasos:"
echo "=========================="
echo ""
echo "1️⃣  Sube tu código a GitHub:"
echo "   git remote add origin <tu-repo-url>"
echo "   git push -u origin main"
echo ""
echo "2️⃣  Conecta con Cloudflare Pages:"
echo "   https://dash.cloudflare.com/?to=/:account/pages/new"
echo ""
echo "3️⃣  Configura el proyecto:"
echo "   - Nombre: coderic-cloud"
echo "   - Build command: bundle exec jekyll build"
echo "   - Output directory: _site"
echo "   - Ruby version: 3.1.3"
echo ""
echo "4️⃣  ¡Despliega!"
echo ""
echo "📖 Ver DEPLOY_INSTRUCTIONS.md para instrucciones detalladas"
echo ""
echo "✅ Preparación completada"

