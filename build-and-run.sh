#!/bin/bash

echo "🐳 Building Anjana Narasinghe Portfolio Docker Image..."
echo ""

# Build the Docker image
docker build -t anjana-portfolio:latest .

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully!"
    echo ""
    echo "🚀 Starting portfolio server on port 8002..."
    echo "📱 Access your portfolio at: http://localhost:8002"
    echo "🔍 SEO content and structured data are included"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    # Run the container
    docker run -p 8002:8002 --name anjana-portfolio-container anjana-portfolio:latest
else
    echo "❌ Docker build failed!"
    exit 1
fi
