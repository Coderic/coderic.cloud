# 🚀 Despliegue con Wrangler CLI - Coderic Cloud

## ✅ Proyecto Cloudflare Pages Creado

El proyecto **coderic-cloud** ya está creado en Cloudflare Pages:
- **URL temporal**: `https://coderic-cloud.pages.dev`
- **Estado**: Listo para desplegar

---

## 🎯 Opción 1: Despliegue con Git Integration (Recomendado)

Como Jekyll requiere Ruby para compilar localmente, la mejor opción es conectar un repositorio Git.

### Paso 1: Subir código a GitHub

```bash
git add .
git commit -m "Add Cloudflare Pages configuration"
git push origin master
```

### Paso 2: Conectar con Cloudflare Pages

1. Ve a: **https://dash.cloudflare.com/**
2. **Workers & Pages** → **Pages** → **coderic-cloud**
3. Clic en: **"Custom domains"** → **"Set up a custom domain"**
4. Ingresa: **`coderic.cloud`**
5. Verifica la información DNS que Cloudflare te proporciona

### Paso 3: Configurar DNS

Cloudflare te pedirá agregar estos registros DNS:

**Opción A: Si coderic.cloud ya está en Cloudflare**
- Cloudflare configurará automáticamente los DNS
- Solo necesitas aprobar

**Opción B: Si coderic.cloud está en otro proveedor**
- Agrega los registros CNAME que Cloudflare te indique
- Espera 1-24 horas a que se propague

### Paso 4: Configurar Git Connection

1. En el proyecto **coderic-cloud** en Cloudflare
2. Ve a: **Deployments** → **Connect Git**
3. Autoriza Cloudflare para acceder a GitHub
4. Selecciona tu repositorio
5. Configura:
   - **Production branch**: `master`
   - **Build command**: `bundle exec jekyll build`
   - **Build output directory**: `_site`
   - **Root directory**: `/` (raíz)
   - **Environment variables**:
     - `RUBY_VERSION`: `3.1.3`

6. Clic en **"Save and Deploy"**

---

## 🎯 Opción 2: Despliegue Manual con Wrangler (Requiere Ruby)

Si tienes Ruby instalado localmente, puedes desplegar directamente:

```bash
# 1. Instalar dependencias
bundle install

# 2. Compilar el sitio
bundle exec jekyll build

# 3. Desplegar con Wrangler
wrangler pages deploy _site --project-name=coderic-cloud
```

---

## 🔗 Configurar Dominio Personalizado

Ahora vamos a configurar `coderic.cloud`:

### Método 1: Desde Cloudflare Dashboard (Más Fácil)

1. **Cloudflare Dashboard** → **Workers & Pages** → **coderic-cloud**
2. **Custom domains** → **Set up a custom domain**
3. Ingresa: **`coderic.cloud`**
4. Cloudflare te mostrará los DNS necesarios

### Método 2: Con Wrangler CLI

```bash
# Ver dominios actuales
wrangler pages domain list coderic-cloud

# Agregar dominio personalizado
# (Este comando requiere que el dominio ya esté agregado en la cuenta Cloudflare)
```

---

## 📝 Verificar la Configuración DNS

### Si coderic.cloud está en Cloudflare DNS:

1. Ve a **DNS** en Cloudflare
2. Busca el dominio `coderic.cloud`
3. Verifica que tenga un registro CNAME o página gestionada

### Si coderic.cloud NO está en Cloudflare:

**Pasos para agregarlo:**

1. En Cloudflare Dashboard: **Add a Site**
2. Ingresa: `coderic.cloud`
3. Sigue el asistente para transferir tu dominio
4. Luego, en **Workers & Pages**, agrega el dominio personalizado

---

## 🔍 Verificar Despliegue

Después de configurar Git y DNS:

```bash
# Ver estado del proyecto
wrangler pages project list

# Ver deployments recientes
wrangler pages deployment list coderic-cloud

# Ver dominio personalizado
wrangler pages domain list coderic-cloud
```

---

## ⚠️ Notas Importantes

### Jekyll en Cloudflare Pages

✅ Cloudflare Pages tiene **soporte nativo** para Jekyll:
- Detecta automáticamente el framework
- Instala Ruby y las dependencias
- Compila el sitio automáticamente

### Tema Remoto

El proyecto usa el tema: `Coderic/coderic.org`

Si este tema es privado, necesitarás:
1. Hacer que el repositorio del tema sea público, O
2. Configurar variables de entorno de autenticación

### Variables de Entorno Recomendadas

En la configuración de Git en Cloudflare Pages, agrega:

```
RUBY_VERSION=3.1.3
NODE_ENV=production
```

---

## 🎯 Checklist de Despliegue

- [x] Proyecto `coderic-cloud` creado en Cloudflare Pages
- [x] Archivo `wrangler.toml` configurado
- [x] Archivo `cloudflare.toml` con headers de seguridad
- [x] `_config.yml` actualizado con `baseurl: ""`
- [ ] Código subido a GitHub
- [ ] Git conectado en Cloudflare Pages
- [ ] Build configurado correctamente
- [ ] Dominio `coderic.cloud` agregado
- [ ] DNS configurado correctamente
- [ ] Primer despliegue exitoso
- [ ] Sitio accesible en https://coderic.cloud

---

## 🐛 Troubleshooting

### Error: "Jekyll not found during build"
**Solución:** Asegúrate de que `Gemfile` esté en el repositorio

### Error: "Remote theme not accessible"
**Solución:** Verifica que `Coderic/coderic.org` sea público o añade credenciales

### Error: "DNS not resolving"
**Solución:** 
- Espera hasta 24 horas para propagación
- Verifica los registros DNS con `dig coderic.cloud`

### Dominio no se agrega en Cloudflare
**Solución:**
- El dominio debe estar primero en tu cuenta Cloudflare DNS
- Usa el Dashboard web para agregar dominios personalizados

---

## 📚 Comandos Wrangler Útiles

```bash
# Listar proyectos
wrangler pages project list

# Ver detalles de un proyecto
wrangler pages project get coderic-cloud

# Ver deployments
wrangler pages deployment list coderic-cloud

# Ver dominios
wrangler pages domain list coderic-cloud

# Ver logs de un deployment
wrangler pages deployment tail coderic-cloud

# Desplegar carpeta (requiere build previo)
wrangler pages deploy _site --project-name=coderic-cloud
```

---

## ✨ Resultado Final

Cuando todo esté configurado:

✅ Sitio accesible en: `https://coderic.cloud`  
✅ SSL automático  
✅ CDN global de Cloudflare  
✅ Despliegues automáticos en cada push  
✅ Preview deployments en PRs  
✅ Logs en tiempo real  

---

**Próximo paso**: Sube tu código a GitHub y conecta Git en Cloudflare Pages Dashboard.

