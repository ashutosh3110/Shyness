# 🚀 Shyness App - Quick Deployment

## ⚡ Quick Start

1. **Read the full guide**: `DEPLOYMENT_GUIDE.md`
2. **Run deployment script**: `bash deploy.sh`
3. **Follow the steps below**

## 🎯 Essential Steps

### 1. Push to GitHub
```bash
# Backend
cd backend
git init
git add .
git commit -m "Deploy backend"
git push origin main

# Frontend  
cd frontend
git init
git add .
git commit -m "Deploy frontend"
git push origin main
```

### 2. Deploy Backend to Vercel
- Go to [Vercel](https://vercel.com)
- Import backend repository
- Add environment variables (see `backend/env.example`)
- Deploy

### 3. Deploy Frontend to Vercel
- Import frontend repository
- Add `REACT_APP_API_URL` environment variable
- Deploy

### 4. Update Backend Environment
- Set `FRONTEND_URL` to your frontend Vercel URL
- Redeploy backend

## 🔧 Environment Variables

### Backend (Required)
```
MONGODB_URI=mongodb+srv://...
JWT_SECRET=your-secret-key
FRONTEND_URL=https://your-frontend.vercel.app
```

### Frontend (Required)
```
REACT_APP_API_URL=https://your-backend.vercel.app/api
```

## ✅ Your app will be live at:
- Frontend: `https://your-app-frontend.vercel.app`
- Backend: `https://your-app-backend.vercel.app`

---
**Need help?** Check `DEPLOYMENT_GUIDE.md` for detailed instructions.
