# Coderic Cloud - Despliegue en Cloudflare Pages

Este documento contiene las instrucciones para desplegar el sitio **coderic-cloud** en Cloudflare Pages.

## 🚀 Configuración del Proyecto

### Nombre del Proyecto
- **Nombre**: coderic-cloud
- **Dominio**: coderic.cloud (o el subdominio asignado por Cloudflare)

## 📋 Pre-requisitos

1. Repositorio GitHub con el código
2. Cuenta en Cloudflare con acceso a Pages
3. Ruby 3.1.3 instalado (para desarrollo local)

## 🔧 Configuración de Cloudflare Pages

### Opción 1: Despliegue desde la Interfaz Web

1. **Inicia sesión en Cloudflare**
   - Ve a [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - Navega a **Workers & Pages**

2. **Crear nuevo proyecto**
   - Haz clic en **"Crear un proyecto"**
   - Selecciona **"Conectar a Git"**
   - Autoriza Cloudflare para acceder a tu cuenta de GitHub

3. **Seleccionar repositorio**
   - Elige el repositorio que contiene este código
   - Selecciona la rama principal (generalmente `main`)

4. **Configurar el build**
   - **Nombre del proyecto**: `coderic-cloud`
   - **Comando de compilación**: `bundle exec jekyll build`
   - **Directorio de salida**: `_site`

5. **Variables de entorno**
   - `RUBY_VERSION`: `3.1.3`
   - `NODE_ENV`: `production`

6. **Desplegar**
   - Haz clic en **"Guardar y desplegar"**
   - Espera a que termine el proceso de construcción

### Opción 2: Usar Archivo de Configuración (Recomendado)

Cloudflare Pages detectará automáticamente el archivo `cloudflare.toml` que hemos creado, por lo que solo necesitas:

1. Conectar tu repositorio de GitHub
2. Cloudflare auto-detecta la configuración
3. El despliegue comenzará automáticamente

## 🌐 Dominio Personalizado

### Si ya tienes coderic.cloud

1. En la configuración del proyecto en Cloudflare Pages
2. Ve a **"Custom domains"**
3. Haz clic en **"Set up a custom domain"**
4. Ingresa `coderic.cloud`
5. Sigue las instrucciones para actualizar DNS si es necesario

### Subdominio de Cloudflare (Temporal)

Cloudflare asignará automáticamente una URL del tipo:
- `https://coderic-cloud.pages.dev`

## 🔄 Despliegues Automáticos

Cloudflare Pages se despliega automáticamente cuando:
- ✅ Se hace push a la rama principal
- ✅ Se crea un pull request (preview deployment)
- ✅ Se actualiza contenido

## 📁 Estructura de Archivos Importante

```
coderic.cloud/
├── cloudflare.toml          # Configuración de Cloudflare Pages
├── Gemfile                  # Dependencias de Ruby/Jekyll
├── .ruby-version            # Versión de Ruby
├── _config.yml              # Configuración de Jekyll
├── _cloudflare.yml          # Configuración específica para Cloudflare
├── index.html               # Página principal
├── infrastructure.html      # Página IaaS
├── platform.html            # Página PaaS
├── software.html            # Página SaaS
├── big-data.html            # Página Big Data
├── large-scale.html         # Página Large Scale
├── _includes/
│   └── portal.html         # Navegación
├── _sass/
│   └── main.scss           # Estilos SCSS
├── js/
│   └── auth.js             # Autenticación Auth0
└── images/                  # Assets de imágenes
```

## 🐛 Troubleshooting

### Error: "Jekyll command not found"
- Asegúrate de que `Gemfile` está presente en el repositorio
- Verifica que Ruby 3.1.3 esté especificado

### Error: "Remote theme not found"
- Verifica que el tema `Coderic/coderic.org` esté disponible en GitHub
- El gem `jekyll-remote-theme` debe estar en el Gemfile

### Build lento
- Los assets grandes pueden hacer el build lento
- Considera optimizar imágenes antes de subirlas

### Error de autenticación Auth0
- Verifica que `auth.js` tenga la configuración correcta
- El dominio `auth.coderic.org` debe estar operativo

## 🔐 Variables de Entorno Sensibles

No incluyas en el repositorio:
- ❌ Credenciales de Auth0 (pero el Client ID puede estar público)
- ❌ API keys privadas
- ❌ Tokens de acceso

**Configuración de Auth0 en el código:**
- El Client ID `In43D8hfptI5B17Xo7XZX4aBkhfMuH56` está hardcodeado (aceptable para SPAs)

## 📊 Monitoreo

Después del despliegue:
1. Verifica que el sitio esté accesible
2. Prueba los enlaces de navegación
3. Verifica la autenticación Auth0
4. Revisa la consola del navegador por errores

## 🔗 Enlaces Útiles

- [Cloudflare Pages Docs](https://developers.cloudflare.com/pages/)
- [Jekyll Docs](https://jekyllrb.com/docs/)
- [Auth0 Documentation](https://auth0.com/docs)

## 📝 Notas Adicionales

- El sitio usa un tema remoto de Jekyll: `Coderic/coderic.org`
- Los archivos `callback.html` y `logout.html` redirigen a la homepage
- El archivo `robots.txt` bloquea `/callback`, `/logout`, `/dashboard`
- Cloudflare proporciona HTTPS automáticamente
- Los headers de seguridad se configuran en `cloudflare.toml`

## ✅ Checklist de Despliegue

- [ ] Código subido a GitHub
- [ ] Repositorio conectado a Cloudflare Pages
- [ ] Configuración de build correcta
- [ ] Variables de entorno configuradas
- [ ] Primera compilación exitosa
- [ ] Dominio personalizado configurado (si aplica)
- [ ] Autenticación Auth0 funcionando
- [ ] Todas las páginas cargando correctamente
- [ ] SEO verificado (sitemap.xml, robots.txt)
- [ ] Rendimiento verificado con Lighthouse

---

**Proyecto**: Coderic Cloud  
**Autor**: Coderic  
**Última actualización**: 2024

