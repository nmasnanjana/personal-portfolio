#!/bin/bash

echo "🚀 Production Deployment - Anjana Narasinghe Portfolio"
echo "=================================================="
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

echo "🐳 Building production Docker image..."
docker build -t anjana-portfolio:prod .

if [ $? -ne 0 ]; then
    echo "❌ Docker build failed!"
    exit 1
fi

echo "✅ Docker image built successfully!"
echo ""

# Stop and remove existing containers
echo "🔄 Cleaning up existing containers..."
docker stop anjana-portfolio-prod 2>/dev/null || true
docker rm anjana-portfolio-prod 2>/dev/null || true

echo "🚀 Deploying portfolio in production mode..."
echo ""

# Deploy with production settings
docker run -d \
    --name anjana-portfolio-prod \
    --restart unless-stopped \
    -p 8002:8002 \
    --health-cmd="curl -f http://localhost:8002/ || exit 1" \
    --health-interval=30s \
    --health-timeout=3s \
    --health-retries=3 \
    anjana-portfolio:prod

if [ $? -eq 0 ]; then
    echo "✅ Production deployment successful!"
    echo ""
    echo "📊 Container Information:"
    echo "=========================="
    docker ps --filter "name=anjana-portfolio-prod" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}"
    echo ""
    echo "🌐 Access Information:"
    echo "====================="
    echo "📱 Portfolio: http://localhost:8002"
    echo "🔍 Sitemap: http://localhost:8002/sitemap.xml"
    echo "🤖 Robots: http://localhost:8002/robots.txt"
    echo ""
    echo "🔄 Auto-Restart: ENABLED (will restart on machine reboot)"
    echo "🏥 Health Checks: ENABLED"
    echo "📝 Detached Mode: ENABLED (runs in background)"
    echo ""
    echo "📋 Management Commands:"
    echo "======================="
    echo "📝 View logs:     docker logs anjana-portfolio-prod"
    echo "📊 View status:   docker ps --filter name=anjana-portfolio-prod"
    echo "🛑 Stop:          docker stop anjana-portfolio-prod"
    echo "🔄 Restart:       docker restart anjana-portfolio-prod"
    echo "🗑️  Remove:        docker rm -f anjana-portfolio-prod"
    echo ""
    echo "🎯 Your portfolio is now running in production mode!"
    echo "   It will automatically start when the machine reboots."
else
    echo "❌ Production deployment failed!"
    exit 1
fi
