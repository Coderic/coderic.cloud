# 🚀 Instrucciones de Despliegue: Coderic Cloud → Cloudflare Pages

## Pasos Rápidos para Desplegar

### 1️⃣ Preparar el Repositorio

Asegúrate de que todos los archivos estén en GitHub:

```bash
git add .
git commit -m "Configure Cloudflare Pages deployment"
git push origin main
```

### 2️⃣ Crear Proyecto en Cloudflare Pages

#### Opción A: Desde el Dashboard

1. Ve a: https://dash.cloudflare.com/
2. Navega a: **Workers & Pages** → **Pages**
3. Clic en: **Create a project**
4. Elige: **Connect to Git**
5. Autoriza Cloudflare para acceder a GitHub
6. Selecciona tu repositorio

#### Opción B: URL Directa

```
https://dash.cloudflare.com/?to=/:account/pages/new
```

### 3️⃣ Configurar el Proyecto

**Pestaña: Configuration**
- **Project name**: `coderic-cloud`
- **Production branch**: `main` (o `master` según tu repo)
- **Framework preset**: `Jekyll` (Cloudflare lo detecta automáticamente)
- **Build command**: `bundle exec jekyll build`
- **Build output directory**: `_site`

**Pestaña: Environment variables**
- Agrega:
  ```
  RUBY_VERSION = 3.1.3
  NODE_ENV = production
  ```

### 4️⃣ Desplegar

1. Clic en: **Save and Deploy**
2. Espera ~2-5 minutos para que termine el build
3. ¡Listo! Tu sitio estará disponible en:
   - `https://coderic-cloud.pages.dev`

---

## 🔧 Configuración Automática

Si los archivos están correctos, Cloudflare detectará automáticamente:

✅ `Gemfile` → Instalará dependencias de Jekyll  
✅ `cloudflare.toml` → Aplicará configuración personalizada  
✅ `.ruby-version` → Usará Ruby 3.1.3  
✅ `_config.yml` → Configurará Jekyll

---

## 🌐 Configurar Dominio Personalizado

### Si ya tienes `coderic.cloud` en Cloudflare:

1. En el proyecto **coderic-cloud**
2. Ve a: **Custom domains** → **Set up a custom domain**
3. Ingresa: `coderic.cloud`
4. Cloudflare verifica el DNS automáticamente
5. Si está todo OK, el dominio se asigna instantáneamente

### Si `coderic.cloud` NO está en Cloudflare:

1. Agrega tu dominio en Cloudflare DNS
2. Sigue los pasos anteriores
3. Actualiza los nameservers de tu registrador

---

## 🔄 Despliegues Automáticos

### Producción
Cada push a `main` → despliegue automático a producción

### Preview Deployments
Cada Pull Request → se crea una URL de preview temporal

---

## 📝 Estructura de Archivos Creados

```
coderic.cloud/
├── cloudflare.toml          # ✨ Nueva - Config de Cloudflare
├── Gemfile                  # ✨ Nueva - Dependencias Jekyll
├── .ruby-version            # ✨ Nueva - Versión Ruby
├── _cloudflare.yml          # ✨ Nueva - Config específica
├── package.json             # ✨ Nueva - Info del proyecto
├── README_DEPLOY.md         # ✨ Nueva - Documentación completa
├── DEPLOY_INSTRUCTIONS.md   # ✨ Nueva - Esta guía rápida
├── .gitignore               # 🔧 Mejorado
└── [archivos existentes]...
```

---

## 🐛 Solución de Problemas

### ❌ Build Falla: "Jekyll not found"
**Solución:** Verifica que `Gemfile` existe y tiene `jekyll-remote-theme`

### ❌ Build Falla: "Remote theme error"
**Solución:** El tema `Coderic/coderic.org` debe ser público en GitHub

### ❌ CSS no se carga
**Solución:** Verifica rutas en `_config.yml` y `baseurl`

### ❌ Auth0 no funciona
**Solución:** Verifica que `auth.coderic.org` esté operativo

---

## 📊 Verificar Despliegue

### Checklist Post-Despliegue

- [ ] Sitio carga en `https://coderic-cloud.pages.dev`
- [ ] Navegación funciona (menú principal)
- [ ] Todas las páginas cargan:
  - [ ] `/infrastructure`
  - [ ] `/platform`
  - [ ] `/software`
  - [ ] `/big-data`
  - [ ] `/large-scale`
- [ ] Autenticación Auth0 funciona
- [ ] Imágenes se cargan correctamente
- [ ] CSS aplicado correctamente
- [ ] Sin errores en consola del navegador
- [ ] SEO verificado (`/sitemap.xml`, `/robots.txt`)

---

## 🎯 Próximos Pasos Opcionales

### Performance
- Optimizar imágenes grandes
- Habilitar compresión Brotli
- Configurar cache agresivo

### Seguridad
- Headers adicionales en `cloudflare.toml`
- Rate limiting
- DDoS protection (ya incluido)

### Analytics
- Agregar Google Analytics
- Cloudflare Web Analytics
- Tracking de conversiones

---

## 📞 Contacto

Si tienes problemas:
- 📧 Email: coderic@coderic.org
- 📚 Docs: [Cloudflare Pages](https://developers.cloudflare.com/pages/)
- 🐛 Issues: Abre un issue en el repositorio

---

**✅ Cuando completes estos pasos, tu sitio estará live en Cloudflare Pages!**

