#!/bin/bash

echo "🐳 Building Anjana Narasinghe Portfolio Docker Image..."
echo ""

# Build the Docker image
docker build -t anjana-portfolio:latest .

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully!"
    echo ""
    
    # Stop and remove existing container if it exists
    echo "🔄 Stopping existing container (if any)..."
    docker stop anjana-portfolio-container 2>/dev/null || true
    docker rm anjana-portfolio-container 2>/dev/null || true
    
    echo "🚀 Starting portfolio server in detached mode on port 8002..."
    echo "📱 Access your portfolio at: http://localhost:8002"
    echo "🔍 SEO content and structured data are included"
    echo "🔄 Container will auto-restart on machine reboot"
    echo ""
    
    # Run the container in detached mode with auto-restart
    docker run -d \
        --name anjana-portfolio-container \
        --restart unless-stopped \
        -p 8002:8002 \
        anjana-portfolio:latest
    
    echo "✅ Container started successfully!"
    echo ""
    echo "📊 Container Status:"
    docker ps --filter "name=anjana-portfolio-container" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
    echo ""
    echo "📝 To view logs: docker logs anjana-portfolio-container"
    echo "🛑 To stop: docker stop anjana-portfolio-container"
    echo "🗑️  To remove: docker rm anjana-portfolio-container"
else
    echo "❌ Docker build failed!"
    exit 1
fi
