#!/bin/bash

echo "🚀 Starting Anjana Narasinghe Portfolio Server..."
echo "📱 Portfolio: http://localhost:8002"
echo "🔍 SEO Content: All meta tags and structured data included"
echo "📊 Sitemap: http://localhost:8002/sitemap.xml"
echo "🤖 Robots: http://localhost:8002/robots.txt"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Start the HTTP server on port 8002
python3 -m http.server 8002 --bind 0.0.0.0
