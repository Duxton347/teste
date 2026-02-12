# 🚀 Deploy na Hostinger - Site Estático

## ⚙️ Configuração Local (Antes de Subir)

### 1. Criar arquivo `.env` com suas credenciais Supabase
Crie um arquivo `.env` na raiz do projeto:
```env
VITE_SUPABASE_URL=https://sua-url.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anon-aqui
```

### 2. Testar o Build Localmente
```bash
npm run build
npm run preview
```
Acesse http://localhost:3000 para testar antes de subir.

---

## 📤 Deploy via GitHub → Hostinger

### Passo 1: Subir para o GitHub
```bash
git add .
git commit -m "Deploy para Hostinger"
git push origin main
```

### Passo 2: Configurar na Hostinger

**No painel da Hostinger (Node.js App):**

1. **GitHub Repository**: Conecte seu repositório
2. **Branch**: `main` (ou sua branch principal)
3. **Build Command**: `npm run build`
4. **Output Directory**: `dist`
5. **Install Command**: `npm install`
6. **Node Version**: `18.x` ou superior

### Passo 3: Variáveis de Ambiente na Hostinger

Adicione no painel da Hostinger:
- `VITE_SUPABASE_URL` = sua URL do Supabase
- `VITE_SUPABASE_ANON_KEY` = sua chave anônima

---

## 🗄️ Scripts SQL do Banco (Execute no Supabase)

Execute na ordem no SQL Editor do Supabase:
1. `route_management_updates.sql` ✅
2. `update_schema_v3.sql` ✅
3. `add_visit_notes.sql` ✅

---

## ✅ Checklist Final

- [ ] Arquivo `.env` configurado localmente
- [ ] Build testado localmente (`npm run build` + `npm run preview`)
- [ ] Código no GitHub atualizado
- [ ] Variáveis de ambiente configuradas na Hostinger
- [ ] Scripts SQL executados no Supabase
- [ ] Deploy feito via painel da Hostinger

---

## 🔧 Comandos Úteis

```bash
# Desenvolvimento local
npm run dev

# Testar build de produção
npm run build
npm run preview

# Limpar e reconstruir
rm -rf dist node_modules
npm install
npm run build
```

## 📝 Notas Importantes

- ✅ O projeto é um **SPA (Single Page Application)** - site estático React
- ✅ A pasta `dist` contém TODOS os arquivos necessários
- ✅ Não precisa de servidor Node.js rodando - apenas arquivos estáticos
- ⚠️ **NUNCA** commite o arquivo `.env` (já está no .gitignore)
- ✅ Após cada mudança: commit → push → Hostinger faz rebuild automático
