#!/bin/bash

echo "📊 Anjana Narasinghe Portfolio - Container Status"
echo "================================================"
echo ""

# Check if any portfolio containers are running
echo "🔍 Checking for running portfolio containers..."
echo ""

# Check for docker-compose containers
if docker-compose ps 2>/dev/null | grep -q "anjana-portfolio"; then
    echo "📋 Docker Compose Status:"
    docker-compose ps
    echo ""
fi

# Check for standalone containers
if docker ps --filter "name=anjana-portfolio" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}" | grep -q "anjana-portfolio"; then
    echo "📋 Standalone Container Status:"
    docker ps --filter "name=anjana-portfolio" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}"
    echo ""
fi

# Check if no containers are running
if ! docker ps --filter "name=anjana-portfolio" | grep -q "anjana-portfolio"; then
    echo "⚠️  No portfolio containers are currently running."
    echo ""
    echo "🚀 To start your portfolio:"
    echo "   Option 1: ./deploy-production.sh"
    echo "   Option 2: docker-compose up -d --build"
    echo "   Option 3: ./build-and-run.sh"
    echo ""
else
    echo "✅ Portfolio is running!"
    echo ""
    echo "🌐 Access your portfolio at: http://localhost:8002"
    echo ""
    echo "📋 Management Commands:"
    echo "======================="
    echo "📝 View logs:     docker logs anjana-portfolio"
    echo "🛑 Stop:          docker stop anjana-portfolio"
    echo "🔄 Restart:       docker restart anjana-portfolio"
    echo "🗑️  Remove:        docker rm -f anjana-portfolio"
    echo ""
fi

# Check port availability
echo "🔌 Port 8002 Status:"
if netstat -tuln 2>/dev/null | grep -q ":8002 "; then
    echo "✅ Port 8002 is in use (portfolio is accessible)"
else
    echo "❌ Port 8002 is not in use"
fi
echo ""

# Check if portfolio is accessible
echo "🌐 Testing portfolio accessibility..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8002/ | grep -q "200"; then
    echo "✅ Portfolio is accessible at http://localhost:8002"
else
    echo "❌ Portfolio is not accessible at http://localhost:8002"
fi
