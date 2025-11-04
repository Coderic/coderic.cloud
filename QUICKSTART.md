# ⚡ Quick Start: Desplegar en Cloudflare Pages

## 🎯 3 Pasos para Desplegar

### 1️⃣ Sube tu código a GitHub

```bash
git add .
git commit -m "Add Cloudflare Pages configuration"
git push origin main
```

### 2️⃣ Conecta con Cloudflare

1. Ve a: **https://dash.cloudflare.com/**
2. **Workers & Pages** → **Pages** → **Create a project**
3. **Connect to Git** → Selecciona tu repo
4. Nombre: **`coderic-cloud`**

### 3️⃣ ¡Despliega!

Clic en **"Save and Deploy"** - ¡Listo! 🎉

---

## 📋 Configuración que Cloudflare Usará Automáticamente

Gracias a los archivos que creamos, Cloudflare detectará:

- ✅ Build: `bundle exec jekyll build`
- ✅ Output: `_site`
- ✅ Ruby: 3.1.3
- ✅ Framework: Jekyll

**No necesitas configurar nada manualmente** 💪

---

## 🌐 URL Temporal

Tu sitio estará en:  
**`https://coderic-cloud.pages.dev`**

---

## 🌍 Dominio Personalizado

Para usar `coderic.cloud`:

1. En el proyecto → **Custom domains**
2. **Set up a custom domain** → Ingresa `coderic.cloud`
3. ¡Listo!

---

## 📚 Más Información

- **Instrucciones detalladas**: Ver `DEPLOY_INSTRUCTIONS.md`
- **Documentación completa**: Ver `README_DEPLOY.md`
- **Scripts de ayuda**: Ejecuta `deploy.bat` (Windows) o `deploy.sh` (Unix)

---

## ❓ Problemas?

- Build falla? → Verifica que `Gemfile` existe
- CSS no carga? → Revisa las rutas en `_config.yml`
- Auth0 no funciona? → Verifica `auth.coderic.org`

---

**¿Listo? Vamos a desplegar! 🚀**

