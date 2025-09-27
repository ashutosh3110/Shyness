# Deployment Guide - Shyness App

This guide covers deploying the Shyness App to production environments.

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ installed
- MongoDB database (local or cloud)
- Cloudinary account
- Domain name (optional)
- SSL certificate (recommended)

## 📋 Pre-Deployment Checklist

### Backend Setup
- [ ] Environment variables configured
- [ ] Database connection tested
- [ ] Cloudinary credentials set
- [ ] FFmpeg installed on server
- [ ] OpenCV dependencies installed

### Frontend Setup
- [ ] API endpoints updated for production
- [ ] Build process tested
- [ ] Static assets optimized

## 🔧 Environment Configuration

### Backend Environment Variables
Create a `.env` file in the backend directory:

```env
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/shyness-app
JWT_SECRET=your-super-secure-jwt-secret-key
JWT_EXPIRE=7d

# Cloudinary Configuration
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret

# File Upload Limits
MAX_FILE_SIZE=104857600
ALLOWED_VIDEO_TYPES=mp4,webm,mov

# Video Validation
MIN_VIDEO_DURATION=30
```

### Frontend Environment Variables
Create a `.env` file in the frontend directory:

```env
REACT_APP_API_URL=https://your-api-domain.com/api
REACT_APP_ENVIRONMENT=production
```

## 🐳 Docker Deployment

### Backend Dockerfile
```dockerfile
FROM node:16-alpine

WORKDIR /app

# Install FFmpeg and OpenCV dependencies
RUN apk add --no-cache ffmpeg python3 make g++

COPY package*.json ./
RUN npm ci --only=production

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
```

### Frontend Dockerfile
```dockerfile
FROM node:16-alpine as build

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Docker Compose
```yaml
version: '3.8'
services:
  backend:
    build: ./backend
    ports:
      - "5000:5000"
    environment:
      - NODE_ENV=production
      - MONGODB_URI=mongodb://mongo:27017/shyness-app
    depends_on:
      - mongo
    volumes:
      - ./backend/uploads:/app/uploads

  frontend:
    build: ./frontend
    ports:
      - "80:80"
    depends_on:
      - backend

  mongo:
    image: mongo:4.4
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

volumes:
  mongo_data:
```

## ☁️ Cloud Deployment Options

### Heroku Deployment

1. **Install Heroku CLI**
   ```bash
   npm install -g heroku
   ```

2. **Create Heroku Apps**
   ```bash
   # Backend
   heroku create shyness-app-backend
   
   # Frontend
   heroku create shyness-app-frontend
   ```

3. **Set Environment Variables**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set MONGODB_URI=your-mongodb-uri
   heroku config:set JWT_SECRET=your-jwt-secret
   # ... other variables
   ```

4. **Deploy**
   ```bash
   git subtree push --prefix backend heroku main
   ```

### AWS Deployment

#### Using Elastic Beanstalk
1. Create Elastic Beanstalk application
2. Upload backend code
3. Configure environment variables
4. Deploy frontend to S3 + CloudFront

#### Using EC2
1. Launch EC2 instance
2. Install Node.js, MongoDB, FFmpeg
3. Clone repository
4. Configure nginx reverse proxy
5. Set up PM2 for process management

### DigitalOcean Deployment

1. **Create Droplet**
   - Ubuntu 20.04 LTS
   - 2GB RAM minimum
   - 50GB SSD

2. **Server Setup**
   ```bash
   # Update system
   sudo apt update && sudo apt upgrade -y
   
   # Install Node.js
   curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
   sudo apt-get install -y nodejs
   
   # Install MongoDB
   wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
   echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
   sudo apt-get update
   sudo apt-get install -y mongodb-org
   
   # Install FFmpeg
   sudo apt install ffmpeg -y
   
   # Install PM2
   sudo npm install -g pm2
   ```

3. **Deploy Application**
   ```bash
   # Clone repository
   git clone <your-repo-url>
   cd ShynessApp
   
   # Install dependencies
   npm run install-all
   
   # Setup environment
   cd backend
   cp config.env.example .env
   # Edit .env with your values
   
   # Seed database
   npm run seed
   
   # Start with PM2
   pm2 start server.js --name "shyness-backend"
   pm2 startup
   pm2 save
   ```

4. **Configure Nginx**
   ```nginx
   server {
       listen 80;
       server_name your-domain.com;
       
       location /api {
           proxy_pass http://localhost:5000;
           proxy_http_version 1.1;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection 'upgrade';
           proxy_set_header Host $host;
           proxy_cache_bypass $http_upgrade;
       }
       
       location / {
           root /var/www/shyness-app/frontend/build;
           try_files $uri $uri/ /index.html;
       }
   }
   ```

## 🔒 Security Considerations

### SSL/TLS Configuration
- Use Let's Encrypt for free SSL certificates
- Configure HTTPS redirects
- Set secure headers

### Database Security
- Use strong passwords
- Enable authentication
- Configure firewall rules
- Regular backups

### Application Security
- Validate all inputs
- Use rate limiting
- Implement CORS properly
- Regular dependency updates

## 📊 Monitoring and Logging

### Application Monitoring
- Set up health checks
- Monitor server resources
- Track error rates
- Performance metrics

### Logging
```javascript
// Add to backend/server.js
const winston = require('winston');

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  transports: [
    new winston.transports.File({ filename: 'error.log', level: 'error' }),
    new winston.transports.File({ filename: 'combined.log' })
  ]
});
```

## 🔄 CI/CD Pipeline

### GitHub Actions Example
```yaml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Deploy to Heroku
      uses: akhileshns/heroku-deploy@v3.12.12
      with:
        heroku_api_key: ${{secrets.HEROKU_API_KEY}}
        heroku_app_name: "shyness-app-backend"
        heroku_email: "your-email@example.com"
        appdir: "backend"
```

## 🚨 Troubleshooting

### Common Issues

1. **FFmpeg not found**
   ```bash
   sudo apt install ffmpeg
   ```

2. **OpenCV installation issues**
   ```bash
   npm install opencv4nodejs --build-from-source
   ```

3. **MongoDB connection issues**
   - Check connection string
   - Verify network access
   - Check authentication

4. **Cloudinary upload failures**
   - Verify API credentials
   - Check file size limits
   - Validate file formats

### Performance Optimization

1. **Database Indexing**
   ```javascript
   // Add to models
   videoSchema.index({ user: 1, uploadDate: -1 });
   ```

2. **Caching**
   - Implement Redis for session storage
   - Cache frequently accessed data
   - Use CDN for static assets

3. **File Optimization**
   - Compress videos before upload
   - Generate multiple thumbnail sizes
   - Implement lazy loading

## 📈 Scaling Considerations

### Horizontal Scaling
- Use load balancers
- Implement database sharding
- Microservices architecture

### Vertical Scaling
- Increase server resources
- Optimize database queries
- Implement caching layers

## 🔧 Maintenance

### Regular Tasks
- [ ] Update dependencies
- [ ] Monitor disk space
- [ ] Check error logs
- [ ] Backup database
- [ ] Review security

### Backup Strategy
```bash
# MongoDB backup
mongodump --uri="mongodb://localhost:27017/shyness-app" --out=backup/

# Restore
mongorestore --uri="mongodb://localhost:27017/shyness-app" backup/shyness-app/
```

---

For additional support, refer to the main README.md or create an issue in the repository.

