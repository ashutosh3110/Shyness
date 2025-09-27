# 🚀 Shyness App - Vercel Deployment Guide

This guide will help you deploy both the frontend and backend of your Shyness App to Vercel.

## 📋 Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **GitHub Account**: Your code should be on GitHub
3. **MongoDB Atlas**: For production database
4. **Cloudinary Account**: For video uploads (optional)

## 🗄️ Database Setup (MongoDB Atlas)

### Step 1: Create MongoDB Atlas Cluster
1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a free account
3. Create a new cluster (choose the free tier)
4. Create a database user
5. Get your connection string

### Step 2: Configure Database Access
1. In Atlas dashboard, go to "Network Access"
2. Add your IP address (or use 0.0.0.0/0 for all IPs)
3. Go to "Database Access" and create a user

## 🎯 Deployment Steps

### Phase 1: Deploy Backend

#### Step 1: Prepare Backend Repository
```bash
# In your backend folder
cd backend
git init
git add .
git commit -m "Initial backend commit"
git remote add origin https://github.com/yourusername/shyness-app-backend.git
git push -u origin main
```

#### Step 2: Deploy Backend to Vercel
1. Go to [Vercel Dashboard](https://vercel.com/dashboard)
2. Click "New Project"
3. Import your backend repository
4. Configure project:
   - **Framework Preset**: Other
   - **Root Directory**: `./backend` (if using monorepo) or leave empty
   - **Build Command**: Leave empty
   - **Output Directory**: Leave empty
   - **Install Command**: `npm install`

#### Step 3: Add Backend Environment Variables
In Vercel dashboard, go to your backend project → Settings → Environment Variables:

```
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/shyness-app
JWT_SECRET=your-super-secret-jwt-key-here-make-it-very-long-and-random
JWT_EXPIRE=7d
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password
FRONTEND_URL=https://your-frontend-url.vercel.app
MAX_FILE_SIZE=104857600
ALLOWED_VIDEO_TYPES=mp4,webm,mov
MIN_VIDEO_DURATION=30
```

#### Step 4: Deploy Backend
1. Click "Deploy"
2. Wait for deployment to complete
3. Note down your backend URL (e.g., `https://shyness-app-backend.vercel.app`)

### Phase 2: Deploy Frontend

#### Step 1: Prepare Frontend Repository
```bash
# In your frontend folder
cd frontend
git init
git add .
git commit -m "Initial frontend commit"
git remote add origin https://github.com/yourusername/shyness-app-frontend.git
git push -u origin main
```

#### Step 2: Update API URL
1. Update `frontend/src/services/api.js`:
```javascript
const API_BASE_URL = process.env.REACT_APP_API_URL || 'https://your-actual-backend-url.vercel.app/api';
```

#### Step 3: Deploy Frontend to Vercel
1. Go to [Vercel Dashboard](https://vercel.com/dashboard)
2. Click "New Project"
3. Import your frontend repository
4. Configure project:
   - **Framework Preset**: Create React App
   - **Root Directory**: `./frontend` (if using monorepo) or leave empty
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`
   - **Install Command**: `npm install`

#### Step 4: Add Frontend Environment Variables
In Vercel dashboard, go to your frontend project → Settings → Environment Variables:

```
REACT_APP_API_URL=https://your-actual-backend-url.vercel.app/api
```

#### Step 5: Deploy Frontend
1. Click "Deploy"
2. Wait for deployment to complete
3. Note down your frontend URL (e.g., `https://shyness-app-frontend.vercel.app`)

## 🔄 Update Backend with Frontend URL

After getting your frontend URL, update the backend environment variables:
1. Go to backend project in Vercel
2. Update `FRONTEND_URL` with your actual frontend URL
3. Redeploy the backend

## 🧪 Testing Deployment

### Test Backend
```bash
# Test if backend is running
curl https://your-backend-url.vercel.app/api/auth/me
```

### Test Frontend
1. Visit your frontend URL
2. Try to register a new user
3. Test login functionality
4. Test video upload (if configured)

## 🛠️ Troubleshooting

### Common Issues

#### 1. CORS Errors
- Make sure `FRONTEND_URL` in backend environment variables matches your frontend URL
- Check CORS configuration in `server.js`

#### 2. Database Connection Issues
- Verify MongoDB Atlas connection string
- Check network access settings in Atlas
- Ensure database user has proper permissions

#### 3. Environment Variables Not Working
- Make sure all environment variables are set in Vercel dashboard
- Redeploy after adding new environment variables
- Check variable names match exactly

#### 4. Build Failures
- Check build logs in Vercel dashboard
- Ensure all dependencies are in `package.json`
- Verify Node.js version compatibility

## 📊 Production Checklist

- [ ] MongoDB Atlas cluster created and configured
- [ ] Backend deployed to Vercel
- [ ] Frontend deployed to Vercel
- [ ] All environment variables set
- [ ] CORS configured correctly
- [ ] Email service configured (for password reset)
- [ ] Cloudinary configured (for video uploads)
- [ ] SSL certificates active (automatic with Vercel)
- [ ] Custom domain configured (optional)

## 🔐 Security Considerations

1. **Environment Variables**: Never commit `.env` files to Git
2. **JWT Secret**: Use a strong, random JWT secret
3. **Database Access**: Restrict MongoDB Atlas network access
4. **CORS**: Only allow your frontend domain
5. **Rate Limiting**: Already configured in your backend

## 🎉 Post-Deployment

### 1. Seed Database (Optional)
If you want to add sample data:
```bash
# Connect to your MongoDB Atlas and run seed script
npm run seed
```

### 2. Create Admin User
```bash
# Create an admin user for managing the app
npm run create-admin
```

### 3. Monitor Performance
- Use Vercel Analytics (free tier available)
- Monitor MongoDB Atlas metrics
- Check Vercel function logs

## 📱 Mobile Optimization

Your app is already responsive and will work on mobile devices. Consider:
- Testing on different screen sizes
- Optimizing images and videos
- Using Vercel's Edge Network for faster loading

## 🔄 Future Updates

To update your deployed app:
1. Make changes to your code
2. Push to GitHub
3. Vercel will automatically redeploy
4. Test the new deployment

## 📞 Support

If you encounter issues:
1. Check Vercel deployment logs
2. Verify environment variables
3. Test API endpoints individually
4. Check browser console for errors

---

## 🎯 Quick Commands Summary

```bash
# Backend deployment
cd backend
git add .
git commit -m "Deploy backend"
git push origin main

# Frontend deployment
cd frontend
git add .
git commit -m "Deploy frontend"
git push origin main
```

Your Shyness App is now live! 🚀
