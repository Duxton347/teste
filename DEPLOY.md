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

Adicione no painel da Hostinger (Seção: Environment Variables / Variáveis de Ambiente):
- `VITE_SUPABASE_URL` = sua URL do Supabase
- `VITE_SUPABASE_ANON_KEY` = sua chave anônima

> [!IMPORTANT]
> **APÓS ADICIONAR AS VARIÁVEIS, VOCÊ DEVE FAZER UM NOVO DEPLOY!**
> O Hostinger NÃO atualiza o site automaticamente só de salvar as variáveis.
> Vá em **Deployments** -> Clique nos **3 pontinhos** do último deploy -> **Redeploy**.

### Solução de Problemas "Failed to fetch"
Se você ver o erro "CRITICAL ERROR: Supabase environment variables are missing!" no console:
1. Verifique se digitou o nome EXATO: `VITE_SUPABASE_URL` (tudo maiúsculo).
2. Verifique se o valor não tem espaços extras.
3. **Faça o Redeploy** (Reconstruir) para que o Vite possa "tatuar" essas variáveis no código.

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

- ✅ O projeto é um **SPA (Single Page Application)**
- ✅ A pasta `dist` contém TODOS os arquivos necessários
- ⚠️ **Importante**: Para o deploy funcionar, configure as VARIÁVEIS DE AMBIENTE no painel da Hostinger (veja seção Passo 3 acima).
- ⚠️ **Supabase**: Certifique-se de que a `VITE_SUPABASE_ANON_KEY` configurada na Hostinger é EXATAMENTE a mesma do seu painel Supabase.
- 🔧 **Build Fix**: O arquivo `Sales.tsx` foi renomeado para `SalesView.tsx` para evitar erros de deploy no Linux.
