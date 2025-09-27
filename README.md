# Shyness App - Build Confidence Through Daily Practice

A comprehensive web platform designed to help users overcome shyness and improve public speaking skills through daily video uploads, streak tracking, and reward systems.

## 🚀 Features

### Core Functionality
- **User Authentication**: Secure signup/login with JWT tokens
- **Topic Selection**: Curated pool of speaking topics with different difficulty levels
- **Video Upload**: Cloud-based video storage with validation
- **Streak Tracking**: Daily upload tracking with streak rewards
- **Reward System**: Badges and achievements for milestones
- **Dashboard**: Comprehensive progress tracking and statistics

### Video Validation
- **Duration Check**: Minimum 30 seconds required
- **Audio Validation**: Ensures video has audio track
- **Face Detection**: Uses OpenCV to verify face presence
- **File Validation**: Supports MP4, WebM, MOV formats up to 100MB

### Reward System
- **Streak Rewards**: 3, 7, 14, 30, 60-day streak badges
- **Video Count Rewards**: Milestones at 1, 3, 10, 25, 50 videos
- **Achievement System**: Points-based reward system
- **Rarity Levels**: Common, Uncommon, Rare, Epic, Legendary

## 🛠 Tech Stack

### Backend
- **Node.js** with Express.js framework
- **MongoDB** with Mongoose ODM
- **JWT** for authentication
- **Cloudinary** for video storage
- **FFmpeg** for video processing
- **OpenCV** for face detection

### Frontend
- **React 18** with functional components
- **React Router** for navigation
- **React Query** for data fetching
- **React Hook Form** for form handling
- **Tailwind CSS** for styling
- **Lucide React** for icons

## 📁 Project Structure

```
ShynessApp/
├── backend/
│   ├── controllers/          # Route controllers
│   ├── middleware/           # Auth, validation, upload middleware
│   ├── models/              # MongoDB models
│   ├── routes/              # API routes
│   ├── services/            # Business logic services
│   ├── scripts/             # Database seeding scripts
│   └── server.js            # Main server file
├── frontend/
│   ├── public/              # Static assets
│   ├── src/
│   │   ├── components/      # Reusable components
│   │   ├── contexts/        # React contexts
│   │   ├── pages/           # Page components
│   │   ├── services/        # API services
│   │   └── App.js           # Main app component
│   └── package.json
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- Node.js (v16 or higher)
- MongoDB (local or cloud instance)
- Cloudinary account
- FFmpeg installed on system

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ShynessApp
   ```

2. **Install dependencies**
   ```bash
   npm run install-all
   ```

3. **Environment Setup**
   
   Create `backend/.env` file:
   ```env
   NODE_ENV=development
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/shyness-app
   JWT_SECRET=your-super-secret-jwt-key-here
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

4. **Database Setup**
   ```bash
   cd backend
   node scripts/seedData.js
   ```

5. **Start the application**
   ```bash
   npm run dev
   ```

   This will start both backend (port 5000) and frontend (port 3000) servers.

## 📚 API Documentation

### Authentication Endpoints
- `POST /api/auth/signup` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user
- `PUT /api/auth/profile` - Update user profile

### Topics Endpoints
- `GET /api/topics` - Get all topics (with filters)
- `GET /api/topics/:id` - Get single topic
- `GET /api/topics/random` - Get random topic
- `POST /api/topics` - Create topic (admin only)
- `PUT /api/topics/:id` - Update topic (admin only)
- `DELETE /api/topics/:id` - Delete topic (admin only)

### Videos Endpoints
- `POST /api/videos/upload` - Upload video
- `GET /api/videos/my-videos` - Get user's videos
- `GET /api/videos/:id` - Get single video
- `PUT /api/videos/:id` - Update video
- `DELETE /api/videos/:id` - Delete video

### User Endpoints
- `GET /api/user/streak` - Get streak information
- `GET /api/user/rewards` - Get user rewards
- `GET /api/user/dashboard` - Get dashboard data
- `GET /api/user/stats` - Get detailed statistics

## 🎯 Usage Guide

### For Users

1. **Registration**: Create an account with email and password
2. **Topic Selection**: Choose from curated speaking topics
3. **Video Recording**: Record yourself speaking about the topic
4. **Upload**: Upload video with title and description
5. **Track Progress**: Monitor streaks, rewards, and statistics
6. **Build Confidence**: Practice daily to improve speaking skills

### For Administrators

1. **Topic Management**: Add, edit, or remove speaking topics
2. **User Management**: Monitor user activity and progress
3. **Reward Configuration**: Customize reward system
4. **Analytics**: View platform usage statistics

## 🔧 Configuration

### Video Validation Settings
- Minimum duration: 30 seconds
- Maximum file size: 100MB
- Supported formats: MP4, WebM, MOV
- Required: Audio track and face detection

### Streak System
- Daily uploads required to maintain streak
- Streak resets after missing a day
- Rewards unlock at: 3, 7, 14, 30, 60 days

### Reward System
- Points awarded for various achievements
- Rarity levels: Common, Uncommon, Rare, Epic, Legendary
- Categories: Streak, Total Videos, Consistency, Improvement

## 🚀 Deployment

### Backend Deployment
1. Set up MongoDB Atlas or local MongoDB instance
2. Configure Cloudinary account
3. Set environment variables
4. Deploy to Heroku, AWS, or similar platform

### Frontend Deployment
1. Build the React app: `npm run build`
2. Deploy to Netlify, Vercel, or similar platform
3. Update API endpoints in production

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support, email support@shynessapp.com or create an issue in the repository.

## 🔮 Future Enhancements

- [ ] AI-powered speech analysis
- [ ] Community features and sharing
- [ ] Mobile app development
- [ ] Advanced analytics dashboard
- [ ] Integration with video conferencing tools
- [ ] Multi-language support
- [ ] Advanced reward customization
- [ ] Social features and challenges

---

Built with ❤️ to help people overcome shyness and build confidence through daily practice.

