#!/bin/bash

# Shyness App Deployment Script
echo "🚀 Starting Shyness App Deployment to Vercel..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}📋 Deployment Checklist:${NC}"
echo "1. ✅ Backend and Frontend configured for Vercel"
echo "2. ✅ Environment variables documented"
echo "3. ✅ Vercel configuration files created"
echo "4. ⏳ Ready for deployment"

echo -e "\n${YELLOW}📝 Next Steps:${NC}"
echo "1. Push your code to GitHub"
echo "2. Create Vercel account at https://vercel.com"
echo "3. Deploy backend first"
echo "4. Deploy frontend second"
echo "5. Update environment variables"
echo "6. Test your deployment"

echo -e "\n${GREEN}🎯 Quick Commands:${NC}"
echo "# Backend"
echo "cd backend && git add . && git commit -m 'Deploy backend' && git push origin main"
echo ""
echo "# Frontend"
echo "cd frontend && git add . && git commit -m 'Deploy frontend' && git push origin main"

echo -e "\n${BLUE}📖 For detailed instructions, see DEPLOYMENT_GUIDE.md${NC}"

echo -e "\n${GREEN}✨ Your Shyness App is ready for deployment!${NC}"
