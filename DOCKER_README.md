# 🐳 Docker Deployment Guide - Anjana Narasinghe Portfolio

## Quick Start

### Option 1: Using Docker Compose (Recommended)
```bash
# Build and run with docker-compose
docker-compose up --build

# Run in background
docker-compose up -d --build

# Stop the container
docker-compose down
```

### Option 2: Using Docker Commands
```bash
# Build the image
docker build -t anjana-portfolio:latest .

# Run the container
docker run -p 8002:8002 --name anjana-portfolio-container anjana-portfolio:latest

# Run in background
docker run -d -p 8002:8002 --name anjana-portfolio-container anjana-portfolio:latest
```

### Option 3: Using the Build Script
```bash
# Make script executable and run
chmod +x build-and-run.sh
./build-and-run.sh
```

## 🌐 Access Your Portfolio

Once running, your portfolio will be available at:
- **Main Site**: http://localhost:8002
- **Sitemap**: http://localhost:8002/sitemap.xml
- **Robots**: http://localhost:8002/robots.txt
- **Favicon**: http://localhost:8002/Youtube%20Logo.png

## 📊 SEO Features Included

✅ **Complete SEO Optimization**
- Meta tags for search engines
- Open Graph tags for social media
- Twitter Card tags
- Structured data (JSON-LD) for AI crawlers
- Sitemap.xml for search engine indexing
- Robots.txt for crawler guidance

✅ **AI Crawler Support**
- Explicitly allows AI bots (GPTBot, ChatGPT-User, CCBot, Claude-Web)
- Structured data for better AI understanding
- Professional credentials and skills clearly marked

✅ **Performance Optimized**
- Preconnect links for faster loading
- DNS prefetch for external resources
- Optimized for low-resource servers

## 🔧 Container Management

### View Running Containers
```bash
docker ps
```

### Stop Container
```bash
docker stop anjana-portfolio-container
```

### Remove Container
```bash
docker rm anjana-portfolio-container
```

### Remove Image
```bash
docker rmi anjana-portfolio:latest
```

### View Logs
```bash
docker logs anjana-portfolio-container
```

## 🚀 Production Deployment

### For Production Servers
```bash
# Build for production
docker build -t anjana-portfolio:prod .

# Run with restart policy
docker run -d \
  --name anjana-portfolio-prod \
  --restart unless-stopped \
  -p 8002:8002 \
  anjana-portfolio:prod
```

### Using Docker Compose for Production
```bash
# Run in production mode
docker-compose -f docker-compose.yml up -d --build
```

## 📁 File Structure
```
portfolio/
├── index.html              # Main portfolio page
├── styles.css              # Styling
├── script.js               # JavaScript functionality
├── Youtube Logo.png        # Favicon
├── sitemap.xml             # SEO sitemap
├── robots.txt              # Crawler instructions
├── site.webmanifest        # PWA manifest
├── Dockerfile              # Docker configuration
├── docker-compose.yml      # Docker Compose config
├── .dockerignore           # Docker ignore file
├── start.sh                # Startup script
└── build-and-run.sh        # Build and run script
```

## 🔍 SEO Verification

After deployment, verify SEO features:

1. **Check Meta Tags**: View page source to see all meta tags
2. **Test Structured Data**: Use Google's Rich Results Test
3. **Verify Sitemap**: Visit `/sitemap.xml`
4. **Check Robots**: Visit `/robots.txt`
5. **Test Social Sharing**: Share URL on social media to see Open Graph tags

## 🛠️ Troubleshooting

### Port Already in Use
```bash
# Find process using port 8002
sudo lsof -i :8002

# Kill the process
sudo kill -9 <PID>
```

### Container Won't Start
```bash
# Check logs
docker logs anjana-portfolio-container

# Rebuild without cache
docker build --no-cache -t anjana-portfolio:latest .
```

### Permission Issues
```bash
# Make scripts executable
chmod +x start.sh
chmod +x build-and-run.sh
```

## 📈 Performance Notes

- **Lightweight**: Uses Python 3.11 slim image
- **Fast Startup**: Optimized for quick container startup
- **Low Resource**: Minimal memory and CPU usage
- **SEO Ready**: All optimization features included
- **Mobile Friendly**: Responsive design works on all devices

## 🎯 Next Steps

1. **Deploy to Cloud**: Use services like AWS, Google Cloud, or DigitalOcean
2. **Set up Domain**: Point your domain to the server
3. **SSL Certificate**: Add HTTPS for better SEO
4. **CDN**: Use CloudFlare or similar for global performance
5. **Monitoring**: Set up health checks and monitoring

---

**Built with ❤️ by Anjana Narasinghe**
